-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sun Oct  6 11:29:30 2024
-- Host        : DESKTOP-9JRQ63P running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim {c:/Users/Adarsh Venugopal/Desktop/SEM 5/ELECTRONIC SYSTEM LEVEL DESIGN
--               AND
--               VERIFICATION/pynq_counter/pynq_counter.gen/sources_1/bd/design_1/ip/design_1_Two_bit_UpDown_PYNQ_0_0/design_1_Two_bit_UpDown_PYNQ_0_0_sim_netlist.vhdl}
-- Design      : design_1_Two_bit_UpDown_PYNQ_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_Two_bit_UpDown_PYNQ_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    up_down : in STD_LOGIC;
    leds : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_Two_bit_UpDown_PYNQ_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_Two_bit_UpDown_PYNQ_0_0 : entity is "design_1_Two_bit_UpDown_PYNQ_0_0,Two_bit_UpDown_PYNQ,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_Two_bit_UpDown_PYNQ_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_Two_bit_UpDown_PYNQ_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_Two_bit_UpDown_PYNQ_0_0 : entity is "Two_bit_UpDown_PYNQ,Vivado 2024.1";
end design_1_Two_bit_UpDown_PYNQ_0_0;

architecture STRUCTURE of design_1_Two_bit_UpDown_PYNQ_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 rst RST";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  leds(3) <= \<const0>\;
  leds(2) <= \<const0>\;
  leds(1) <= \<const0>\;
  leds(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
end STRUCTURE;
