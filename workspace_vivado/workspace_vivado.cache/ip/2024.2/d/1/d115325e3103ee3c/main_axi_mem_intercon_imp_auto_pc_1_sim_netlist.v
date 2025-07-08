// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Tue Jul  8 20:52:17 2025
// Host        : go running 64-bit Arch Linux
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ main_axi_mem_intercon_imp_auto_pc_1_sim_netlist.v
// Design      : main_axi_mem_intercon_imp_auto_pc_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_data_fifo_v2_1_32_axic_fifo
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_data_fifo_v2_1_32_fifo_gen inst
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

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_data_fifo_v2_1_32_fifo_gen
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_11 fifo_gen_inst
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

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_protocol_converter_v2_1_33_a_axi3_conv
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_data_fifo_v2_1_32_axic_fifo \USE_BURSTS.cmd_queue 
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

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_protocol_converter_v2_1_33_axi3_conv
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

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_protocol_converter_v2_1_33_a_axi3_conv \USE_WRITE.write_addr_inst 
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_protocol_converter_v2_1_33_w_axi3_conv \USE_WRITE.write_data_inst 
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_protocol_converter_v2_1_33_axi_protocol_converter
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_protocol_converter_v2_1_33_axi3_conv \gen_axi4_axi3.axi3_conv_inst 
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

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_protocol_converter_v2_1_33_w_axi3_conv
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_protocol_converter_v2_1_33_axi_protocol_converter inst
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_async_rst
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 71856)
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
