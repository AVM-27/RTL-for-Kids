// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sun Oct  6 11:29:30 2024
// Host        : DESKTOP-9JRQ63P running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/Adarsh Venugopal/Desktop/SEM 5/ELECTRONIC SYSTEM LEVEL
//               DESIGN AND
//               VERIFICATION/pynq_counter/pynq_counter.gen/sources_1/bd/design_1/ip/design_1_Two_bit_UpDown_PYNQ_0_0/design_1_Two_bit_UpDown_PYNQ_0_0_stub.v}
// Design      : design_1_Two_bit_UpDown_PYNQ_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "Two_bit_UpDown_PYNQ,Vivado 2024.1" *)
module design_1_Two_bit_UpDown_PYNQ_0_0(clk, rst, up_down, leds)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,up_down,leds[3:0]" */;
  input clk;
  input rst;
  input up_down;
  output [3:0]leds;
endmodule
