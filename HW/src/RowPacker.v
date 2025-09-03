module row_packer #(
  parameter integer XW        = 16,
  parameter integer YW        = 16,
  parameter integer ZW        = 32,
  parameter integer N_BUFS    = 2,      // >=2  
  parameter integer BUF_DEPTH = 256     // >=2  Power of 2
)(
  input                   clk,
  input                   rstn,

  // Input stream from rasterizer
  input                   in_valid,
  output                  in_ready,
  input  [XW-1:0]         in_x,
  input  [YW-1:0]         in_y,
  input  [ZW-1:0]         in_z,
  input                   in_flush,   // force-close current span (on triangle end)

  // Descriptor out
  output                           desc_valid,
  input                            desc_ready,
  output [XW-1:0]                  desc_x0,
  output [YW-1:0]                  desc_y,
  output [$clog2(BUF_DEPTH+1)-1:0] desc_len,
  input                            desc_done,   // consumer finished with active span

  // Active Buffer read port
  input                           read_en,
  input  [$clog2(BUF_DEPTH)-1:0]  read_addr,
  output reg [ZW-1:0]             read_data
);

  localparam integer BUF_IDX_W   = $clog2(N_BUFS);
  localparam integer SPAN_LEN_W  = $clog2(BUF_DEPTH+1);
  localparam integer MEM_ADDR_W  = $clog2(N_BUFS * BUF_DEPTH);

  function [BUF_IDX_W-1:0] inc_mod;
    input [BUF_IDX_W-1:0] v;
    begin
      inc_mod = (v == N_BUFS-1) ? {BUF_IDX_W{1'b0}} : (v + 1'b1);
    end
  endfunction

  // Metadata per slot
  reg [XW-1:0]         meta_x0  [0:N_BUFS-1];
  reg [YW-1:0]         meta_y   [0:N_BUFS-1];
  reg [SPAN_LEN_W-1:0] meta_len [0:N_BUFS-1];

  // BRAM
  wire                  a_we, b_en;
  wire [MEM_ADDR_W-1:0] a_addr, b_addr;
  wire [ZW-1:0]         a_din, b_dout;

  // Ring pointers & counters
  reg [BUF_IDX_W-1:0] free_head, closed_head, in_use_head;
  reg [BUF_IDX_W:0]   free_count, closed_count, in_use_count;

  // Current open span
  reg                 open_active;
  reg [BUF_IDX_W-1:0] open_idx;
  reg [XW-1:0]        cur_x0;
  reg [YW-1:0]        cur_y;
  reg [SPAN_LEN_W-1:0] cur_len;


  // Flow control
  wire same_row   = open_active && (in_y == cur_y);
  wire has_space  = (cur_len < BUF_DEPTH);
  wire can_append = same_row && has_space;
  wire has_free   = (free_count != 0);
  assign in_ready = can_append || has_free;
  wire accept_pixel = in_valid && in_ready;

  // Descriptor outputs (head of CLOSED queue)
  assign desc_valid = (closed_count != 0);
  assign desc_x0    = meta_x0[closed_head];
  assign desc_y     = meta_y[closed_head];
  assign desc_len   = meta_len[closed_head];

  // Write-port
  wire [MEM_ADDR_W-1:0] wr_addr_new = free_head << $clog2(BUF_DEPTH);
  wire [MEM_ADDR_W-1:0] wr_addr_app = (open_idx << $clog2(BUF_DEPTH)) + cur_len;

  assign a_we   = accept_pixel;
  assign a_din  = in_z;
  assign a_addr = can_append ? wr_addr_app : wr_addr_new;

  // Read-port (implicit current IN_USE head)
  assign b_en   = read_en && (in_use_count != 0);
  assign b_addr = (in_use_head << $clog2(BUF_DEPTH)) + read_addr;

  always @(posedge clk) begin
    if (b_en) read_data <= b_dout;
  end

  simple_dualport_bram #(
    .WIDTH (ZW),
    .DEPTH (N_BUFS * BUF_DEPTH)
  ) z_store (
    .clk    (clk),
    .a_we   (a_we),
    .a_addr (a_addr),
    .a_din  (a_din),
    .b_en   (b_en),
    .b_addr (b_addr),
    .b_dout (b_dout)
  );



  // Core Sequential Logic
  always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
      free_head    <= 0;
      closed_head  <= 0;
      in_use_head  <= 0;
      free_count   <= N_BUFS;
      closed_count <= 0;
      in_use_count <= 0;

      open_active  <= 0;
      cur_x0       <= 0;
      cur_y        <= 0;
      cur_len      <= 0;
    end 
    else begin
      // Explicit flush
      if (in_flush && open_active) begin
        meta_x0[open_idx]  <= cur_x0;
        meta_y [open_idx]  <= cur_y;
        meta_len[open_idx] <= cur_len;
        closed_count       <= closed_count + 1'b1;
        open_active        <= 0;
        cur_len            <= 0;
      end

      // Accept pixel
      if (accept_pixel) begin
        if (!can_append) begin
          // close old span
          if (open_active) begin
            meta_x0[open_idx]  <= cur_x0;
            meta_y [open_idx]  <= cur_y;
            meta_len[open_idx] <= cur_len;
            closed_count       <= closed_count + 1'b1;
          end
          // start new span
          open_idx   <= free_head;
          open_active<= 1'b1;
          cur_x0     <= in_x;
          cur_y      <= in_y;
          cur_len    <= 1;
          free_head  <= inc_mod(free_head);
          free_count <= free_count - 1'b1;
        end else begin
          cur_len <= cur_len + 1;
        end
      end

      // CLOSED -> IN_USE (on desc_ready)
      if (desc_valid && desc_ready) begin
        in_use_head  <= closed_head;
        closed_head  <= inc_mod(closed_head);
        closed_count <= closed_count - 1;
        in_use_count <= in_use_count + 1;
      end

      // IN_USE -> FREE (on desc_done)
      if (desc_done && (in_use_count != 0)) begin
        in_use_head  <= inc_mod(in_use_head);
        in_use_count <= in_use_count - 1;
        free_count   <= free_count + 1;
      end
    end
  end
endmodule







// Simple Dual-Port BRAM
module simple_dualport_bram #(
  parameter integer WIDTH = 24,
  parameter integer DEPTH = 1024
)(
  input                           clk,
  // Port A (WRITE)
  input                           a_we,
  input      [$clog2(DEPTH)-1:0]  a_addr,
  input      [WIDTH-1:0]          a_din,
  // Port B (READ)
  input                           b_en,
  input      [$clog2(DEPTH)-1:0]  b_addr,
  output reg [WIDTH-1:0]          b_dout
);
  reg [WIDTH-1:0] mem [0:DEPTH-1];

  always @(posedge clk) begin
    if (a_we) mem[a_addr] <= a_din;
    if (b_en) b_dout      <= mem[b_addr];
  end
endmodule
