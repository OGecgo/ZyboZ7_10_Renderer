/* Module: Vertex Transform Unit
 * Authors: Yuriy Osipyan, Evangelos Kolovos
 *
 * Summary:
 *   4×4 matrix-vector multiply unit with AXI-Stream I/O.
 *
 * Interfaces:
 *   - AXI4-Lite In:   port to load 4x4 matrix in Q16.16 fixed-point
 *   - AXI-Stream In:  {w, z, y, x} (fixed-point Q16.16 per component)
 *   - AXI-Stream Out: {w, z, y, x} (float32 per component)
 *
 * Composition:
 *   VTU_Matrix_Reg -> VTU_Matrix_Mul -> fixed_to_fp32
 *
 * Pipeline: 5 Stages
 *   S1 - Parallel multiplies
 *   S2a/S2b - Row partial sums
 *   S3 - Fixed-point resize (shift + saturate)
 *   S4 - Fixed->float32 conversion
 *
 * Usage:
 *   - Load a matrix through Axi4-Lite
 *   - Dispatch a stream of 4D Vectors
 *   - Consume transformed Vectors
 *
 * Revision
 *   - v1.0: initial streaming VTU with AXI-Lite matrix load and float32 output
 */






// Vertex Transform Unit - Top Wrapper
module Vertex_Transform_Unit (
    input  wire                         aclk,
    input  wire                         aresetn,

    // AXI4-Lite Slave (matrix load)
    input  wire [5:0]       s_axi_awaddr,
    input  wire                         s_axi_awvalid,
    output wire                         s_axi_awready,

    input  wire [32-1:0]       s_axi_wdata,
    input  wire                         s_axi_wvalid,
    output wire                         s_axi_wready,
    input  wire [(32/8)-1:0]   s_axi_wstrb, // unused by reg file

    output wire [1:0]                   s_axi_bresp,
    output wire                         s_axi_bvalid,
    input  wire                         s_axi_bready,

    input  wire [5:0]       s_axi_araddr,
    input  wire                         s_axi_arvalid,
    output wire                         s_axi_arready,
    
    output wire [32-1:0]       s_axi_rdata,
    output wire [1:0]                   s_axi_rresp,
    output wire                         s_axi_rvalid,
    input  wire                         s_axi_rready,

    

    // AXIS In (vectors)
    input  wire [(4*32)-1:0]      s_axis_tdata,
    input  wire                         s_axis_tvalid,
    output wire                         s_axis_tready,
    input  wire                         s_axis_tlast,

    // AXIS Out (transformed vectors)
    output wire [(4*32)-1:0]      m_axis_tdata,
    output wire                         m_axis_tvalid,
    input  wire                         m_axis_tready,
    output wire                         m_axis_tlast
);

    // Flattened 4x4 matrix bus (row-major) from the AXI-Lite register file
    wire [16*32-1:0] mat_flat_wire;

    // Matrix register file (AXI4-Lite write-only)
    VTU_Matrix_Reg #(
        .AXIL_ADDR_W(6),
        .AXIL_DATA_W(32)
    ) u_mat_regs (
        .s_axi_aclk    (aclk),
        .s_axi_aresetn (aresetn),

        .s_axi_awaddr  (s_axi_awaddr),
        .s_axi_awvalid (s_axi_awvalid),
        .s_axi_awready (s_axi_awready),

        .s_axi_wdata   (s_axi_wdata),
        .s_axi_wvalid  (s_axi_wvalid),
        .s_axi_wready  (s_axi_wready),

        .s_axi_bresp   (s_axi_bresp),
        .s_axi_bvalid  (s_axi_bvalid),
        .s_axi_bready  (s_axi_bready),

        .s_axi_araddr  (s_axi_araddr),
        .s_axi_arvalid (s_axi_arvalid),
        .s_axi_arready (s_axi_arready),
        .s_axi_rdata   (s_axi_rdata),
        .s_axi_rresp   (s_axi_rresp),
        .s_axi_rvalid  (s_axi_rvalid),
        .s_axi_rready  (s_axi_rready),
        
        .mat_flat      (mat_flat_wire)  // to VTU_Matrix_Mul
    );



    // 4x4 matrix-vector multiply pipeline
    VTU_Matrix_Mul #(
        .DATA_WIDTH  (32),
        .FRAC_BITS   (16)
    ) u_matmul (
        .aclk          (aclk),
        .aresetn       (aresetn),

        .mat_flat      (mat_flat_wire), // from AXI-Lite regs

        .s_axis_tdata  (s_axis_tdata),
        .s_axis_tvalid (s_axis_tvalid),
        .s_axis_tready (s_axis_tready),
        .s_axis_tlast  (s_axis_tlast),

        .m_axis_tdata  (m_axis_tdata),
        .m_axis_tvalid (m_axis_tvalid),
        .m_axis_tready (m_axis_tready),
        .m_axis_tlast  (m_axis_tlast)
    );

endmodule




// 4x4 Matrix x Vector stream
module VTU_Matrix_Mul #(
    parameter integer DATA_WIDTH = 32,   // signed data width per vector component
    parameter integer FRAC_BITS  = 16
)(
    input  wire                      aclk,
    input  wire                      aresetn,

    // Matrix input
    input  wire [16*DATA_WIDTH-1:0]  mat_flat,

    // AXI-Stream in
    input  wire [4*DATA_WIDTH-1:0]   s_axis_tdata,
    input  wire                      s_axis_tvalid,
    output wire                      s_axis_tready,
    input  wire                      s_axis_tlast,

    // AXI-Stream out
    output wire [4*DATA_WIDTH-1:0]   m_axis_tdata,
    output wire                      m_axis_tvalid,
    input  wire                      m_axis_tready,
    output wire                      m_axis_tlast
);

    // Unpack matrix
    wire signed [DATA_WIDTH-1:0] m00 =  mat_flat[    DATA_WIDTH-1:             0];
    wire signed [DATA_WIDTH-1:0] m01 =  mat_flat[  2*DATA_WIDTH-1:  1*DATA_WIDTH];
    wire signed [DATA_WIDTH-1:0] m02 =  mat_flat[  3*DATA_WIDTH-1:  2*DATA_WIDTH];
    wire signed [DATA_WIDTH-1:0] m03 =  mat_flat[  4*DATA_WIDTH-1:  3*DATA_WIDTH];
    wire signed [DATA_WIDTH-1:0] m10 =  mat_flat[  5*DATA_WIDTH-1:  4*DATA_WIDTH];
    wire signed [DATA_WIDTH-1:0] m11 =  mat_flat[  6*DATA_WIDTH-1:  5*DATA_WIDTH];
    wire signed [DATA_WIDTH-1:0] m12 =  mat_flat[  7*DATA_WIDTH-1:  6*DATA_WIDTH];
    wire signed [DATA_WIDTH-1:0] m13 =  mat_flat[  8*DATA_WIDTH-1:  7*DATA_WIDTH];
    wire signed [DATA_WIDTH-1:0] m20 =  mat_flat[  9*DATA_WIDTH-1:  8*DATA_WIDTH];
    wire signed [DATA_WIDTH-1:0] m21 =  mat_flat[ 10*DATA_WIDTH-1:  9*DATA_WIDTH];
    wire signed [DATA_WIDTH-1:0] m22 =  mat_flat[ 11*DATA_WIDTH-1: 10*DATA_WIDTH];
    wire signed [DATA_WIDTH-1:0] m23 =  mat_flat[ 12*DATA_WIDTH-1: 11*DATA_WIDTH];
    wire signed [DATA_WIDTH-1:0] m30 =  mat_flat[ 13*DATA_WIDTH-1: 12*DATA_WIDTH];
    wire signed [DATA_WIDTH-1:0] m31 =  mat_flat[ 14*DATA_WIDTH-1: 13*DATA_WIDTH];
    wire signed [DATA_WIDTH-1:0] m32 =  mat_flat[ 15*DATA_WIDTH-1: 14*DATA_WIDTH];
    wire signed [DATA_WIDTH-1:0] m33 =  mat_flat[ 16*DATA_WIDTH-1: 15*DATA_WIDTH];

    // Unpack input vector
    wire signed [DATA_WIDTH-1:0] vx_in = s_axis_tdata[  DATA_WIDTH-1:            0];
    wire signed [DATA_WIDTH-1:0] vy_in = s_axis_tdata[2*DATA_WIDTH-1: 1*DATA_WIDTH];
    wire signed [DATA_WIDTH-1:0] vz_in = s_axis_tdata[3*DATA_WIDTH-1: 2*DATA_WIDTH];
    wire signed [DATA_WIDTH-1:0] vw_in = s_axis_tdata[4*DATA_WIDTH-1: 3*DATA_WIDTH];


    // Pipeline ready/valid
    reg  stage1_valid, stage2a_valid, stage2b_valid, stage3_valid, stage4_valid;
    
    wire stage4_ready = ~stage4_valid | m_axis_tready;
    wire stage3_ready; // = ~stage3_valid  | m_axis_tready;
    wire stage2b_ready = ~stage2b_valid | stage3_ready;
    wire stage2a_ready = ~stage2a_valid | stage2b_ready;
    wire stage1_ready  = ~stage1_valid  | stage2a_ready;
    assign s_axis_tready = stage1_ready;

    

    // Stage 1: multiplies
    reg last1;
    reg signed [2*DATA_WIDTH-1:0] p00, p01, p02, p03;
    reg signed [2*DATA_WIDTH-1:0] p10, p11, p12, p13;
    reg signed [2*DATA_WIDTH-1:0] p20, p21, p22, p23;
    reg signed [2*DATA_WIDTH-1:0] p30, p31, p32, p33;

    (* use_dsp = "yes" *) wire signed [2*DATA_WIDTH-1:0] mul00 = $signed(m00) * $signed(vx_in);
    (* use_dsp = "yes" *) wire signed [2*DATA_WIDTH-1:0] mul01 = $signed(m01) * $signed(vy_in);
    (* use_dsp = "yes" *) wire signed [2*DATA_WIDTH-1:0] mul02 = $signed(m02) * $signed(vz_in);
    (* use_dsp = "yes" *) wire signed [2*DATA_WIDTH-1:0] mul03 = $signed(m03) * $signed(vw_in);

    (* use_dsp = "yes" *) wire signed [2*DATA_WIDTH-1:0] mul10 = $signed(m10) * $signed(vx_in);
    (* use_dsp = "yes" *) wire signed [2*DATA_WIDTH-1:0] mul11 = $signed(m11) * $signed(vy_in);
    (* use_dsp = "yes" *) wire signed [2*DATA_WIDTH-1:0] mul12 = $signed(m12) * $signed(vz_in);
    (* use_dsp = "yes" *) wire signed [2*DATA_WIDTH-1:0] mul13 = $signed(m13) * $signed(vw_in);

    (* use_dsp = "yes" *) wire signed [2*DATA_WIDTH-1:0] mul20 = $signed(m20) * $signed(vx_in);
    (* use_dsp = "yes" *) wire signed [2*DATA_WIDTH-1:0] mul21 = $signed(m21) * $signed(vy_in);
    (* use_dsp = "yes" *) wire signed [2*DATA_WIDTH-1:0] mul22 = $signed(m22) * $signed(vz_in);
    (* use_dsp = "yes" *) wire signed [2*DATA_WIDTH-1:0] mul23 = $signed(m23) * $signed(vw_in);

    (* use_dsp = "yes" *) wire signed [2*DATA_WIDTH-1:0] mul30 = $signed(m30) * $signed(vx_in);
    (* use_dsp = "yes" *) wire signed [2*DATA_WIDTH-1:0] mul31 = $signed(m31) * $signed(vy_in);
    (* use_dsp = "yes" *) wire signed [2*DATA_WIDTH-1:0] mul32 = $signed(m32) * $signed(vz_in);
    (* use_dsp = "yes" *) wire signed [2*DATA_WIDTH-1:0] mul33 = $signed(m33) * $signed(vw_in);

    always @(posedge aclk) begin
        if (!aresetn) begin
            stage1_valid <= 1'b0; last1 <= 1'b0;
            p00<=0; p01<=0; p02<=0; p03<=0;
            p10<=0; p11<=0; p12<=0; p13<=0;
            p20<=0; p21<=0; p22<=0; p23<=0;
            p30<=0; p31<=0; p32<=0; p33<=0;
        end
        else if (stage1_ready) begin
            stage1_valid <= s_axis_tvalid;
            if (s_axis_tvalid) begin
                p00 <= mul00; p01 <= mul01; p02 <= mul02; p03 <= mul03;
                p10 <= mul10; p11 <= mul11; p12 <= mul12; p13 <= mul13;
                p20 <= mul20; p21 <= mul21; p22 <= mul22; p23 <= mul23;
                p30 <= mul30; p31 <= mul31; p32 <= mul32; p33 <= mul33;
                last1 <= s_axis_tlast;
            end
        end
    end


    // Stage 2a: pairwise sums
    // Accumulator width & sign-extend
    localparam integer ACC_W = (2*DATA_WIDTH) + 2;    // +2 bits for sum of 4 products
    wire signed [ACC_W-1:0] p00ext = {{(ACC_W-2*DATA_WIDTH){p00[2*DATA_WIDTH-1]}}, p00};
    wire signed [ACC_W-1:0] p01ext = {{(ACC_W-2*DATA_WIDTH){p01[2*DATA_WIDTH-1]}}, p01};
    wire signed [ACC_W-1:0] p02ext = {{(ACC_W-2*DATA_WIDTH){p02[2*DATA_WIDTH-1]}}, p02};
    wire signed [ACC_W-1:0] p03ext = {{(ACC_W-2*DATA_WIDTH){p03[2*DATA_WIDTH-1]}}, p03};

    wire signed [ACC_W-1:0] p10ext = {{(ACC_W-2*DATA_WIDTH){p10[2*DATA_WIDTH-1]}}, p10};
    wire signed [ACC_W-1:0] p11ext = {{(ACC_W-2*DATA_WIDTH){p11[2*DATA_WIDTH-1]}}, p11};
    wire signed [ACC_W-1:0] p12ext = {{(ACC_W-2*DATA_WIDTH){p12[2*DATA_WIDTH-1]}}, p12};
    wire signed [ACC_W-1:0] p13ext = {{(ACC_W-2*DATA_WIDTH){p13[2*DATA_WIDTH-1]}}, p13};

    wire signed [ACC_W-1:0] p20ext = {{(ACC_W-2*DATA_WIDTH){p20[2*DATA_WIDTH-1]}}, p20};
    wire signed [ACC_W-1:0] p21ext = {{(ACC_W-2*DATA_WIDTH){p21[2*DATA_WIDTH-1]}}, p21};
    wire signed [ACC_W-1:0] p22ext = {{(ACC_W-2*DATA_WIDTH){p22[2*DATA_WIDTH-1]}}, p22};
    wire signed [ACC_W-1:0] p23ext = {{(ACC_W-2*DATA_WIDTH){p23[2*DATA_WIDTH-1]}}, p23};

    wire signed [ACC_W-1:0] p30ext = {{(ACC_W-2*DATA_WIDTH){p30[2*DATA_WIDTH-1]}}, p30};
    wire signed [ACC_W-1:0] p31ext = {{(ACC_W-2*DATA_WIDTH){p31[2*DATA_WIDTH-1]}}, p31};
    wire signed [ACC_W-1:0] p32ext = {{(ACC_W-2*DATA_WIDTH){p32[2*DATA_WIDTH-1]}}, p32};
    wire signed [ACC_W-1:0] p33ext = {{(ACC_W-2*DATA_WIDTH){p33[2*DATA_WIDTH-1]}}, p33};

    
    reg last2a;
    reg signed [ACC_W-1:0] sum0a, sum0b, sum1a, sum1b, sum2a, sum2b, sum3a, sum3b;

    always @(posedge aclk) begin
        if (!aresetn) begin
            stage2a_valid <= 1'b0; last2a <= 1'b0;
            sum0a<=0; sum0b<=0; sum1a<=0; sum1b<=0;
            sum2a<=0; sum2b<=0; sum3a<=0; sum3b<=0;
        end else if (stage2a_ready) begin
            stage2a_valid <= stage1_valid;
            if (stage1_valid) begin
                sum0a <= p00ext + p01ext;  sum0b <= p02ext + p03ext;
                sum1a <= p10ext + p11ext;  sum1b <= p12ext + p13ext;
                sum2a <= p20ext + p21ext;  sum2b <= p22ext + p23ext;
                sum3a <= p30ext + p31ext;  sum3b <= p32ext + p33ext;
                last2a <= last1;
            end
        end
    end

    // Stage 2b: final row sums
    reg last2b;
    reg signed [ACC_W-1:0] sum0_r, sum1_r, sum2_r, sum3_r;

    always @(posedge aclk) begin
        if (!aresetn) begin
            stage2b_valid <= 1'b0; last2b <= 1'b0;
            sum0_r<=0; sum1_r<=0; sum2_r<=0; sum3_r<=0;
        end else if (stage2b_ready) begin
            stage2b_valid <= stage2a_valid;
            if (stage2a_valid) begin
                sum0_r <= sum0a + sum0b;
                sum1_r <= sum1a + sum1b;
                sum2_r <= sum2a + sum2b;
                sum3_r <= sum3a + sum3b;
                last2b <= last2a;
            end
        end
    end

    // Stage 3: resize fixed-point sums  (shift & saturate)
    localparam signed  [DATA_WIDTH-1:0] S_MAX = {1'b0, {DATA_WIDTH-1{1'b1}}};
    localparam signed  [DATA_WIDTH-1:0] S_MIN = {1'b1, {DATA_WIDTH-1{1'b0}}};
    
    function [DATA_WIDTH-1:0] resize_fixed;
        input signed [ACC_W-1:0] acc;
        reg   signed [ACC_W-1:0] sh;
        begin
            sh = (FRAC_BITS == 0) ? acc : (acc >>> FRAC_BITS);

            //clamp to max/min
            if(sh > $signed(S_MAX))       resize_fixed = S_MAX;
            else if(sh < $signed(S_MIN))  resize_fixed = S_MIN;
            else                          resize_fixed = sh[DATA_WIDTH-1:0];
        end
    endfunction
    
    
    reg last3;
    reg signed [DATA_WIDTH-1:0] fixed_x, fixed_y, fixed_z, fixed_w;

    always @(posedge aclk) begin
        if (!aresetn) begin
            stage3_valid <= 1'b0; last3 <= 1'b0;
            fixed_x<=0; fixed_y<=0; fixed_z<=0; fixed_w<=0;
        end else if (stage3_ready) begin
            stage3_valid <= stage2b_valid;
            if (stage2b_valid) begin
                fixed_x <= resize_fixed(sum0_r);
                fixed_y <= resize_fixed(sum1_r);
                fixed_z <= resize_fixed(sum2_r);
                fixed_w <= resize_fixed(sum3_r);
                last3 <= last2b;
            end
        end
    end
    
    
    
    
    // Stage 4: Fixed -> float32
    wire [31:0] o_fpx, o_fpy, o_fpz, o_fpw;
    fixed_to_fp32  u_fx(.fixed(fixed_x), .float_out(o_fpx));
    fixed_to_fp32  u_fy(.fixed(fixed_y), .float_out(o_fpy));
    fixed_to_fp32  u_fz(.fixed(fixed_z), .float_out(o_fpz));
    fixed_to_fp32  u_fw(.fixed(fixed_w), .float_out(o_fpw));

    
    reg last4;
    reg [31:0] float_x, float_y, float_z, float_w;
    assign stage3_ready = ~stage3_valid | stage4_ready;


    always @(posedge aclk) begin
        if (!aresetn) begin
            stage4_valid <= 1'b0; last4 <= 1'b0;
            float_x <= 32'd0; float_y <= 32'd0; float_z <= 32'd0; float_w <= 32'd0;
        end else if (stage4_ready) begin
            stage4_valid <= stage3_valid;
            if (stage3_valid) begin
                float_x <= o_fpx; float_y <= o_fpy; float_z <= o_fpz; float_w <= o_fpw;
                last4 <= last3;
            end
        end
    end


    //AXIS out
    assign m_axis_tvalid = stage4_valid;
    assign m_axis_tdata  = {float_w, float_z, float_y, float_x};
    assign m_axis_tlast  = last4;
endmodule



// Q16.16 (signed, two's complement) -> IEEE-754 float32
module fixed_to_fp32 (
  input  wire [31:0] fixed,
  output wire [31:0] float_out
);
  // Sign & magnitude
  wire        sign = fixed[31];
  wire [31:0] mag  = sign ? (~fixed + 32'd1) : fixed;

  // 32-bit Leading Zero Count (5-level balanced tree)
  function automatic [5:0] fast_lzc32;
      input [31:0] x;
      reg  [31:0] s32;
      reg  [15:0] s16;
      reg   [7:0] s8;
      reg   [3:0] s4;
      reg         z16, z8, z4, z2, z1;
      reg   [5:0] acc;
  begin
      if (x == 32'd0) begin
          fast_lzc32 = 6'd32;
      end 
      else begin
          // 32 -> 16
          z16 = (x[31:16] == 16'd0);
          s32 = z16 ? {16'd0, x[15:0]} : {16'd0, x[31:16]};
          acc = z16 ? 6'd16 : 6'd0;

          // 16 -> 8
          z8  = (s32[15:8] == 8'd0);
          s16 = z8 ? s32[7:0] : s32[15:8];
          acc = acc + (z8 ? 6'd8 : 6'd0);

          // 8 -> 4
          z4  = (s16[7:4] == 4'd0);
          s8  = z4 ? s16[3:0] : s16[7:4];
          acc = acc + (z4 ? 6'd4 : 6'd0);

          // 4 -> 2
          z2  = (s8[3:2] == 2'd0);
          s4  = z2 ? s8[1:0] : s8[3:2];
          acc = acc + (z2 ? 6'd2 : 6'd0);

          // 2 -> 1
          z1  = (s4[1] == 1'b0);
          acc = acc + (z1 ? 6'd1 : 6'd0);

          fast_lzc32 = acc;
      end
  end
  endfunction

  wire [5:0] lz = fast_lzc32(mag);

  // Exponent & mantissa
  localparam [7:0] K = 8'd142;
  wire        is_zero  = (mag == 32'd0);
  wire [7:0]  exp      = is_zero ? 8'd0 : (K - lz);
  wire [31:0] norm     = mag << lz;          // leading '1' -> bit31
  wire [22:0] mantissa = is_zero ? 23'd0 : norm[30:8]; // drop implicit 1

  assign float_out = {sign, exp, mantissa};
endmodule





// VTU_Matrix_Reg: AXI4-Lite write-only 4x4 matrix register file
module VTU_Matrix_Reg #(
    parameter integer AXIL_ADDR_W = 6,   // 64 bytes (16 words)
    parameter integer AXIL_DATA_W = 32   // multiple of 8
)(
    input  wire                      s_axi_aclk,
    input  wire                      s_axi_aresetn,

    // Write address/data/resp
    input  wire [AXIL_ADDR_W-1:0]    s_axi_awaddr,
    input  wire                      s_axi_awvalid,
    output wire                      s_axi_awready,

    input  wire [AXIL_DATA_W-1:0]    s_axi_wdata,
    input  wire                      s_axi_wvalid,
    output wire                      s_axi_wready,

    output wire [1:0]                s_axi_bresp,
    output wire                      s_axi_bvalid,
    input  wire                      s_axi_bready,

    // Read address/data (stubbed)
    input  wire [AXIL_ADDR_W-1:0]    s_axi_araddr,
    input  wire                      s_axi_arvalid,
    output wire                      s_axi_arready,
    
    output wire [AXIL_DATA_W-1:0]    s_axi_rdata,
    output wire [1:0]                s_axi_rresp,
    output wire                      s_axi_rvalid,
    input  wire                      s_axi_rready,

    // Output matrix
    output wire [16*AXIL_DATA_W-1:0] mat_flat // {M15-M0} row-major
);
    localparam integer AXIL_LSB = $clog2(AXIL_DATA_W/8);

    // Matrix Storage
    reg [AXIL_DATA_W-1:0] mat_reg [0:15];

    assign mat_flat = {
        mat_reg[15], mat_reg[14], mat_reg[13], mat_reg[12],
        mat_reg[11], mat_reg[10], mat_reg[9],  mat_reg[8],
        mat_reg[7],  mat_reg[6],  mat_reg[5],  mat_reg[4],
        mat_reg[3],  mat_reg[2],  mat_reg[1],  mat_reg[0]
    };

    // Write channel state
    reg                    awready_r, wready_r, bvalid_r;
    reg  [1:0]             bresp_r;
    reg  [AXIL_ADDR_W-1:0] awaddr_r;
    reg                    aw_captured, w_captured;
    reg  [AXIL_DATA_W-1:0] wdata_r;

    assign s_axi_awready = awready_r;
    assign s_axi_wready  = wready_r;
    assign s_axi_bvalid  = bvalid_r;
    assign s_axi_bresp   = bresp_r;

    wire [AXIL_ADDR_W-AXIL_LSB-1:0] aw_word = awaddr_r[AXIL_ADDR_W-1:AXIL_LSB];

    // Read channel(stub)
    
    // Accept one AR at a time, return DECERR and zero data.
    reg rvalid_r;
    assign s_axi_arready = ~rvalid_r;
    assign s_axi_rvalid  = rvalid_r;
    assign s_axi_rresp   = 2'b11; // DECERR
    assign s_axi_rdata   = {AXIL_DATA_W{1'b0}};

    integer i;
    always @(posedge s_axi_aclk) begin
        if (!s_axi_aresetn) begin
            // init matrix
            for (i=0; i<16; i=i+1) mat_reg[i] <= {AXIL_DATA_W{1'b0}};

            // write path
            awready_r   <= 1'b0;
            wready_r    <= 1'b0;
            bvalid_r    <= 1'b0;
            bresp_r     <= 2'b00;
            awaddr_r    <= {AXIL_ADDR_W{1'b0}};
            aw_captured <= 1'b0;
            wdata_r     <= {AXIL_DATA_W{1'b0}};
            w_captured  <= 1'b0;

            // read stub
            rvalid_r    <= 1'b0;

        end 
        
        else begin
            // WRITE
            awready_r <= (!aw_captured) && (!bvalid_r || s_axi_bready);
            wready_r  <= (!w_captured)  && (!bvalid_r || s_axi_bready);

            if (awready_r && s_axi_awvalid) begin
                awaddr_r    <= s_axi_awaddr;
                aw_captured <= 1'b1;
            end
            if (wready_r && s_axi_wvalid) begin
                wdata_r    <= s_axi_wdata;
                w_captured <= 1'b1;
            end

            if (aw_captured && w_captured && !bvalid_r) begin
                if (aw_word < 16) begin
                    mat_reg[aw_word] <= wdata_r;
                    bresp_r          <= 2'b00;   // OKAY
                end else begin
                    bresp_r          <= 2'b10;  // SLVERR (bad address)
                end
                bvalid_r    <= 1'b1;
                aw_captured <= 1'b0;
                w_captured  <= 1'b0;
            end

            if (bvalid_r && s_axi_bready) bvalid_r <= 1'b0;

            // READ STUB
            if (!rvalid_r) begin
                if (s_axi_arvalid && s_axi_arready)
                    rvalid_r <= 1'b1;
            end else if (s_axi_rready) begin
                rvalid_r <= 1'b0;
            end
        end
    end
endmodule


