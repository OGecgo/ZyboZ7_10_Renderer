// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Tue Jul  8 20:52:17 2025
// Host        : go running 64-bit Arch Linux
// Command     : write_verilog -force -mode funcsim -rename_top main_axi_mem_intercon_imp_auto_pc_1 -prefix
//               main_axi_mem_intercon_imp_auto_pc_1_ main_axi_mem_intercon_imp_auto_pc_1_sim_netlist.v
// Design      : main_axi_mem_intercon_imp_auto_pc_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module main_axi_mem_intercon_imp_auto_pc_1_axi_data_fifo_v2_1_32_axic_fifo
   (dout,
    empty,
    SR,
    aresetn_0,
    m_axi_awvalid,
    length_counter_1_reg_1_sp_1,
    empty_fwft_i_reg,
    m_axi_wvalid,
    S_AXI_AREADY_I_reg,
    \areset_d_reg[1] ,
    aclk,
    m_axi_awlen,
    rd_en,
    aresetn,
    m_axi_awvalid_0,
    command_ongoing,
    m_axi_awready,
    length_counter_1_reg,
    first_mi_word,
    s_axi_wvalid,
    m_axi_wready,
    E,
    s_axi_awvalid,
    Q);
  output [3:0]dout;
  output empty;
  output [0:0]SR;
  output aresetn_0;
  output m_axi_awvalid;
  output length_counter_1_reg_1_sp_1;
  output empty_fwft_i_reg;
  output m_axi_wvalid;
  output S_AXI_AREADY_I_reg;
  output \areset_d_reg[1] ;
  input aclk;
  input [3:0]m_axi_awlen;
  input rd_en;
  input aresetn;
  input m_axi_awvalid_0;
  input command_ongoing;
  input m_axi_awready;
  input [1:0]length_counter_1_reg;
  input first_mi_word;
  input s_axi_wvalid;
  input m_axi_wready;
  input [0:0]E;
  input s_axi_awvalid;
  input [1:0]Q;

  wire [0:0]E;
  wire [1:0]Q;
  wire [0:0]SR;
  wire S_AXI_AREADY_I_reg;
  wire aclk;
  wire \areset_d_reg[1] ;
  wire aresetn;
  wire aresetn_0;
  wire command_ongoing;
  wire [3:0]dout;
  wire empty;
  wire empty_fwft_i_reg;
  wire first_mi_word;
  wire [1:0]length_counter_1_reg;
  wire length_counter_1_reg_1_sn_1;
  wire [3:0]m_axi_awlen;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire m_axi_awvalid_0;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire rd_en;
  wire s_axi_awvalid;
  wire s_axi_wvalid;

  assign length_counter_1_reg_1_sp_1 = length_counter_1_reg_1_sn_1;
  main_axi_mem_intercon_imp_auto_pc_1_axi_data_fifo_v2_1_32_fifo_gen inst
       (.E(E),
        .Q(Q),
        .SR(SR),
        .S_AXI_AREADY_I_reg(S_AXI_AREADY_I_reg),
        .aclk(aclk),
        .\areset_d_reg[1] (\areset_d_reg[1] ),
        .aresetn(aresetn),
        .aresetn_0(aresetn_0),
        .command_ongoing(command_ongoing),
        .dout(dout),
        .empty(empty),
        .empty_fwft_i_reg(empty_fwft_i_reg),
        .first_mi_word(first_mi_word),
        .length_counter_1_reg(length_counter_1_reg),
        .length_counter_1_reg_1_sp_1(length_counter_1_reg_1_sn_1),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_awvalid_0(m_axi_awvalid_0),
        .m_axi_wready(m_axi_wready),
        .m_axi_wvalid(m_axi_wvalid),
        .rd_en(rd_en),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

module main_axi_mem_intercon_imp_auto_pc_1_axi_data_fifo_v2_1_32_fifo_gen
   (dout,
    empty,
    SR,
    aresetn_0,
    m_axi_awvalid,
    length_counter_1_reg_1_sp_1,
    empty_fwft_i_reg,
    m_axi_wvalid,
    S_AXI_AREADY_I_reg,
    \areset_d_reg[1] ,
    aclk,
    m_axi_awlen,
    rd_en,
    aresetn,
    m_axi_awvalid_0,
    command_ongoing,
    m_axi_awready,
    length_counter_1_reg,
    first_mi_word,
    s_axi_wvalid,
    m_axi_wready,
    E,
    s_axi_awvalid,
    Q);
  output [3:0]dout;
  output empty;
  output [0:0]SR;
  output aresetn_0;
  output m_axi_awvalid;
  output length_counter_1_reg_1_sp_1;
  output empty_fwft_i_reg;
  output m_axi_wvalid;
  output S_AXI_AREADY_I_reg;
  output \areset_d_reg[1] ;
  input aclk;
  input [3:0]m_axi_awlen;
  input rd_en;
  input aresetn;
  input m_axi_awvalid_0;
  input command_ongoing;
  input m_axi_awready;
  input [1:0]length_counter_1_reg;
  input first_mi_word;
  input s_axi_wvalid;
  input m_axi_wready;
  input [0:0]E;
  input s_axi_awvalid;
  input [1:0]Q;

  wire [0:0]E;
  wire [1:0]Q;
  wire [0:0]SR;
  wire S_AXI_AREADY_I_i_3_n_0;
  wire S_AXI_AREADY_I_reg;
  wire aclk;
  wire \areset_d_reg[1] ;
  wire aresetn;
  wire aresetn_0;
  wire cmd_push;
  wire command_ongoing;
  wire command_ongoing_i_2_n_0;
  wire [3:0]dout;
  wire empty;
  wire empty_fwft_i_reg;
  wire first_mi_word;
  wire full;
  wire [1:0]length_counter_1_reg;
  wire length_counter_1_reg_1_sn_1;
  wire [3:0]m_axi_awlen;
  wire m_axi_awready;
  wire m_axi_awvalid;
  wire m_axi_awvalid_0;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire rd_en;
  wire s_axi_awvalid;
  wire s_axi_wvalid;
  wire NLW_fifo_gen_inst_almost_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_almost_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_ar_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_aw_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_b_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_r_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axi_w_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_axis_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_dbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_arvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_awvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_bready_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_rready_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_wlast_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axi_wvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axis_tlast_UNCONNECTED;
  wire NLW_fifo_gen_inst_m_axis_tvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_overflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_prog_empty_UNCONNECTED;
  wire NLW_fifo_gen_inst_prog_full_UNCONNECTED;
  wire NLW_fifo_gen_inst_rd_rst_busy_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_arready_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_awready_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_bvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_rlast_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_rvalid_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axi_wready_UNCONNECTED;
  wire NLW_fifo_gen_inst_s_axis_tready_UNCONNECTED;
  wire NLW_fifo_gen_inst_sbiterr_UNCONNECTED;
  wire NLW_fifo_gen_inst_underflow_UNCONNECTED;
  wire NLW_fifo_gen_inst_valid_UNCONNECTED;
  wire NLW_fifo_gen_inst_wr_ack_UNCONNECTED;
  wire NLW_fifo_gen_inst_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_fifo_gen_inst_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_fifo_gen_inst_axis_wr_data_count_UNCONNECTED;
  wire [5:0]NLW_fifo_gen_inst_data_count_UNCONNECTED;
  wire [4:4]NLW_fifo_gen_inst_dout_UNCONNECTED;
  wire [31:0]NLW_fifo_gen_inst_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_arcache_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_fifo_gen_inst_m_axi_arlen_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_fifo_gen_inst_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_fifo_gen_inst_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_fifo_gen_inst_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_fifo_gen_inst_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_awcache_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_fifo_gen_inst_m_axi_awlen_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_fifo_gen_inst_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_fifo_gen_inst_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_fifo_gen_inst_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_fifo_gen_inst_m_axi_wdata_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_fifo_gen_inst_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_fifo_gen_inst_m_axi_wuser_UNCONNECTED;
  wire [63:0]NLW_fifo_gen_inst_m_axis_tdata_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axis_tdest_UNCONNECTED;
  wire [7:0]NLW_fifo_gen_inst_m_axis_tid_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axis_tkeep_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_m_axis_tuser_UNCONNECTED;
  wire [5:0]NLW_fifo_gen_inst_rd_data_count_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_fifo_gen_inst_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_fifo_gen_inst_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_fifo_gen_inst_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_fifo_gen_inst_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_fifo_gen_inst_s_axi_ruser_UNCONNECTED;
  wire [5:0]NLW_fifo_gen_inst_wr_data_count_UNCONNECTED;

  assign length_counter_1_reg_1_sp_1 = length_counter_1_reg_1_sn_1;
  LUT1 #(
    .INIT(2'h1)) 
    S_AXI_AREADY_I_i_1
       (.I0(aresetn),
        .O(SR));
  LUT6 #(
    .INIT(64'h22722272FFFF2272)) 
    S_AXI_AREADY_I_i_2
       (.I0(E),
        .I1(s_axi_awvalid),
        .I2(m_axi_awready),
        .I3(S_AXI_AREADY_I_i_3_n_0),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(S_AXI_AREADY_I_reg));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h4F)) 
    S_AXI_AREADY_I_i_3
       (.I0(m_axi_awvalid_0),
        .I1(full),
        .I2(command_ongoing),
        .O(S_AXI_AREADY_I_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00888A88)) 
    cmd_push_block_i_1
       (.I0(aresetn),
        .I1(m_axi_awvalid_0),
        .I2(full),
        .I3(command_ongoing),
        .I4(m_axi_awready),
        .O(aresetn_0));
  LUT6 #(
    .INIT(64'hF222FFFFD000D000)) 
    command_ongoing_i_1
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(E),
        .I3(s_axi_awvalid),
        .I4(command_ongoing_i_2_n_0),
        .I5(command_ongoing),
        .O(\areset_d_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h8808)) 
    command_ongoing_i_2
       (.I0(m_axi_awready),
        .I1(command_ongoing),
        .I2(full),
        .I3(m_axi_awvalid_0),
        .O(command_ongoing_i_2_n_0));
  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "64" *) 
  (* C_AXIS_TDEST_WIDTH = "4" *) 
  (* C_AXIS_TID_WIDTH = "8" *) 
  (* C_AXIS_TKEEP_WIDTH = "4" *) 
  (* C_AXIS_TSTRB_WIDTH = "4" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "2" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "0" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "6" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "5" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "32" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "5" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "0" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "0" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "0" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "0" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "2" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "31" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "30" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "6" *) 
  (* C_RD_DEPTH = "32" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "5" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "3" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "1" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "6" *) 
  (* C_WR_DEPTH = "32" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "5" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* is_du_within_envelope = "true" *) 
  main_axi_mem_intercon_imp_auto_pc_1_fifo_generator_v13_2_11 fifo_gen_inst
       (.almost_empty(NLW_fifo_gen_inst_almost_empty_UNCONNECTED),
        .almost_full(NLW_fifo_gen_inst_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_fifo_gen_inst_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_fifo_gen_inst_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_fifo_gen_inst_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_fifo_gen_inst_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_fifo_gen_inst_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_fifo_gen_inst_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_fifo_gen_inst_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_fifo_gen_inst_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_fifo_gen_inst_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_fifo_gen_inst_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_fifo_gen_inst_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_fifo_gen_inst_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_fifo_gen_inst_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_fifo_gen_inst_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_fifo_gen_inst_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_fifo_gen_inst_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_fifo_gen_inst_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_fifo_gen_inst_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_fifo_gen_inst_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_fifo_gen_inst_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_fifo_gen_inst_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_fifo_gen_inst_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_fifo_gen_inst_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_fifo_gen_inst_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_fifo_gen_inst_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_fifo_gen_inst_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_fifo_gen_inst_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_fifo_gen_inst_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_fifo_gen_inst_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_fifo_gen_inst_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_fifo_gen_inst_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_fifo_gen_inst_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_fifo_gen_inst_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_fifo_gen_inst_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_fifo_gen_inst_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_fifo_gen_inst_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_fifo_gen_inst_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_fifo_gen_inst_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_fifo_gen_inst_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_fifo_gen_inst_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_fifo_gen_inst_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_fifo_gen_inst_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_fifo_gen_inst_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_fifo_gen_inst_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_fifo_gen_inst_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_fifo_gen_inst_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_fifo_gen_inst_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_fifo_gen_inst_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_fifo_gen_inst_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_fifo_gen_inst_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_fifo_gen_inst_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_fifo_gen_inst_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_fifo_gen_inst_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_fifo_gen_inst_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(aclk),
        .data_count(NLW_fifo_gen_inst_data_count_UNCONNECTED[5:0]),
        .dbiterr(NLW_fifo_gen_inst_dbiterr_UNCONNECTED),
        .din({1'b0,m_axi_awlen}),
        .dout({NLW_fifo_gen_inst_dout_UNCONNECTED[4],dout}),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_fifo_gen_inst_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_fifo_gen_inst_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_fifo_gen_inst_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_fifo_gen_inst_m_axi_arid_UNCONNECTED[3:0]),
        .m_axi_arlen(NLW_fifo_gen_inst_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_fifo_gen_inst_m_axi_arlock_UNCONNECTED[1:0]),
        .m_axi_arprot(NLW_fifo_gen_inst_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_fifo_gen_inst_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_fifo_gen_inst_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_fifo_gen_inst_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_fifo_gen_inst_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_fifo_gen_inst_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_fifo_gen_inst_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_fifo_gen_inst_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_fifo_gen_inst_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_fifo_gen_inst_m_axi_awid_UNCONNECTED[3:0]),
        .m_axi_awlen(NLW_fifo_gen_inst_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_fifo_gen_inst_m_axi_awlock_UNCONNECTED[1:0]),
        .m_axi_awprot(NLW_fifo_gen_inst_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_fifo_gen_inst_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_fifo_gen_inst_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_fifo_gen_inst_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_fifo_gen_inst_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_fifo_gen_inst_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid({1'b0,1'b0,1'b0,1'b0}),
        .m_axi_bready(NLW_fifo_gen_inst_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid({1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_fifo_gen_inst_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_fifo_gen_inst_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_fifo_gen_inst_m_axi_wid_UNCONNECTED[3:0]),
        .m_axi_wlast(NLW_fifo_gen_inst_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_fifo_gen_inst_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_fifo_gen_inst_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_fifo_gen_inst_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_fifo_gen_inst_m_axis_tdata_UNCONNECTED[63:0]),
        .m_axis_tdest(NLW_fifo_gen_inst_m_axis_tdest_UNCONNECTED[3:0]),
        .m_axis_tid(NLW_fifo_gen_inst_m_axis_tid_UNCONNECTED[7:0]),
        .m_axis_tkeep(NLW_fifo_gen_inst_m_axis_tkeep_UNCONNECTED[3:0]),
        .m_axis_tlast(NLW_fifo_gen_inst_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_fifo_gen_inst_m_axis_tstrb_UNCONNECTED[3:0]),
        .m_axis_tuser(NLW_fifo_gen_inst_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_fifo_gen_inst_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_fifo_gen_inst_overflow_UNCONNECTED),
        .prog_empty(NLW_fifo_gen_inst_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_fifo_gen_inst_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_fifo_gen_inst_rd_data_count_UNCONNECTED[5:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_fifo_gen_inst_rd_rst_busy_UNCONNECTED),
        .rst(SR),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock({1'b0,1'b0}),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_fifo_gen_inst_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock({1'b0,1'b0}),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_fifo_gen_inst_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_fifo_gen_inst_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_fifo_gen_inst_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_fifo_gen_inst_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_fifo_gen_inst_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_fifo_gen_inst_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_fifo_gen_inst_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_fifo_gen_inst_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_fifo_gen_inst_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_fifo_gen_inst_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_fifo_gen_inst_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_fifo_gen_inst_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tkeep({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_fifo_gen_inst_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_fifo_gen_inst_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_fifo_gen_inst_underflow_UNCONNECTED),
        .valid(NLW_fifo_gen_inst_valid_UNCONNECTED),
        .wr_ack(NLW_fifo_gen_inst_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_fifo_gen_inst_wr_data_count_UNCONNECTED[5:0]),
        .wr_en(cmd_push),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_fifo_gen_inst_wr_rst_busy_UNCONNECTED));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h02)) 
    fifo_gen_inst_i_1
       (.I0(command_ongoing),
        .I1(full),
        .I2(m_axi_awvalid_0),
        .O(cmd_push));
  LUT6 #(
    .INIT(64'hE4E4CC664E4ECC66)) 
    \length_counter_1[1]_i_1 
       (.I0(empty_fwft_i_reg),
        .I1(length_counter_1_reg[1]),
        .I2(dout[1]),
        .I3(length_counter_1_reg[0]),
        .I4(first_mi_word),
        .I5(dout[0]),
        .O(length_counter_1_reg_1_sn_1));
  LUT3 #(
    .INIT(8'hA2)) 
    m_axi_awvalid_INST_0
       (.I0(command_ongoing),
        .I1(full),
        .I2(m_axi_awvalid_0),
        .O(m_axi_awvalid));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    m_axi_wvalid_INST_0
       (.I0(s_axi_wvalid),
        .I1(empty),
        .O(m_axi_wvalid));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h40)) 
    s_axi_wready_INST_0
       (.I0(empty),
        .I1(s_axi_wvalid),
        .I2(m_axi_wready),
        .O(empty_fwft_i_reg));
endmodule

module main_axi_mem_intercon_imp_auto_pc_1_axi_protocol_converter_v2_1_33_a_axi3_conv
   (dout,
    empty,
    SR,
    m_axi_awlen,
    m_axi_awlock,
    E,
    m_axi_awvalid,
    length_counter_1_reg_1_sp_1,
    empty_fwft_i_reg,
    m_axi_wvalid,
    m_axi_awaddr,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    aclk,
    rd_en,
    s_axi_awlock,
    aresetn,
    m_axi_awready,
    length_counter_1_reg,
    first_mi_word,
    s_axi_wvalid,
    m_axi_wready,
    s_axi_awvalid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos);
  output [3:0]dout;
  output empty;
  output [0:0]SR;
  output [3:0]m_axi_awlen;
  output [0:0]m_axi_awlock;
  output [0:0]E;
  output m_axi_awvalid;
  output length_counter_1_reg_1_sp_1;
  output empty_fwft_i_reg;
  output m_axi_wvalid;
  output [31:0]m_axi_awaddr;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  input aclk;
  input rd_en;
  input [0:0]s_axi_awlock;
  input aresetn;
  input m_axi_awready;
  input [1:0]length_counter_1_reg;
  input first_mi_word;
  input s_axi_wvalid;
  input m_axi_wready;
  input s_axi_awvalid;
  input [31:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;

  wire [0:0]E;
  wire [0:0]SR;
  wire \USE_BURSTS.cmd_queue_n_11 ;
  wire \USE_BURSTS.cmd_queue_n_12 ;
  wire \USE_BURSTS.cmd_queue_n_6 ;
  wire aclk;
  wire [1:0]areset_d;
  wire aresetn;
  wire cmd_push_block_reg_n_0;
  wire command_ongoing;
  wire [3:0]dout;
  wire empty;
  wire empty_fwft_i_reg;
  wire first_mi_word;
  wire [1:0]length_counter_1_reg;
  wire length_counter_1_reg_1_sn_1;
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awcache;
  wire [3:0]m_axi_awlen;
  wire [0:0]m_axi_awlock;
  wire [2:0]m_axi_awprot;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [2:0]m_axi_awsize;
  wire m_axi_awvalid;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire rd_en;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [3:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_wvalid;

  assign length_counter_1_reg_1_sp_1 = length_counter_1_reg_1_sn_1;
  FDRE \S_AXI_AADDR_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[0]),
        .Q(m_axi_awaddr[0]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[10] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[10]),
        .Q(m_axi_awaddr[10]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[11] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[11]),
        .Q(m_axi_awaddr[11]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[12] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[12]),
        .Q(m_axi_awaddr[12]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[13] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[13]),
        .Q(m_axi_awaddr[13]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[14] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[14]),
        .Q(m_axi_awaddr[14]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[15] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[15]),
        .Q(m_axi_awaddr[15]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[16] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[16]),
        .Q(m_axi_awaddr[16]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[17] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[17]),
        .Q(m_axi_awaddr[17]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[18] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[18]),
        .Q(m_axi_awaddr[18]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[19] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[19]),
        .Q(m_axi_awaddr[19]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[1]),
        .Q(m_axi_awaddr[1]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[20] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[20]),
        .Q(m_axi_awaddr[20]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[21] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[21]),
        .Q(m_axi_awaddr[21]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[22] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[22]),
        .Q(m_axi_awaddr[22]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[23] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[23]),
        .Q(m_axi_awaddr[23]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[24] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[24]),
        .Q(m_axi_awaddr[24]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[25] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[25]),
        .Q(m_axi_awaddr[25]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[26] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[26]),
        .Q(m_axi_awaddr[26]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[27] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[27]),
        .Q(m_axi_awaddr[27]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[28] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[28]),
        .Q(m_axi_awaddr[28]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[29] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[29]),
        .Q(m_axi_awaddr[29]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[2]),
        .Q(m_axi_awaddr[2]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[30] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[30]),
        .Q(m_axi_awaddr[30]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[31] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[31]),
        .Q(m_axi_awaddr[31]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[3]),
        .Q(m_axi_awaddr[3]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[4] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[4]),
        .Q(m_axi_awaddr[4]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[5] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[5]),
        .Q(m_axi_awaddr[5]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[6] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[6]),
        .Q(m_axi_awaddr[6]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[7] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[7]),
        .Q(m_axi_awaddr[7]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[8] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[8]),
        .Q(m_axi_awaddr[8]),
        .R(SR));
  FDRE \S_AXI_AADDR_Q_reg[9] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awaddr[9]),
        .Q(m_axi_awaddr[9]),
        .R(SR));
  FDRE \S_AXI_ABURST_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awburst[0]),
        .Q(m_axi_awburst[0]),
        .R(SR));
  FDRE \S_AXI_ABURST_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awburst[1]),
        .Q(m_axi_awburst[1]),
        .R(SR));
  FDRE \S_AXI_ACACHE_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awcache[0]),
        .Q(m_axi_awcache[0]),
        .R(SR));
  FDRE \S_AXI_ACACHE_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awcache[1]),
        .Q(m_axi_awcache[1]),
        .R(SR));
  FDRE \S_AXI_ACACHE_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awcache[2]),
        .Q(m_axi_awcache[2]),
        .R(SR));
  FDRE \S_AXI_ACACHE_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awcache[3]),
        .Q(m_axi_awcache[3]),
        .R(SR));
  FDRE \S_AXI_ALEN_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[0]),
        .Q(m_axi_awlen[0]),
        .R(SR));
  FDRE \S_AXI_ALEN_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[1]),
        .Q(m_axi_awlen[1]),
        .R(SR));
  FDRE \S_AXI_ALEN_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[2]),
        .Q(m_axi_awlen[2]),
        .R(SR));
  FDRE \S_AXI_ALEN_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlen[3]),
        .Q(m_axi_awlen[3]),
        .R(SR));
  FDRE \S_AXI_ALOCK_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awlock),
        .Q(m_axi_awlock),
        .R(SR));
  FDRE \S_AXI_APROT_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awprot[0]),
        .Q(m_axi_awprot[0]),
        .R(SR));
  FDRE \S_AXI_APROT_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awprot[1]),
        .Q(m_axi_awprot[1]),
        .R(SR));
  FDRE \S_AXI_APROT_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awprot[2]),
        .Q(m_axi_awprot[2]),
        .R(SR));
  FDRE \S_AXI_AQOS_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awqos[0]),
        .Q(m_axi_awqos[0]),
        .R(SR));
  FDRE \S_AXI_AQOS_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awqos[1]),
        .Q(m_axi_awqos[1]),
        .R(SR));
  FDRE \S_AXI_AQOS_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awqos[2]),
        .Q(m_axi_awqos[2]),
        .R(SR));
  FDRE \S_AXI_AQOS_Q_reg[3] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awqos[3]),
        .Q(m_axi_awqos[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    S_AXI_AREADY_I_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_BURSTS.cmd_queue_n_11 ),
        .Q(E),
        .R(SR));
  FDRE \S_AXI_ASIZE_Q_reg[0] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awsize[0]),
        .Q(m_axi_awsize[0]),
        .R(SR));
  FDRE \S_AXI_ASIZE_Q_reg[1] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awsize[1]),
        .Q(m_axi_awsize[1]),
        .R(SR));
  FDRE \S_AXI_ASIZE_Q_reg[2] 
       (.C(aclk),
        .CE(E),
        .D(s_axi_awsize[2]),
        .Q(m_axi_awsize[2]),
        .R(SR));
  main_axi_mem_intercon_imp_auto_pc_1_axi_data_fifo_v2_1_32_axic_fifo \USE_BURSTS.cmd_queue 
       (.E(E),
        .Q(areset_d),
        .SR(SR),
        .S_AXI_AREADY_I_reg(\USE_BURSTS.cmd_queue_n_11 ),
        .aclk(aclk),
        .\areset_d_reg[1] (\USE_BURSTS.cmd_queue_n_12 ),
        .aresetn(aresetn),
        .aresetn_0(\USE_BURSTS.cmd_queue_n_6 ),
        .command_ongoing(command_ongoing),
        .dout(dout),
        .empty(empty),
        .empty_fwft_i_reg(empty_fwft_i_reg),
        .first_mi_word(first_mi_word),
        .length_counter_1_reg(length_counter_1_reg),
        .length_counter_1_reg_1_sp_1(length_counter_1_reg_1_sn_1),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awready(m_axi_awready),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_awvalid_0(cmd_push_block_reg_n_0),
        .m_axi_wready(m_axi_wready),
        .m_axi_wvalid(m_axi_wvalid),
        .rd_en(rd_en),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_wvalid(s_axi_wvalid));
  FDRE #(
    .INIT(1'b0)) 
    \areset_d_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(SR),
        .Q(areset_d[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \areset_d_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(areset_d[0]),
        .Q(areset_d[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    cmd_push_block_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_BURSTS.cmd_queue_n_6 ),
        .Q(cmd_push_block_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    command_ongoing_reg
       (.C(aclk),
        .CE(1'b1),
        .D(\USE_BURSTS.cmd_queue_n_12 ),
        .Q(command_ongoing),
        .R(SR));
endmodule

module main_axi_mem_intercon_imp_auto_pc_1_axi_protocol_converter_v2_1_33_axi3_conv
   (m_axi_awlen,
    m_axi_awaddr,
    E,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    empty_fwft_i_reg,
    m_axi_wvalid,
    m_axi_wlast,
    aresetn,
    m_axi_awready,
    aclk,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    m_axi_wready,
    s_axi_wvalid,
    s_axi_awvalid);
  output [3:0]m_axi_awlen;
  output [31:0]m_axi_awaddr;
  output [0:0]E;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output m_axi_awvalid;
  output empty_fwft_i_reg;
  output m_axi_wvalid;
  output m_axi_wlast;
  input aresetn;
  input m_axi_awready;
  input aclk;
  input [31:0]s_axi_awaddr;
  input [3:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input m_axi_wready;
  input s_axi_wvalid;
  input s_axi_awvalid;

  wire [0:0]E;
  wire \USE_BURSTS.cmd_queue/inst/empty ;
  wire [3:0]\USE_WRITE.wr_cmd_length ;
  wire \USE_WRITE.wr_cmd_ready ;
  wire \USE_WRITE.write_addr_inst_n_13 ;
  wire \USE_WRITE.write_addr_inst_n_5 ;
  wire aclk;
  wire aresetn;
  wire empty_fwft_i_reg;
  wire first_mi_word;
  wire [1:0]length_counter_1_reg;
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awcache;
  wire [3:0]m_axi_awlen;
  wire [0:0]m_axi_awlock;
  wire [2:0]m_axi_awprot;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [2:0]m_axi_awsize;
  wire m_axi_awvalid;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [3:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_wvalid;

  main_axi_mem_intercon_imp_auto_pc_1_axi_protocol_converter_v2_1_33_a_axi3_conv \USE_WRITE.write_addr_inst 
       (.E(E),
        .SR(\USE_WRITE.write_addr_inst_n_5 ),
        .aclk(aclk),
        .aresetn(aresetn),
        .dout(\USE_WRITE.wr_cmd_length ),
        .empty(\USE_BURSTS.cmd_queue/inst/empty ),
        .empty_fwft_i_reg(empty_fwft_i_reg),
        .first_mi_word(first_mi_word),
        .length_counter_1_reg(length_counter_1_reg),
        .length_counter_1_reg_1_sp_1(\USE_WRITE.write_addr_inst_n_13 ),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awcache(m_axi_awcache),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awlock(m_axi_awlock),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awqos(m_axi_awqos),
        .m_axi_awready(m_axi_awready),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_wready(m_axi_wready),
        .m_axi_wvalid(m_axi_wvalid),
        .rd_en(\USE_WRITE.wr_cmd_ready ),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awlen(s_axi_awlen),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awqos(s_axi_awqos),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_wvalid(s_axi_wvalid));
  main_axi_mem_intercon_imp_auto_pc_1_axi_protocol_converter_v2_1_33_w_axi3_conv \USE_WRITE.write_data_inst 
       (.SR(\USE_WRITE.write_addr_inst_n_5 ),
        .aclk(aclk),
        .dout(\USE_WRITE.wr_cmd_length ),
        .empty(\USE_BURSTS.cmd_queue/inst/empty ),
        .first_mi_word(first_mi_word),
        .\length_counter_1_reg[1]_0 (length_counter_1_reg),
        .\length_counter_1_reg[1]_1 (\USE_WRITE.write_addr_inst_n_13 ),
        .\length_counter_1_reg[2]_0 (empty_fwft_i_reg),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wready(m_axi_wready),
        .rd_en(\USE_WRITE.wr_cmd_ready ),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* C_AXI_ADDR_WIDTH = "32" *) (* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) 
(* C_AXI_BUSER_WIDTH = "1" *) (* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "1" *) 
(* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_SUPPORTS_READ = "1" *) (* C_AXI_SUPPORTS_USER_SIGNALS = "0" *) 
(* C_AXI_SUPPORTS_WRITE = "1" *) (* C_AXI_WUSER_WIDTH = "1" *) (* C_FAMILY = "zynq" *) 
(* C_IGNORE_ID = "1" *) (* C_M_AXI_PROTOCOL = "1" *) (* C_S_AXI_PROTOCOL = "0" *) 
(* C_TRANSLATION_MODE = "0" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* P_AXI3 = "1" *) 
(* P_AXI4 = "0" *) (* P_AXILITE = "2" *) (* P_AXILITE_SIZE = "3'b011" *) 
(* P_CONVERSION = "2" *) (* P_DECERR = "2'b11" *) (* P_INCR = "2'b01" *) 
(* P_PROTECTION = "1" *) (* P_SLVERR = "2'b10" *) 
module main_axi_mem_intercon_imp_auto_pc_1_axi_protocol_converter_v2_1_33_axi_protocol_converter
   (aclk,
    aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awregion,
    s_axi_awqos,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arregion,
    s_axi_arqos,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awregion,
    m_axi_awqos,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arregion,
    m_axi_arqos,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready);
  input aclk;
  input aresetn;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awregion;
  input [3:0]s_axi_awqos;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arregion;
  input [3:0]s_axi_arqos;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [3:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [1:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awregion;
  output [3:0]m_axi_awqos;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [63:0]m_axi_wdata;
  output [7:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [3:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [1:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arregion;
  output [3:0]m_axi_arqos;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [63:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;

  wire \<const0> ;
  wire aclk;
  wire aresetn;
  wire m_axi_arready;
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awcache;
  wire [3:0]m_axi_awlen;
  wire [0:0]\^m_axi_awlock ;
  wire [2:0]m_axi_awprot;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [2:0]m_axi_awsize;
  wire m_axi_awvalid;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire [63:0]m_axi_rdata;
  wire m_axi_rlast;
  wire [1:0]m_axi_rresp;
  wire m_axi_rvalid;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire m_axi_wvalid;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [7:0]s_axi_arlen;
  wire [0:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [7:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_rready;
  wire [63:0]s_axi_wdata;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;

  assign m_axi_araddr[31:0] = s_axi_araddr;
  assign m_axi_arburst[1:0] = s_axi_arburst;
  assign m_axi_arcache[3:0] = s_axi_arcache;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[3:0] = s_axi_arlen[3:0];
  assign m_axi_arlock[1] = \<const0> ;
  assign m_axi_arlock[0] = s_axi_arlock;
  assign m_axi_arprot[2:0] = s_axi_arprot;
  assign m_axi_arqos[3:0] = s_axi_arqos;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2:0] = s_axi_arsize;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = s_axi_arvalid;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlock[1] = \<const0> ;
  assign m_axi_awlock[0] = \^m_axi_awlock [0];
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_bready = s_axi_bready;
  assign m_axi_rready = s_axi_rready;
  assign m_axi_wdata[63:0] = s_axi_wdata;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wstrb[7:0] = s_axi_wstrb;
  assign m_axi_wuser[0] = \<const0> ;
  assign s_axi_arready = m_axi_arready;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1:0] = m_axi_bresp;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = m_axi_bvalid;
  assign s_axi_rdata[63:0] = m_axi_rdata;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = m_axi_rlast;
  assign s_axi_rresp[1:0] = m_axi_rresp;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = m_axi_rvalid;
  GND GND
       (.G(\<const0> ));
  main_axi_mem_intercon_imp_auto_pc_1_axi_protocol_converter_v2_1_33_axi3_conv \gen_axi4_axi3.axi3_conv_inst 
       (.E(s_axi_awready),
        .aclk(aclk),
        .aresetn(aresetn),
        .empty_fwft_i_reg(s_axi_wready),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awcache(m_axi_awcache),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awlock(\^m_axi_awlock ),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awqos(m_axi_awqos),
        .m_axi_awready(m_axi_awready),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wready(m_axi_wready),
        .m_axi_wvalid(m_axi_wvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awlen(s_axi_awlen[3:0]),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awqos(s_axi_awqos),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

module main_axi_mem_intercon_imp_auto_pc_1_axi_protocol_converter_v2_1_33_w_axi3_conv
   (\length_counter_1_reg[1]_0 ,
    first_mi_word,
    rd_en,
    m_axi_wlast,
    SR,
    aclk,
    \length_counter_1_reg[1]_1 ,
    \length_counter_1_reg[2]_0 ,
    m_axi_wready,
    s_axi_wvalid,
    empty,
    dout);
  output [1:0]\length_counter_1_reg[1]_0 ;
  output first_mi_word;
  output rd_en;
  output m_axi_wlast;
  input [0:0]SR;
  input aclk;
  input \length_counter_1_reg[1]_1 ;
  input \length_counter_1_reg[2]_0 ;
  input m_axi_wready;
  input s_axi_wvalid;
  input empty;
  input [3:0]dout;

  wire [0:0]SR;
  wire aclk;
  wire [3:0]dout;
  wire empty;
  wire first_mi_word;
  wire first_mi_word_i_1_n_0;
  wire \length_counter_1[0]_i_1_n_0 ;
  wire \length_counter_1[2]_i_1_n_0 ;
  wire \length_counter_1[3]_i_1_n_0 ;
  wire \length_counter_1[4]_i_1_n_0 ;
  wire \length_counter_1[4]_i_2_n_0 ;
  wire \length_counter_1[5]_i_1_n_0 ;
  wire \length_counter_1[6]_i_1_n_0 ;
  wire \length_counter_1[7]_i_1_n_0 ;
  wire [7:2]length_counter_1_reg;
  wire [1:0]\length_counter_1_reg[1]_0 ;
  wire \length_counter_1_reg[1]_1 ;
  wire \length_counter_1_reg[2]_0 ;
  wire m_axi_wlast;
  wire m_axi_wlast_INST_0_i_1_n_0;
  wire m_axi_wlast_INST_0_i_2_n_0;
  wire m_axi_wlast_INST_0_i_3_n_0;
  wire m_axi_wready;
  wire rd_en;
  wire s_axi_wvalid;

  LUT6 #(
    .INIT(64'h0000CC000000CC04)) 
    fifo_gen_inst_i_2
       (.I0(length_counter_1_reg[7]),
        .I1(\length_counter_1_reg[2]_0 ),
        .I2(length_counter_1_reg[5]),
        .I3(first_mi_word),
        .I4(m_axi_wlast_INST_0_i_1_n_0),
        .I5(length_counter_1_reg[6]),
        .O(rd_en));
  LUT6 #(
    .INIT(64'h0F0FFFFF00010000)) 
    first_mi_word_i_1
       (.I0(length_counter_1_reg[7]),
        .I1(length_counter_1_reg[5]),
        .I2(m_axi_wlast_INST_0_i_1_n_0),
        .I3(length_counter_1_reg[6]),
        .I4(\length_counter_1_reg[2]_0 ),
        .I5(first_mi_word),
        .O(first_mi_word_i_1_n_0));
  FDSE #(
    .INIT(1'b0)) 
    first_mi_word_reg
       (.C(aclk),
        .CE(1'b1),
        .D(first_mi_word_i_1_n_0),
        .Q(first_mi_word),
        .S(SR));
  LUT6 #(
    .INIT(64'hF2FFFFFF07000000)) 
    \length_counter_1[0]_i_1 
       (.I0(first_mi_word),
        .I1(dout[0]),
        .I2(empty),
        .I3(s_axi_wvalid),
        .I4(m_axi_wready),
        .I5(\length_counter_1_reg[1]_0 [0]),
        .O(\length_counter_1[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hD8D272D2)) 
    \length_counter_1[2]_i_1 
       (.I0(\length_counter_1_reg[2]_0 ),
        .I1(m_axi_wlast_INST_0_i_3_n_0),
        .I2(length_counter_1_reg[2]),
        .I3(first_mi_word),
        .I4(dout[2]),
        .O(\length_counter_1[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hB8B474B4)) 
    \length_counter_1[3]_i_1 
       (.I0(\length_counter_1[4]_i_2_n_0 ),
        .I1(\length_counter_1_reg[2]_0 ),
        .I2(length_counter_1_reg[3]),
        .I3(first_mi_word),
        .I4(dout[3]),
        .O(\length_counter_1[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0A0A3A35AAAAAAAA)) 
    \length_counter_1[4]_i_1 
       (.I0(length_counter_1_reg[4]),
        .I1(dout[3]),
        .I2(first_mi_word),
        .I3(length_counter_1_reg[3]),
        .I4(\length_counter_1[4]_i_2_n_0 ),
        .I5(\length_counter_1_reg[2]_0 ),
        .O(\length_counter_1[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hFEAE)) 
    \length_counter_1[4]_i_2 
       (.I0(m_axi_wlast_INST_0_i_3_n_0),
        .I1(length_counter_1_reg[2]),
        .I2(first_mi_word),
        .I3(dout[2]),
        .O(\length_counter_1[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF7FF0000FFF70808)) 
    \length_counter_1[5]_i_1 
       (.I0(m_axi_wready),
        .I1(s_axi_wvalid),
        .I2(empty),
        .I3(first_mi_word),
        .I4(length_counter_1_reg[5]),
        .I5(m_axi_wlast_INST_0_i_1_n_0),
        .O(\length_counter_1[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h3EFF0D00)) 
    \length_counter_1[6]_i_1 
       (.I0(length_counter_1_reg[5]),
        .I1(first_mi_word),
        .I2(m_axi_wlast_INST_0_i_1_n_0),
        .I3(\length_counter_1_reg[2]_0 ),
        .I4(length_counter_1_reg[6]),
        .O(\length_counter_1[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3F3EFFFF30310000)) 
    \length_counter_1[7]_i_1 
       (.I0(length_counter_1_reg[6]),
        .I1(m_axi_wlast_INST_0_i_1_n_0),
        .I2(first_mi_word),
        .I3(length_counter_1_reg[5]),
        .I4(\length_counter_1_reg[2]_0 ),
        .I5(length_counter_1_reg[7]),
        .O(\length_counter_1[7]_i_1_n_0 ));
  FDRE \length_counter_1_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[0]_i_1_n_0 ),
        .Q(\length_counter_1_reg[1]_0 [0]),
        .R(SR));
  FDRE \length_counter_1_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1_reg[1]_1 ),
        .Q(\length_counter_1_reg[1]_0 [1]),
        .R(SR));
  FDRE \length_counter_1_reg[2] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[2]_i_1_n_0 ),
        .Q(length_counter_1_reg[2]),
        .R(SR));
  FDRE \length_counter_1_reg[3] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[3]_i_1_n_0 ),
        .Q(length_counter_1_reg[3]),
        .R(SR));
  FDRE \length_counter_1_reg[4] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[4]_i_1_n_0 ),
        .Q(length_counter_1_reg[4]),
        .R(SR));
  FDRE \length_counter_1_reg[5] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[5]_i_1_n_0 ),
        .Q(length_counter_1_reg[5]),
        .R(SR));
  FDRE \length_counter_1_reg[6] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[6]_i_1_n_0 ),
        .Q(length_counter_1_reg[6]),
        .R(SR));
  FDRE \length_counter_1_reg[7] 
       (.C(aclk),
        .CE(1'b1),
        .D(\length_counter_1[7]_i_1_n_0 ),
        .Q(length_counter_1_reg[7]),
        .R(SR));
  LUT5 #(
    .INIT(32'h00F000F1)) 
    m_axi_wlast_INST_0
       (.I0(length_counter_1_reg[7]),
        .I1(length_counter_1_reg[5]),
        .I2(first_mi_word),
        .I3(m_axi_wlast_INST_0_i_1_n_0),
        .I4(length_counter_1_reg[6]),
        .O(m_axi_wlast));
  LUT6 #(
    .INIT(64'hFFFFFFFEFCFCFFFE)) 
    m_axi_wlast_INST_0_i_1
       (.I0(length_counter_1_reg[4]),
        .I1(m_axi_wlast_INST_0_i_2_n_0),
        .I2(m_axi_wlast_INST_0_i_3_n_0),
        .I3(length_counter_1_reg[2]),
        .I4(first_mi_word),
        .I5(dout[2]),
        .O(m_axi_wlast_INST_0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    m_axi_wlast_INST_0_i_2
       (.I0(dout[3]),
        .I1(first_mi_word),
        .I2(length_counter_1_reg[3]),
        .O(m_axi_wlast_INST_0_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    m_axi_wlast_INST_0_i_3
       (.I0(\length_counter_1_reg[1]_0 [1]),
        .I1(dout[1]),
        .I2(\length_counter_1_reg[1]_0 [0]),
        .I3(first_mi_word),
        .I4(dout[0]),
        .O(m_axi_wlast_INST_0_i_3_n_0));
endmodule

(* CHECK_LICENSE_TYPE = "main_axi_mem_intercon_imp_auto_pc_1,axi_protocol_converter_v2_1_33_axi_protocol_converter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axi_protocol_converter_v2_1_33_axi_protocol_converter,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module main_axi_mem_intercon_imp_auto_pc_1
   (aclk,
    aresetn,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awregion,
    s_axi_awqos,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arregion,
    s_axi_arqos,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bresp,
    m_axi_bvalid,
    m_axi_bready,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_rvalid,
    m_axi_rready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK, ASSOCIATED_BUSIF S_AXI:M_AXI, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN main_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST, POLARITY ACTIVE_LOW, INSERT_VIP 0, TYPE INTERCONNECT" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 64, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN main_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [31:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLEN" *) input [7:0]s_axi_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE" *) input [2:0]s_axi_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWBURST" *) input [1:0]s_axi_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK" *) input [0:0]s_axi_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE" *) input [3:0]s_axi_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *) input [2:0]s_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREGION" *) input [3:0]s_axi_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWQOS" *) input [3:0]s_axi_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [63:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [7:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *) input s_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [31:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLEN" *) input [7:0]s_axi_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE" *) input [2:0]s_axi_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARBURST" *) input [1:0]s_axi_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK" *) input [0:0]s_axi_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE" *) input [3:0]s_axi_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *) input [2:0]s_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREGION" *) input [3:0]s_axi_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARQOS" *) input [3:0]s_axi_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [63:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *) output s_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input s_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI, DATA_WIDTH 64, PROTOCOL AXI3, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 16, PHASE 0.0, CLK_DOMAIN main_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [31:0]m_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLEN" *) output [3:0]m_axi_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWSIZE" *) output [2:0]m_axi_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWBURST" *) output [1:0]m_axi_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLOCK" *) output [1:0]m_axi_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWCACHE" *) output [3:0]m_axi_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWPROT" *) output [2:0]m_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWQOS" *) output [3:0]m_axi_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *) output m_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *) input m_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *) output [63:0]m_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *) output [7:0]m_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WLAST" *) output m_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *) output m_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *) input m_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BRESP" *) input [1:0]m_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *) input m_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *) output m_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR" *) output [31:0]m_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLEN" *) output [3:0]m_axi_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARSIZE" *) output [2:0]m_axi_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARBURST" *) output [1:0]m_axi_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLOCK" *) output [1:0]m_axi_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARCACHE" *) output [3:0]m_axi_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARPROT" *) output [2:0]m_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARQOS" *) output [3:0]m_axi_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *) output m_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *) input m_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *) input [63:0]m_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RRESP" *) input [1:0]m_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RLAST" *) input m_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *) input m_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *) output m_axi_rready;

  wire \<const0> ;
  wire aclk;
  wire aresetn;
  wire [31:0]m_axi_araddr;
  wire [1:0]m_axi_arburst;
  wire [3:0]m_axi_arcache;
  wire [3:0]m_axi_arlen;
  wire [0:0]\^m_axi_arlock ;
  wire [2:0]m_axi_arprot;
  wire [3:0]m_axi_arqos;
  wire m_axi_arready;
  wire [2:0]m_axi_arsize;
  wire m_axi_arvalid;
  wire [31:0]m_axi_awaddr;
  wire [1:0]m_axi_awburst;
  wire [3:0]m_axi_awcache;
  wire [3:0]m_axi_awlen;
  wire [0:0]\^m_axi_awlock ;
  wire [2:0]m_axi_awprot;
  wire [3:0]m_axi_awqos;
  wire m_axi_awready;
  wire [2:0]m_axi_awsize;
  wire m_axi_awvalid;
  wire m_axi_bready;
  wire [1:0]m_axi_bresp;
  wire m_axi_bvalid;
  wire [63:0]m_axi_rdata;
  wire m_axi_rlast;
  wire m_axi_rready;
  wire [1:0]m_axi_rresp;
  wire m_axi_rvalid;
  wire [63:0]m_axi_wdata;
  wire m_axi_wlast;
  wire m_axi_wready;
  wire [7:0]m_axi_wstrb;
  wire m_axi_wvalid;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [7:0]s_axi_arlen;
  wire [0:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire s_axi_arready;
  wire [2:0]s_axi_arsize;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [7:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire s_axi_awready;
  wire [2:0]s_axi_awsize;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [63:0]s_axi_rdata;
  wire s_axi_rlast;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [63:0]s_axi_wdata;
  wire s_axi_wready;
  wire [7:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire [0:0]NLW_inst_m_axi_arid_UNCONNECTED;
  wire [1:1]NLW_inst_m_axi_arlock_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_arregion_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_aruser_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awid_UNCONNECTED;
  wire [1:1]NLW_inst_m_axi_awlock_UNCONNECTED;
  wire [3:0]NLW_inst_m_axi_awregion_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_awuser_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_wid_UNCONNECTED;
  wire [0:0]NLW_inst_m_axi_wuser_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_bid_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_buser_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_rid_UNCONNECTED;
  wire [0:0]NLW_inst_s_axi_ruser_UNCONNECTED;

  assign m_axi_arlock[1] = \<const0> ;
  assign m_axi_arlock[0] = \^m_axi_arlock [0];
  assign m_axi_awlock[1] = \<const0> ;
  assign m_axi_awlock[0] = \^m_axi_awlock [0];
  GND GND
       (.G(\<const0> ));
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_SUPPORTS_READ = "1" *) 
  (* C_AXI_SUPPORTS_USER_SIGNALS = "0" *) 
  (* C_AXI_SUPPORTS_WRITE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_IGNORE_ID = "1" *) 
  (* C_M_AXI_PROTOCOL = "1" *) 
  (* C_S_AXI_PROTOCOL = "0" *) 
  (* C_TRANSLATION_MODE = "0" *) 
  (* P_AXI3 = "1" *) 
  (* P_AXI4 = "0" *) 
  (* P_AXILITE = "2" *) 
  (* P_AXILITE_SIZE = "3'b011" *) 
  (* P_CONVERSION = "2" *) 
  (* P_DECERR = "2'b11" *) 
  (* P_INCR = "2'b01" *) 
  (* P_PROTECTION = "1" *) 
  (* P_SLVERR = "2'b10" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  main_axi_mem_intercon_imp_auto_pc_1_axi_protocol_converter_v2_1_33_axi_protocol_converter inst
       (.aclk(aclk),
        .aresetn(aresetn),
        .m_axi_araddr(m_axi_araddr),
        .m_axi_arburst(m_axi_arburst),
        .m_axi_arcache(m_axi_arcache),
        .m_axi_arid(NLW_inst_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(m_axi_arlen),
        .m_axi_arlock({NLW_inst_m_axi_arlock_UNCONNECTED[1],\^m_axi_arlock }),
        .m_axi_arprot(m_axi_arprot),
        .m_axi_arqos(m_axi_arqos),
        .m_axi_arready(m_axi_arready),
        .m_axi_arregion(NLW_inst_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(m_axi_arsize),
        .m_axi_aruser(NLW_inst_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(m_axi_arvalid),
        .m_axi_awaddr(m_axi_awaddr),
        .m_axi_awburst(m_axi_awburst),
        .m_axi_awcache(m_axi_awcache),
        .m_axi_awid(NLW_inst_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(m_axi_awlen),
        .m_axi_awlock({NLW_inst_m_axi_awlock_UNCONNECTED[1],\^m_axi_awlock }),
        .m_axi_awprot(m_axi_awprot),
        .m_axi_awqos(m_axi_awqos),
        .m_axi_awready(m_axi_awready),
        .m_axi_awregion(NLW_inst_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(m_axi_awsize),
        .m_axi_awuser(NLW_inst_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(m_axi_awvalid),
        .m_axi_bid(1'b0),
        .m_axi_bready(m_axi_bready),
        .m_axi_bresp(m_axi_bresp),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(m_axi_bvalid),
        .m_axi_rdata(m_axi_rdata),
        .m_axi_rid(1'b0),
        .m_axi_rlast(m_axi_rlast),
        .m_axi_rready(m_axi_rready),
        .m_axi_rresp(m_axi_rresp),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(m_axi_rvalid),
        .m_axi_wdata(m_axi_wdata),
        .m_axi_wid(NLW_inst_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(m_axi_wlast),
        .m_axi_wready(m_axi_wready),
        .m_axi_wstrb(m_axi_wstrb),
        .m_axi_wuser(NLW_inst_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(m_axi_wvalid),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arburst(s_axi_arburst),
        .s_axi_arcache(s_axi_arcache),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,s_axi_arlen[3:0]}),
        .s_axi_arlock(s_axi_arlock),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arqos(s_axi_arqos),
        .s_axi_arready(s_axi_arready),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(s_axi_arsize),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awburst(s_axi_awburst),
        .s_axi_awcache(s_axi_awcache),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,s_axi_awlen[3:0]}),
        .s_axi_awlock(s_axi_awlock),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awqos(s_axi_awqos),
        .s_axi_awready(s_axi_awready),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize(s_axi_awsize),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bid(NLW_inst_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_buser(NLW_inst_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rid(NLW_inst_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(s_axi_rlast),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_ruser(NLW_inst_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) 
(* INV_DEF_VAL = "1'b1" *) (* RST_ACTIVE_HIGH = "1" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "ASYNC_RST" *) 
module main_axi_mem_intercon_imp_auto_pc_1_xpm_cdc_async_rst
   (src_arst,
    dest_clk,
    dest_arst);
  input src_arst;
  input dest_clk;
  output dest_arst;

  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "ASYNC_RST" *) wire [1:0]arststages_ff;
  wire dest_clk;
  wire src_arst;

  assign dest_arst = arststages_ff[1];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(src_arst),
        .Q(arststages_ff[0]));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "ASYNC_RST" *) 
  FDPE #(
    .INIT(1'b0)) 
    \arststages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(arststages_ff[0]),
        .PRE(src_arst),
        .Q(arststages_ff[1]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
md0AksSCeI3fOZtF7nrw91OgSzGoACBon4GH9ENTzaI4jlg22H1uTtXayX2Kz+g4ZH2j52rtMH8H
Xc49HVcThMzO1cRXu+SkL59MRQ87klGca4XtjrTtunJoQ+jyOKRwRBeIMHUdntbk2T1kbXHf9KkB
bNYGEMqSrbiDt7IJUx8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
r6CzxR0T3O2wvZRQe25aX3/CWOx/3d/3vJvvS/XsrKr7v852GNQNqCBn+PKsunj0Ncep8DqHtVie
BE6tKIqZW+3txAUjrhSri5liuFWSnzAk+Drsb4RnvIy7BeOdAK6NhVhn8ZyplkJSHVwaGjN8gtPE
LeWEHPHf5qLnzqGKV7B6oIC7POGV6Vamos1p2z1xv2cEw4udvmtZ5EjzeyCMf+omtxEPxhPi6Z2h
ENlGOmuPMkWGMjP6HQCZ1Mi0uiST/zDo29UDIMmOGcsDMe97imU/z2ekKTPXXwjcV+9q+4zHRgJV
6JWWgjU9cztV5OMaEfpBgRBWae/ijWpPZaGuFA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
glFrHilvyO7nq7/OYhnyb9uU9d8UNGJruNnkmJWuTpgvyCDmtx7iVKPBPe1Bj9jUDT/HM9AGxvu0
g7b4TuMdVkegkVPeHhw31IW0HoTL8wPnrLEpzDVK+B7xl953hPKPe0vn+0EQh2UKeL5K8VLxmsSv
gbpEeToeR90yzlSUzDE=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
D4uBhES8Mkd0GCwY2aQOmEzTqz6hO5B9Wa2oyfVBEODkWyt+AHkIXn4tuBN05FcP2FVmgtVbvZX5
K6iog51IoPw5tv+pM5x8+bQBX/aZpf0c4to3qiX6RZuITpuSUWq/7sqQDqtMqDWOFMMnUBpTX+qI
t61NvyIZcfqRWo4yvIUV2Zh1etqYKDlhqRnMoBZKMeHFpVsp19nU4sf5Km7sSlPQ08vYD8qtJqgJ
ZDYC2KWFTHsnT+5anHvc80FgHt4zBHpPrGprgpltQmVmMZxUD6NRC9EvvXf+pBhgfwPHHePWIKUn
elLld/HEVeFw76SlVV8i4LsS4KWWOM+KmMprEg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EW9gHDqS12MVhy+y/xQVscLd4qOim+cNTepYzlas7WzqDJogZthddOuGjpm3a3fS/cMbF/h0O1Hb
Wjow664GIga0y96lkbkcJ3W8x/IGAsvgyrYT6ScsFhyq7tSd1HjvRG81BhhGM1mmpxfzh0Uqbfso
q+uVKPUmPnbQ/Gdu9YRoxmYVJdmUTpXJ5waYOdib8WNMPLdDfIo/FGrYrx2zYQBtpU5DwwVUTMrB
ZasEyxOj++icI5k5lR3Tx+3gdCFTy4XYQfcj2COm4gnVZ8FN/X1/+0ywsVGAc/OKL+mjMYH3NNH3
zfDO/TpYft+HaVl+CfF/U6IgJJeJs4qI4gB4FA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Myfv5Skg7QCxlNBoFiSTLAeIRYS0J0ArRihYk7dGAHZWAFlxJLgqo51W9P9zTVBurMJjZLtonoDJ
19RfxQj5GqhqN1A20s8xOFfLq6+uDG/V39xQFY32O626Kh4MMlH07hNJL5u1NjJWg1yze0XdFEe9
oLwKQz5lSKGMIh+VPXDuCGhShS+KhHwGEdS0lmA/IHPFNlRG1LsK0zQmUiNkG4kQ5OEVkQgvknNC
B6++ZDIYlT9WbZPs5giRY0zAhUepLPaO+N9F3fIBKVGw4ejbZOt0kXKixF86DDfLmF2+dov+PrTX
1MXJaea3YoQdR2c2MSHAk/TTkzg9ayjvxKaXpg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ks9l+EPHXfDNnWd0exs1j0Q9iSNYaIExwQnpsi8TFJimjPtOkX050wFklsLBM83WyfuD+F2KLNnZ
Jg/aiIiGe9o424jOiEFdnAJuzrD0QL9WmhQ3W9iRJ7uPhha6NfR2WGTCCM4TpN8rTKLQDKxenVfv
6x83rnL5NQxvpp9cQh3zMma73qoEJjhTR9MD9cwA4VeKq2u/R0iTWBplX81vYFd9TW2qW5/Qyzzj
A0+pXzczcJKdggV8h8bYcO+PRC3t2XrufhnjvhjMLG2tPHSMW/soDH/v8KorXyWe5N/q12fo5auN
SXr3olNuB5kpiVS3mJAPV0z4UsFfu2A4hLH7MQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
e3AJKDEM9byJqwpkFZqMIMKMQPOR1VrLFkshor7HR0C+ol7Uv3XTGyvQrINdBEArX0eazF0cHWjC
9B4BhDnysAhT6SENcNHIYHUGQE7uiF7zgL7WhCxClwEnIAVj+PU9FmqlvbreEikHQfbeIDPyCLii
NAS97RDxWki/MfR33zvZX4eEolA/oTyRzr1MagBs7LN1UXyGPvnze8JzHxA3zHVedIIrBrZxkfoj
Loqe6tLYRlC45h1Yr3Wa2gh3LJGtOSji+m7E9Xua/pPh8A/CAD+TNBa5d/X7C3a4AWl2bYTi7HBY
Y8vaIjHiSosru5F2UOEQG9xekCbNRK1Apew1UIvntzCmDMMhlAgB78AUOE2YEWKd9GOl+aTZjMS3
GxAYzrtv/bDRkPOYbcG0SNT9xf+izRM3lX1E2vN3i3uU2Qrh73fjU1lk3PIe/A/H56UrNPDnGT9W
TvlJR47bLDtGyX2+dLvfTaZGRP8aepePOXXLIlvqwCJSMVhCB/hIbz7E

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TfuXOFQtE7YhtTL4354NvKETmBCLSVnb+pbrT8gtzjU7pERE1Hu2ZVzHgVQXwt5RvwG1R/z2je+U
PzszCBhPNqUaXEhuJ0A/q0S/vvOOa6h6tW9MhiB3gnuqEFVWz5pbHZNfgrwh2gT8XyqLI8f1CoJM
xpcB2TbREV/kAAFMxIfH1Dg0KSO2dCeVV1na6N0AiMOQPvXZOB7QpXwNDbYfarWLtF0/l0hi4Fxu
Kgho2ggrUhajP0aKlrCQ9mLsqOyqJELeJldeD+vuUUqhYq4K4RrwtQF+B67lYc4AjznwQ92tUvYJ
ZspFoHJEScNvdFoHFTA2TQ2KToepsqXRiOCL1A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tmfbBpNtCYJ7zsgNxUzw7Dvn+hNn2PPUBeRfXSci/q2/OcQeF/eAAML8YIN1V+AEoAqZTE2/xRQz
+6zwVOLyAOLynMIBQ7EG7xReDJ9kEEiBjnMGO6NWdAsa/VcreVHrLD1PFtA1+WoVe6yOvNGK+Nbh
HjPkXyycyP6RQ4Rx/PtTxw31LOFVezddSgRlaKHTprKTP4LbjPG//onRBg3fAl8zwU1wYYNLzYCX
jwY7xfMkQyhUSpV2Tx3seqy2IYVl8jjxynFxfyxulvrJiqmc6aaKKBdkoOVbJ5eO2sCXFJB1mKEU
WR2Ee2ozisABzk9IcGILewCW7ghdLP82CRZv4A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GfDCxx9db4ripD5mvQy16BVlwPYfeC7ZobZXaX1my6WUDiKwd69J5SreUXKYD9lvZfI7djLgHkYm
5G247T4NX7zoBwc88bUD+tNvGNmzWFfSVVZqu8hjgd31lZXjy9uYdXA/gsE+T+JqEfRYdV8YoGgm
sREyiJjWRPDbx6kc8um8vlAK/Rjwz0EGVkGUoi/+UvxcnjG1PqCl7GSMOQ3gFMEOaxIflShnF2/c
//ioADxl3WjUGyTstMK54XlP8G1Hk95sSe/7Y+SbaIyoG8t6gGDimDJNuGs4JjDUi1V7Gxfzxk9+
O2J++9clyLkMZ3rRyxSvR+Xyrmn3YxjVC68GXw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 71680)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
