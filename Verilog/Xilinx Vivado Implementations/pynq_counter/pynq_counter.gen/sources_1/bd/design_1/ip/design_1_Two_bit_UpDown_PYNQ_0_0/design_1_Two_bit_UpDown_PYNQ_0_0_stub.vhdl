-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Sun Oct  6 11:29:30 2024
-- Host        : DESKTOP-9JRQ63P running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {c:/Users/Adarsh Venugopal/Desktop/SEM 5/ELECTRONIC SYSTEM LEVEL
--               DESIGN AND
--               VERIFICATION/pynq_counter/pynq_counter.gen/sources_1/bd/design_1/ip/design_1_Two_bit_UpDown_PYNQ_0_0/design_1_Two_bit_UpDown_PYNQ_0_0_stub.vhdl}
-- Design      : design_1_Two_bit_UpDown_PYNQ_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_Two_bit_UpDown_PYNQ_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    up_down : in STD_LOGIC;
    leds : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end design_1_Two_bit_UpDown_PYNQ_0_0;

architecture stub of design_1_Two_bit_UpDown_PYNQ_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst,up_down,leds[3:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "Two_bit_UpDown_PYNQ,Vivado 2024.1";
begin
end;
