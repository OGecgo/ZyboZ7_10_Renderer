// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module operations_inst_0 (
  aclk_0,
  aresetn_0,
  S_AXI_LITE_0_araddr,
  S_AXI_LITE_0_arready,
  S_AXI_LITE_0_arvalid,
  S_AXI_LITE_0_awaddr,
  S_AXI_LITE_0_awready,
  S_AXI_LITE_0_awvalid,
  S_AXI_LITE_0_bready,
  S_AXI_LITE_0_bresp,
  S_AXI_LITE_0_bvalid,
  S_AXI_LITE_0_rdata,
  S_AXI_LITE_0_rready,
  S_AXI_LITE_0_rresp,
  S_AXI_LITE_0_rvalid,
  S_AXI_LITE_0_wdata,
  S_AXI_LITE_0_wready,
  S_AXI_LITE_0_wvalid,
  M_AXI_S2MM_0_awaddr,
  M_AXI_S2MM_0_awburst,
  M_AXI_S2MM_0_awcache,
  M_AXI_S2MM_0_awlen,
  M_AXI_S2MM_0_awprot,
  M_AXI_S2MM_0_awready,
  M_AXI_S2MM_0_awsize,
  M_AXI_S2MM_0_awvalid,
  M_AXI_S2MM_0_bready,
  M_AXI_S2MM_0_bresp,
  M_AXI_S2MM_0_bvalid,
  M_AXI_S2MM_0_wdata,
  M_AXI_S2MM_0_wlast,
  M_AXI_S2MM_0_wready,
  M_AXI_S2MM_0_wstrb,
  M_AXI_S2MM_0_wvalid,
  M_AXI_MM2S_0_araddr,
  M_AXI_MM2S_0_arburst,
  M_AXI_MM2S_0_arcache,
  M_AXI_MM2S_0_arlen,
  M_AXI_MM2S_0_arprot,
  M_AXI_MM2S_0_arready,
  M_AXI_MM2S_0_arsize,
  M_AXI_MM2S_0_arvalid,
  M_AXI_MM2S_0_rdata,
  M_AXI_MM2S_0_rlast,
  M_AXI_MM2S_0_rready,
  M_AXI_MM2S_0_rresp,
  M_AXI_MM2S_0_rvalid
);

  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK_0 CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.ACLK_0" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN main_processing_system7_0_0_FCLK_CLK0, ASSOCIATED_BUSIF S_AXI_LITE_0:M_AXI_S2MM_0:M_AXI_MM2S_0, ASSOCIATED_RESET aresetn_0, INSERT_VIP 0" *)
  input aclk_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESETN_0 RST" *)
  (* X_INTERFACE_MODE = "slave RST.ARESETN_0" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESETN_0, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
  input aresetn_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 ARADDR" *)
  (* X_INTERFACE_MODE = "slave S_AXI_LITE_0" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_LITE_0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN main_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
  input [9:0]S_AXI_LITE_0_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 ARREADY" *)
  output S_AXI_LITE_0_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 ARVALID" *)
  input S_AXI_LITE_0_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 AWADDR" *)
  input [9:0]S_AXI_LITE_0_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 AWREADY" *)
  output S_AXI_LITE_0_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 AWVALID" *)
  input S_AXI_LITE_0_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 BREADY" *)
  input S_AXI_LITE_0_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 BRESP" *)
  output [1:0]S_AXI_LITE_0_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 BVALID" *)
  output S_AXI_LITE_0_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 RDATA" *)
  output [31:0]S_AXI_LITE_0_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 RREADY" *)
  input S_AXI_LITE_0_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 RRESP" *)
  output [1:0]S_AXI_LITE_0_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 RVALID" *)
  output S_AXI_LITE_0_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 WDATA" *)
  input [31:0]S_AXI_LITE_0_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 WREADY" *)
  output S_AXI_LITE_0_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 WVALID" *)
  input S_AXI_LITE_0_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 AWADDR" *)
  (* X_INTERFACE_MODE = "master M_AXI_S2MM_0" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI_S2MM_0, DATA_WIDTH 512, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE WRITE_ONLY, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 0, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 16, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN main_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
  output [31:0]M_AXI_S2MM_0_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 AWBURST" *)
  output [1:0]M_AXI_S2MM_0_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 AWCACHE" *)
  output [3:0]M_AXI_S2MM_0_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 AWLEN" *)
  output [7:0]M_AXI_S2MM_0_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 AWPROT" *)
  output [2:0]M_AXI_S2MM_0_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 AWREADY" *)
  input M_AXI_S2MM_0_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 AWSIZE" *)
  output [2:0]M_AXI_S2MM_0_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 AWVALID" *)
  output M_AXI_S2MM_0_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 BREADY" *)
  output M_AXI_S2MM_0_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 BRESP" *)
  input [1:0]M_AXI_S2MM_0_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 BVALID" *)
  input M_AXI_S2MM_0_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 WDATA" *)
  output [511:0]M_AXI_S2MM_0_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 WLAST" *)
  output M_AXI_S2MM_0_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 WREADY" *)
  input M_AXI_S2MM_0_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 WSTRB" *)
  output [63:0]M_AXI_S2MM_0_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 WVALID" *)
  output M_AXI_S2MM_0_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 ARADDR" *)
  (* X_INTERFACE_MODE = "master M_AXI_MM2S_0" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI_MM2S_0, DATA_WIDTH 512, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_ONLY, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 0, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN main_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
  output [31:0]M_AXI_MM2S_0_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 ARBURST" *)
  output [1:0]M_AXI_MM2S_0_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 ARCACHE" *)
  output [3:0]M_AXI_MM2S_0_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 ARLEN" *)
  output [7:0]M_AXI_MM2S_0_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 ARPROT" *)
  output [2:0]M_AXI_MM2S_0_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 ARREADY" *)
  input M_AXI_MM2S_0_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 ARSIZE" *)
  output [2:0]M_AXI_MM2S_0_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 ARVALID" *)
  output M_AXI_MM2S_0_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 RDATA" *)
  input [511:0]M_AXI_MM2S_0_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 RLAST" *)
  input M_AXI_MM2S_0_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 RREADY" *)
  output M_AXI_MM2S_0_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 RRESP" *)
  input [1:0]M_AXI_MM2S_0_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 RVALID" *)
  input M_AXI_MM2S_0_rvalid;

  // stub module has no contents

endmodule
