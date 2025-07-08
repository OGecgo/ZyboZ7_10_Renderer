--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
--Date        : Tue Jul  8 21:06:04 2025
--Host        : go running 64-bit Arch Linux
--Command     : generate_target operations_inst_0_wrapper.bd
--Design      : operations_inst_0_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity operations_inst_0_wrapper is
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
end operations_inst_0_wrapper;

architecture STRUCTURE of operations_inst_0_wrapper is
  component operations_inst_0 is
  port (
    aclk_0 : in STD_LOGIC;
    aresetn_0 : in STD_LOGIC;
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
    M_AXI_MM2S_0_rvalid : in STD_LOGIC
  );
  end component operations_inst_0;
begin
operations_inst_0_i: component operations_inst_0
     port map (
      M_AXI_MM2S_0_araddr(31 downto 0) => M_AXI_MM2S_0_araddr(31 downto 0),
      M_AXI_MM2S_0_arburst(1 downto 0) => M_AXI_MM2S_0_arburst(1 downto 0),
      M_AXI_MM2S_0_arcache(3 downto 0) => M_AXI_MM2S_0_arcache(3 downto 0),
      M_AXI_MM2S_0_arlen(7 downto 0) => M_AXI_MM2S_0_arlen(7 downto 0),
      M_AXI_MM2S_0_arprot(2 downto 0) => M_AXI_MM2S_0_arprot(2 downto 0),
      M_AXI_MM2S_0_arready => M_AXI_MM2S_0_arready,
      M_AXI_MM2S_0_arsize(2 downto 0) => M_AXI_MM2S_0_arsize(2 downto 0),
      M_AXI_MM2S_0_arvalid => M_AXI_MM2S_0_arvalid,
      M_AXI_MM2S_0_rdata(511 downto 0) => M_AXI_MM2S_0_rdata(511 downto 0),
      M_AXI_MM2S_0_rlast => M_AXI_MM2S_0_rlast,
      M_AXI_MM2S_0_rready => M_AXI_MM2S_0_rready,
      M_AXI_MM2S_0_rresp(1 downto 0) => M_AXI_MM2S_0_rresp(1 downto 0),
      M_AXI_MM2S_0_rvalid => M_AXI_MM2S_0_rvalid,
      M_AXI_S2MM_0_awaddr(31 downto 0) => M_AXI_S2MM_0_awaddr(31 downto 0),
      M_AXI_S2MM_0_awburst(1 downto 0) => M_AXI_S2MM_0_awburst(1 downto 0),
      M_AXI_S2MM_0_awcache(3 downto 0) => M_AXI_S2MM_0_awcache(3 downto 0),
      M_AXI_S2MM_0_awlen(7 downto 0) => M_AXI_S2MM_0_awlen(7 downto 0),
      M_AXI_S2MM_0_awprot(2 downto 0) => M_AXI_S2MM_0_awprot(2 downto 0),
      M_AXI_S2MM_0_awready => M_AXI_S2MM_0_awready,
      M_AXI_S2MM_0_awsize(2 downto 0) => M_AXI_S2MM_0_awsize(2 downto 0),
      M_AXI_S2MM_0_awvalid => M_AXI_S2MM_0_awvalid,
      M_AXI_S2MM_0_bready => M_AXI_S2MM_0_bready,
      M_AXI_S2MM_0_bresp(1 downto 0) => M_AXI_S2MM_0_bresp(1 downto 0),
      M_AXI_S2MM_0_bvalid => M_AXI_S2MM_0_bvalid,
      M_AXI_S2MM_0_wdata(511 downto 0) => M_AXI_S2MM_0_wdata(511 downto 0),
      M_AXI_S2MM_0_wlast => M_AXI_S2MM_0_wlast,
      M_AXI_S2MM_0_wready => M_AXI_S2MM_0_wready,
      M_AXI_S2MM_0_wstrb(63 downto 0) => M_AXI_S2MM_0_wstrb(63 downto 0),
      M_AXI_S2MM_0_wvalid => M_AXI_S2MM_0_wvalid,
      S_AXI_LITE_0_araddr(9 downto 0) => S_AXI_LITE_0_araddr(9 downto 0),
      S_AXI_LITE_0_arready => S_AXI_LITE_0_arready,
      S_AXI_LITE_0_arvalid => S_AXI_LITE_0_arvalid,
      S_AXI_LITE_0_awaddr(9 downto 0) => S_AXI_LITE_0_awaddr(9 downto 0),
      S_AXI_LITE_0_awready => S_AXI_LITE_0_awready,
      S_AXI_LITE_0_awvalid => S_AXI_LITE_0_awvalid,
      S_AXI_LITE_0_bready => S_AXI_LITE_0_bready,
      S_AXI_LITE_0_bresp(1 downto 0) => S_AXI_LITE_0_bresp(1 downto 0),
      S_AXI_LITE_0_bvalid => S_AXI_LITE_0_bvalid,
      S_AXI_LITE_0_rdata(31 downto 0) => S_AXI_LITE_0_rdata(31 downto 0),
      S_AXI_LITE_0_rready => S_AXI_LITE_0_rready,
      S_AXI_LITE_0_rresp(1 downto 0) => S_AXI_LITE_0_rresp(1 downto 0),
      S_AXI_LITE_0_rvalid => S_AXI_LITE_0_rvalid,
      S_AXI_LITE_0_wdata(31 downto 0) => S_AXI_LITE_0_wdata(31 downto 0),
      S_AXI_LITE_0_wready => S_AXI_LITE_0_wready,
      S_AXI_LITE_0_wvalid => S_AXI_LITE_0_wvalid,
      aclk_0 => aclk_0,
      aresetn_0 => aresetn_0
    );
end STRUCTURE;
