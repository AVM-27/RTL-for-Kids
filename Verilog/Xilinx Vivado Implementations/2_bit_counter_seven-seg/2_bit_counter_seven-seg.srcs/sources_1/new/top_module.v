`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2024 23:05:12
// Design Name: 
// Module Name: top_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module top_module (
    input CLK100MHZ,           // 100 MHz clock input
    input [1:0] sw,            // 2 switches for mode and reset
    output [1:0] LED,          // 2 LEDs for display of counter value
    output [6:0] seg,          // 7-segment display segments
    output dp,                 // Decimal point for 7-segment display
    output [1:0] an            // 2 anodes for 7-segment displays
);

    // Internal signals
    wire clk_6ms;
    wire [1:0] counter_value;
    
    // Instantiate clock divider to generate a 6 ms pulse
    clk_divider clk_div_inst (
        .clk_in(CLK100MHZ),
        .clk_out(clk_6ms)
    );

    // Instantiate bit_UpDown counter module
    bit_UpDown counter_inst (
        .clk(clk_6ms),
        .reset(sw[0]),  // Switch 0 as reset
        .mode(sw[1]),   // Switch 1 as mode
        .dout(counter_value)
    );

    // Instantiate seven_segment_decoder
    seven_segment_decoder seg_dec_inst (
        .binary_input(counter_value),
        .seg(seg)
    );

    // Direct mapping of counter value to LEDs
    assign LED = counter_value;

    // Activate the first 7-segment display (active low configuration)
    assign an = 2'b10;  // Enable only the first 7-segment display (active low logic)
    assign dp = 1'b1;   // Decimal point off

endmodule

