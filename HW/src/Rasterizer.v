// AXIS Slave
// TDATA layout for triangle data:
// [  15:   0] minx       (16)
// [  31:  16] miny       (16)
// [  47:  32] maxx       (16)
// [  63:  48] maxy       (16)
// [  95:  64] e0_row0    (32)
// [ 127:  96] e1_row0    (32)
// [ 159: 128] e2_row0    (32)
// [ 191: 160] e0_dx      (32)
// [ 223: 192] e1_dx      (32)
// [ 255: 224] e2_dx      (32)
// [ 287: 256] e0_dy      (32)
// [ 319: 288] e1_dy      (32)
// [ 351: 320] e2_dy      (32)
// [ 383: 352] z_row0     (32)
// [ 415: 384] z_dx       (32)
// [ 447: 416] z_dy       (32)
// [ 455: 448] flags[7:0] (bit0=topLeft0, bit1=topLeft1, bit2=topLeft2; rest 0)
// [ 511: 456] reserved

// Edge-function Rasterizer
// - Make sure bbox is non zero before dispatching triangle to the raster_unit

module raster_unit #(
    parameter integer W_XY   = 16, // pixel coord bits
    parameter integer W_EDGE = 32, // edge accumulator bits
    parameter integer W_Z    = 32  // depth  bits
)(
    input  wire  clk,
    input  wire  rst_n,

    // AXIS slave (triangle data)
    input  wire [511:0] s_axis_tdata,
    input  wire         s_axis_tvalid,
    input  wire         s_axis_tlast,   // unused
    output wire         s_axis_tready,

    // Pixel out (ready/valid)
    output reg                    raster_valid,
    input  wire                   raster_ready,
    output reg                    endOfTriangle,
    
    output reg  [W_XY-1:0]        raster_X,
    output reg  [W_XY-1:0]        raster_Y,
    output reg  signed [W_Z-1:0]  raster_Z
);
    
    // FSM States
    localparam [0:0] S_IDLE = 1'b0, S_RUN = 1'b1;
    reg state, state_next;

    assign s_axis_tready = (state == S_IDLE);

    // Triangle data registers
    reg [W_XY-1:0]          minx_r, miny_r, maxx_r, maxy_r;
    reg signed [W_EDGE-1:0] e0_row, e1_row, e2_row;
    reg signed [W_EDGE-1:0] e0_cur, e1_cur, e2_cur;
    reg signed [W_EDGE-1:0] e0_dx_r, e1_dx_r, e2_dx_r;
    reg signed [W_EDGE-1:0] e0_dy_r, e1_dy_r, e2_dy_r;
    reg                     top0_r, top1_r, top2_r;
    reg signed [W_Z-1:0]    z_row, z_cur;
    reg signed [W_Z-1:0]    z_dx_r, z_dy_r;
    reg [W_XY-1:0]          x, y;

    // Helper Signals
    wire inside =
        ( (e0_cur > 0) || ( (e0_cur == 0) && top0_r) ) &&
        ( (e1_cur > 0) || ( (e1_cur == 0) && top1_r) ) &&
        ( (e2_cur > 0) || ( (e2_cur == 0) && top2_r) );

    wire advance      = (~inside) | (raster_valid & raster_ready);   // step when uncovered or after accept
    wire at_end_x     = (x == maxx_r);
    wire at_end_y     = (y == maxy_r);
    wire clearing_row = advance & at_end_x;
    wire done         = advance & at_end_x & at_end_y;

    wire load_pixel         = inside && (~raster_valid || raster_ready);   // start/refresh an offer
    wire raster_valid_offer = inside | (raster_valid & ~raster_ready);     // offer/hold logic  (next-cycle value of raster_valid)



    // Next State logic
    always @* begin
        state_next = state;
        case (state)
          S_IDLE:  if(s_axis_tvalid && s_axis_tready) state_next = S_RUN;
          S_RUN :  state_next = done ? S_IDLE : S_RUN;
          default: state_next = S_IDLE;
        endcase
    end


    // Core Sequential Logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state          <= S_IDLE;
            raster_valid   <= 1'b0;
            endOfTriangle  <= 1'b0;
            raster_X       <= {W_XY{1'b0}};
            raster_Y       <= {W_XY{1'b0}};
            raster_Z       <= {W_Z{1'b0}};
            x              <= {W_XY{1'b0}};
            y              <= {W_XY{1'b0}};
        end 
        else begin
            state          <= state_next;
            endOfTriangle  <= 1'b0;

            case (state)
              // Unpack input stream triangle data into registers
              S_IDLE: begin
                raster_valid <= 1'b0;
                if (s_axis_tvalid && s_axis_tready) begin
                    minx_r <= s_axis_tdata[15:  0];
                    miny_r <= s_axis_tdata[31: 16];
                    maxx_r <= s_axis_tdata[47: 32];
                    maxy_r <= s_axis_tdata[63: 48];

                    e0_row <= $signed(s_axis_tdata[ 95:  64]);
                    e1_row <= $signed(s_axis_tdata[127:  96]);
                    e2_row <= $signed(s_axis_tdata[159: 128]);
                    e0_cur <= $signed(s_axis_tdata[ 95:  64]);
                    e1_cur <= $signed(s_axis_tdata[127:  96]);
                    e2_cur <= $signed(s_axis_tdata[159: 128]);

                    e0_dx_r <= $signed(s_axis_tdata[191: 160]);
                    e1_dx_r <= $signed(s_axis_tdata[223: 192]);
                    e2_dx_r <= $signed(s_axis_tdata[255: 224]);
                    e0_dy_r <= $signed(s_axis_tdata[287: 256]);
                    e1_dy_r <= $signed(s_axis_tdata[319: 288]);
                    e2_dy_r <= $signed(s_axis_tdata[351: 320]);

                    z_row  <= $signed(s_axis_tdata[383: 352]);
                    z_cur  <= $signed(s_axis_tdata[383: 352]);
                    z_dx_r <= $signed(s_axis_tdata[415: 384]);
                    z_dy_r <= $signed(s_axis_tdata[447: 416]);

                    top0_r <= s_axis_tdata[448];
                    top1_r <= s_axis_tdata[449];
                    top2_r <= s_axis_tdata[450];

                    x <= s_axis_tdata[15:  0];
                    y <= s_axis_tdata[31: 16];
                end
              end

              // Scan the bounding box
              S_RUN: begin
                // Offer/hold logic; clear at row boundary (including final)
                raster_valid <= clearing_row ? 1'b0 : raster_valid_offer;

                // Start/refresh payload on offer start
                if (load_pixel) begin
                    raster_X <= x;
                    raster_Y <= y;
                    raster_Z <= z_cur;
                end

                // Step across row, or to the next row
                if (advance) begin
                    if (at_end_x) begin
                        if (at_end_y) begin
                            endOfTriangle <= 1'b1;  // pulse at completion   (state transitions to S_IDLE via next-state)
                        end 
                        else begin  // Next row
                            x <= minx_r;
                            y <= y + 1'b1;

                            e0_row <= e0_row + e0_dy_r;  e0_cur <= e0_row + e0_dy_r;
                            e1_row <= e1_row + e1_dy_r;  e1_cur <= e1_row + e1_dy_r;
                            e2_row <= e2_row + e2_dy_r;  e2_cur <= e2_row + e2_dy_r;

                            z_row  <= z_row  + z_dy_r;   z_cur  <= z_row  + z_dy_r;
                        end
                    end 
                    else begin
                        // Next pixel in same row
                        x      <= x + 1'b1;
                        e0_cur <= e0_cur + e0_dx_r;
                        e1_cur <= e1_cur + e1_dx_r;
                        e2_cur <= e2_cur + e2_dx_r;
                        z_cur  <= z_cur  + z_dx_r;
                    end
                end
              end
            endcase
        end
    end
endmodule
