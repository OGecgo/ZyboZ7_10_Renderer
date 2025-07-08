--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
--Date        : Tue Jul  8 21:06:04 2025
--Host        : go running 64-bit Arch Linux
--Command     : generate_target operations_inst_0.bd
--Design      : operations_inst_0
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity operations_inst_0 is
  port (
    M_AXI_MM2S_0_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_MM2S_0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_MM2S_0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_MM2S_0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_MM2S_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_MM2S_0_arready : in STD_LOGIC;
    M_AXI_MM2S_0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_MM2S_0_arvalid : out STD_LOGIC;
    M_AXI_MM2S_0_rdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    M_AXI_MM2S_0_rlast : in STD_LOGIC;
    M_AXI_MM2S_0_rready : out STD_LOGIC;
    M_AXI_MM2S_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_MM2S_0_rvalid : in STD_LOGIC;
    M_AXI_S2MM_0_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AXI_S2MM_0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_S2MM_0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M_AXI_S2MM_0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXI_S2MM_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_S2MM_0_awready : in STD_LOGIC;
    M_AXI_S2MM_0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M_AXI_S2MM_0_awvalid : out STD_LOGIC;
    M_AXI_S2MM_0_bready : out STD_LOGIC;
    M_AXI_S2MM_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M_AXI_S2MM_0_bvalid : in STD_LOGIC;
    M_AXI_S2MM_0_wdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    M_AXI_S2MM_0_wlast : out STD_LOGIC;
    M_AXI_S2MM_0_wready : in STD_LOGIC;
    M_AXI_S2MM_0_wstrb : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXI_S2MM_0_wvalid : out STD_LOGIC;
    S_AXI_LITE_0_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_LITE_0_arready : out STD_LOGIC;
    S_AXI_LITE_0_arvalid : in STD_LOGIC;
    S_AXI_LITE_0_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXI_LITE_0_awready : out STD_LOGIC;
    S_AXI_LITE_0_awvalid : in STD_LOGIC;
    S_AXI_LITE_0_bready : in STD_LOGIC;
    S_AXI_LITE_0_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_LITE_0_bvalid : out STD_LOGIC;
    S_AXI_LITE_0_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_LITE_0_rready : in STD_LOGIC;
    S_AXI_LITE_0_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_LITE_0_rvalid : out STD_LOGIC;
    S_AXI_LITE_0_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_LITE_0_wready : out STD_LOGIC;
    S_AXI_LITE_0_wvalid : in STD_LOGIC;
    aclk_0 : in STD_LOGIC;
    aresetn_0 : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of operations_inst_0 : entity is "operations_inst_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=operations_inst_0,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=/home/go/Desktop/ZyboZ7_10_Renderer/workspace_vivado/workspace_vivado.srcs/sources_1/bd/operations/operations.bd,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of operations_inst_0 : entity is "operations_inst_0.hwdef";
end operations_inst_0;

architecture STRUCTURE of operations_inst_0 is
  component operations_inst_0_axi_dma_0_0 is
  port (
    s_axi_lite_aclk : in STD_LOGIC;
    m_axi_mm2s_aclk : in STD_LOGIC;
    m_axi_s2mm_aclk : in STD_LOGIC;
    axi_resetn : in STD_LOGIC;
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_mm2s_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_mm2s_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_mm2s_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_mm2s_arvalid : out STD_LOGIC;
    m_axi_mm2s_arready : in STD_LOGIC;
    m_axi_mm2s_rdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_mm2s_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_mm2s_rlast : in STD_LOGIC;
    m_axi_mm2s_rvalid : in STD_LOGIC;
    m_axi_mm2s_rready : out STD_LOGIC;
    mm2s_prmry_reset_out_n : out STD_LOGIC;
    m_axis_mm2s_tdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axis_mm2s_tkeep : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_mm2s_tvalid : out STD_LOGIC;
    m_axis_mm2s_tready : in STD_LOGIC;
    m_axis_mm2s_tlast : out STD_LOGIC;
    m_axi_s2mm_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_s2mm_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_s2mm_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_s2mm_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_s2mm_awvalid : out STD_LOGIC;
    m_axi_s2mm_awready : in STD_LOGIC;
    m_axi_s2mm_wdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axi_s2mm_wstrb : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_s2mm_wlast : out STD_LOGIC;
    m_axi_s2mm_wvalid : out STD_LOGIC;
    m_axi_s2mm_wready : in STD_LOGIC;
    m_axi_s2mm_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_s2mm_bvalid : in STD_LOGIC;
    m_axi_s2mm_bready : out STD_LOGIC;
    s2mm_prmry_reset_out_n : out STD_LOGIC;
    s_axis_s2mm_tdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    s_axis_s2mm_tkeep : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_s2mm_tvalid : in STD_LOGIC;
    s_axis_s2mm_tready : out STD_LOGIC;
    s_axis_s2mm_tlast : in STD_LOGIC;
    mm2s_introut : out STD_LOGIC;
    s2mm_introut : out STD_LOGIC
  );
  end component operations_inst_0_axi_dma_0_0;
  component operations_inst_0_AXI_matrix_mul_0_0 is
  port (
    s_axis_tdata : in STD_LOGIC_VECTOR ( 511 downto 0 );
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tlast : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 511 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tlast : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC
  );
  end component operations_inst_0_AXI_matrix_mul_0_0;
  signal AXI_matrix_mul_0_m_axis_tdata : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal AXI_matrix_mul_0_m_axis_tlast : STD_LOGIC;
  signal AXI_matrix_mul_0_m_axis_tvalid : STD_LOGIC;
  signal AXI_matrix_mul_0_s_axis_tready : STD_LOGIC;
  signal axi_dma_0_m_axis_mm2s_tdata : STD_LOGIC_VECTOR ( 511 downto 0 );
  signal axi_dma_0_m_axis_mm2s_tlast : STD_LOGIC;
  signal axi_dma_0_m_axis_mm2s_tvalid : STD_LOGIC;
  signal axi_dma_0_s_axis_s2mm_tready : STD_LOGIC;
  signal NLW_axi_dma_0_mm2s_introut_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_0_mm2s_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_0_s2mm_introut_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_0_s2mm_prmry_reset_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_dma_0_m_axis_mm2s_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of M_AXI_MM2S_0_arready : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 ARREADY";
  attribute X_INTERFACE_INFO of M_AXI_MM2S_0_arvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 ARVALID";
  attribute X_INTERFACE_INFO of M_AXI_MM2S_0_rlast : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 RLAST";
  attribute X_INTERFACE_INFO of M_AXI_MM2S_0_rready : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 RREADY";
  attribute X_INTERFACE_INFO of M_AXI_MM2S_0_rvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 RVALID";
  attribute X_INTERFACE_INFO of M_AXI_S2MM_0_awready : signal is "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 AWREADY";
  attribute X_INTERFACE_INFO of M_AXI_S2MM_0_awvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 AWVALID";
  attribute X_INTERFACE_INFO of M_AXI_S2MM_0_bready : signal is "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 BREADY";
  attribute X_INTERFACE_INFO of M_AXI_S2MM_0_bvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 BVALID";
  attribute X_INTERFACE_INFO of M_AXI_S2MM_0_wlast : signal is "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 WLAST";
  attribute X_INTERFACE_INFO of M_AXI_S2MM_0_wready : signal is "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 WREADY";
  attribute X_INTERFACE_INFO of M_AXI_S2MM_0_wvalid : signal is "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 WVALID";
  attribute X_INTERFACE_INFO of S_AXI_LITE_0_arready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 ARREADY";
  attribute X_INTERFACE_INFO of S_AXI_LITE_0_arvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 ARVALID";
  attribute X_INTERFACE_INFO of S_AXI_LITE_0_awready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 AWREADY";
  attribute X_INTERFACE_INFO of S_AXI_LITE_0_awvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 AWVALID";
  attribute X_INTERFACE_INFO of S_AXI_LITE_0_bready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 BREADY";
  attribute X_INTERFACE_INFO of S_AXI_LITE_0_bvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 BVALID";
  attribute X_INTERFACE_INFO of S_AXI_LITE_0_rready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 RREADY";
  attribute X_INTERFACE_INFO of S_AXI_LITE_0_rvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 RVALID";
  attribute X_INTERFACE_INFO of S_AXI_LITE_0_wready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 WREADY";
  attribute X_INTERFACE_INFO of S_AXI_LITE_0_wvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 WVALID";
  attribute X_INTERFACE_INFO of aclk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.ACLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk_0 : signal is "XIL_INTERFACENAME CLK.ACLK_0, ASSOCIATED_BUSIF S_AXI_LITE_0:M_AXI_S2MM_0:M_AXI_MM2S_0, ASSOCIATED_RESET aresetn_0, CLK_DOMAIN main_processing_system7_0_0_FCLK_CLK0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of aresetn_0 : signal is "xilinx.com:signal:reset:1.0 RST.ARESETN_0 RST";
  attribute X_INTERFACE_PARAMETER of aresetn_0 : signal is "XIL_INTERFACENAME RST.ARESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of M_AXI_MM2S_0_araddr : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 ARADDR";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of M_AXI_MM2S_0_araddr : signal is "Master";
  attribute X_INTERFACE_PARAMETER of M_AXI_MM2S_0_araddr : signal is "XIL_INTERFACENAME M_AXI_MM2S_0, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN main_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 512, FREQ_HZ 100000000, HAS_BRESP 0, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 0, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_ONLY, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXI_MM2S_0_arburst : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 ARBURST";
  attribute X_INTERFACE_INFO of M_AXI_MM2S_0_arcache : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 ARCACHE";
  attribute X_INTERFACE_INFO of M_AXI_MM2S_0_arlen : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 ARLEN";
  attribute X_INTERFACE_INFO of M_AXI_MM2S_0_arprot : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 ARPROT";
  attribute X_INTERFACE_INFO of M_AXI_MM2S_0_arsize : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 ARSIZE";
  attribute X_INTERFACE_INFO of M_AXI_MM2S_0_rdata : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 RDATA";
  attribute X_INTERFACE_INFO of M_AXI_MM2S_0_rresp : signal is "xilinx.com:interface:aximm:1.0 M_AXI_MM2S_0 RRESP";
  attribute X_INTERFACE_INFO of M_AXI_S2MM_0_awaddr : signal is "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 AWADDR";
  attribute X_INTERFACE_MODE of M_AXI_S2MM_0_awaddr : signal is "Master";
  attribute X_INTERFACE_PARAMETER of M_AXI_S2MM_0_awaddr : signal is "XIL_INTERFACENAME M_AXI_S2MM_0, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN main_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 512, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 0, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE WRITE_ONLY, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXI_S2MM_0_awburst : signal is "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 AWBURST";
  attribute X_INTERFACE_INFO of M_AXI_S2MM_0_awcache : signal is "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 AWCACHE";
  attribute X_INTERFACE_INFO of M_AXI_S2MM_0_awlen : signal is "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 AWLEN";
  attribute X_INTERFACE_INFO of M_AXI_S2MM_0_awprot : signal is "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 AWPROT";
  attribute X_INTERFACE_INFO of M_AXI_S2MM_0_awsize : signal is "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 AWSIZE";
  attribute X_INTERFACE_INFO of M_AXI_S2MM_0_bresp : signal is "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 BRESP";
  attribute X_INTERFACE_INFO of M_AXI_S2MM_0_wdata : signal is "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 WDATA";
  attribute X_INTERFACE_INFO of M_AXI_S2MM_0_wstrb : signal is "xilinx.com:interface:aximm:1.0 M_AXI_S2MM_0 WSTRB";
  attribute X_INTERFACE_INFO of S_AXI_LITE_0_araddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 ARADDR";
  attribute X_INTERFACE_MODE of S_AXI_LITE_0_araddr : signal is "Slave";
  attribute X_INTERFACE_PARAMETER of S_AXI_LITE_0_araddr : signal is "XIL_INTERFACENAME S_AXI_LITE_0, ADDR_WIDTH 16, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN main_processing_system7_0_0_FCLK_CLK0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 0, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of S_AXI_LITE_0_awaddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 AWADDR";
  attribute X_INTERFACE_INFO of S_AXI_LITE_0_bresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 BRESP";
  attribute X_INTERFACE_INFO of S_AXI_LITE_0_rdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 RDATA";
  attribute X_INTERFACE_INFO of S_AXI_LITE_0_rresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 RRESP";
  attribute X_INTERFACE_INFO of S_AXI_LITE_0_wdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE_0 WDATA";
begin
AXI_matrix_mul_0: component operations_inst_0_AXI_matrix_mul_0_0
     port map (
      aclk => aclk_0,
      aresetn => aresetn_0,
      m_axis_tdata(511 downto 0) => AXI_matrix_mul_0_m_axis_tdata(511 downto 0),
      m_axis_tlast => AXI_matrix_mul_0_m_axis_tlast,
      m_axis_tready => axi_dma_0_s_axis_s2mm_tready,
      m_axis_tvalid => AXI_matrix_mul_0_m_axis_tvalid,
      s_axis_tdata(511 downto 0) => axi_dma_0_m_axis_mm2s_tdata(511 downto 0),
      s_axis_tlast => axi_dma_0_m_axis_mm2s_tlast,
      s_axis_tready => AXI_matrix_mul_0_s_axis_tready,
      s_axis_tvalid => axi_dma_0_m_axis_mm2s_tvalid
    );
axi_dma_0: component operations_inst_0_axi_dma_0_0
     port map (
      axi_resetn => aresetn_0,
      m_axi_mm2s_aclk => aclk_0,
      m_axi_mm2s_araddr(31 downto 0) => M_AXI_MM2S_0_araddr(31 downto 0),
      m_axi_mm2s_arburst(1 downto 0) => M_AXI_MM2S_0_arburst(1 downto 0),
      m_axi_mm2s_arcache(3 downto 0) => M_AXI_MM2S_0_arcache(3 downto 0),
      m_axi_mm2s_arlen(7 downto 0) => M_AXI_MM2S_0_arlen(7 downto 0),
      m_axi_mm2s_arprot(2 downto 0) => M_AXI_MM2S_0_arprot(2 downto 0),
      m_axi_mm2s_arready => M_AXI_MM2S_0_arready,
      m_axi_mm2s_arsize(2 downto 0) => M_AXI_MM2S_0_arsize(2 downto 0),
      m_axi_mm2s_arvalid => M_AXI_MM2S_0_arvalid,
      m_axi_mm2s_rdata(511 downto 0) => M_AXI_MM2S_0_rdata(511 downto 0),
      m_axi_mm2s_rlast => M_AXI_MM2S_0_rlast,
      m_axi_mm2s_rready => M_AXI_MM2S_0_rready,
      m_axi_mm2s_rresp(1 downto 0) => M_AXI_MM2S_0_rresp(1 downto 0),
      m_axi_mm2s_rvalid => M_AXI_MM2S_0_rvalid,
      m_axi_s2mm_aclk => aclk_0,
      m_axi_s2mm_awaddr(31 downto 0) => M_AXI_S2MM_0_awaddr(31 downto 0),
      m_axi_s2mm_awburst(1 downto 0) => M_AXI_S2MM_0_awburst(1 downto 0),
      m_axi_s2mm_awcache(3 downto 0) => M_AXI_S2MM_0_awcache(3 downto 0),
      m_axi_s2mm_awlen(7 downto 0) => M_AXI_S2MM_0_awlen(7 downto 0),
      m_axi_s2mm_awprot(2 downto 0) => M_AXI_S2MM_0_awprot(2 downto 0),
      m_axi_s2mm_awready => M_AXI_S2MM_0_awready,
      m_axi_s2mm_awsize(2 downto 0) => M_AXI_S2MM_0_awsize(2 downto 0),
      m_axi_s2mm_awvalid => M_AXI_S2MM_0_awvalid,
      m_axi_s2mm_bready => M_AXI_S2MM_0_bready,
      m_axi_s2mm_bresp(1 downto 0) => M_AXI_S2MM_0_bresp(1 downto 0),
      m_axi_s2mm_bvalid => M_AXI_S2MM_0_bvalid,
      m_axi_s2mm_wdata(511 downto 0) => M_AXI_S2MM_0_wdata(511 downto 0),
      m_axi_s2mm_wlast => M_AXI_S2MM_0_wlast,
      m_axi_s2mm_wready => M_AXI_S2MM_0_wready,
      m_axi_s2mm_wstrb(63 downto 0) => M_AXI_S2MM_0_wstrb(63 downto 0),
      m_axi_s2mm_wvalid => M_AXI_S2MM_0_wvalid,
      m_axis_mm2s_tdata(511 downto 0) => axi_dma_0_m_axis_mm2s_tdata(511 downto 0),
      m_axis_mm2s_tkeep(63 downto 0) => NLW_axi_dma_0_m_axis_mm2s_tkeep_UNCONNECTED(63 downto 0),
      m_axis_mm2s_tlast => axi_dma_0_m_axis_mm2s_tlast,
      m_axis_mm2s_tready => AXI_matrix_mul_0_s_axis_tready,
      m_axis_mm2s_tvalid => axi_dma_0_m_axis_mm2s_tvalid,
      mm2s_introut => NLW_axi_dma_0_mm2s_introut_UNCONNECTED,
      mm2s_prmry_reset_out_n => NLW_axi_dma_0_mm2s_prmry_reset_out_n_UNCONNECTED,
      s2mm_introut => NLW_axi_dma_0_s2mm_introut_UNCONNECTED,
      s2mm_prmry_reset_out_n => NLW_axi_dma_0_s2mm_prmry_reset_out_n_UNCONNECTED,
      s_axi_lite_aclk => aclk_0,
      s_axi_lite_araddr(9 downto 0) => S_AXI_LITE_0_araddr(9 downto 0),
      s_axi_lite_arready => S_AXI_LITE_0_arready,
      s_axi_lite_arvalid => S_AXI_LITE_0_arvalid,
      s_axi_lite_awaddr(9 downto 0) => S_AXI_LITE_0_awaddr(9 downto 0),
      s_axi_lite_awready => S_AXI_LITE_0_awready,
      s_axi_lite_awvalid => S_AXI_LITE_0_awvalid,
      s_axi_lite_bready => S_AXI_LITE_0_bready,
      s_axi_lite_bresp(1 downto 0) => S_AXI_LITE_0_bresp(1 downto 0),
      s_axi_lite_bvalid => S_AXI_LITE_0_bvalid,
      s_axi_lite_rdata(31 downto 0) => S_AXI_LITE_0_rdata(31 downto 0),
      s_axi_lite_rready => S_AXI_LITE_0_rready,
      s_axi_lite_rresp(1 downto 0) => S_AXI_LITE_0_rresp(1 downto 0),
      s_axi_lite_rvalid => S_AXI_LITE_0_rvalid,
      s_axi_lite_wdata(31 downto 0) => S_AXI_LITE_0_wdata(31 downto 0),
      s_axi_lite_wready => S_AXI_LITE_0_wready,
      s_axi_lite_wvalid => S_AXI_LITE_0_wvalid,
      s_axis_s2mm_tdata(511 downto 0) => AXI_matrix_mul_0_m_axis_tdata(511 downto 0),
      s_axis_s2mm_tkeep(63 downto 0) => B"1111111111111111111111111111111111111111111111111111111111111111",
      s_axis_s2mm_tlast => AXI_matrix_mul_0_m_axis_tlast,
      s_axis_s2mm_tready => axi_dma_0_s_axis_s2mm_tready,
      s_axis_s2mm_tvalid => AXI_matrix_mul_0_m_axis_tvalid
    );
end STRUCTURE;
