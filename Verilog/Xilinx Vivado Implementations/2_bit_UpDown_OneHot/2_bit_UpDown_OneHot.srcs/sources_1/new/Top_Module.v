`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2024 14:25:58
// Design Name: 
// Module Name: top_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Top module to integrate the bit_UpDown counter with input switches and output LEDs
// 
// Dependencies: bit_UpDown
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module top_module (
    input wire clk,            // Clock signal
    input wire reset,          // Reset signal
    input wire mode,           // Control signal (mode for up/down)
    output wire [3:0] dout     // One-hot encoded output
);

    // Instantiate the bit_UpDown module
    bit_UpDown counter (
        .clk(clk),
        .reset(reset),
        .mode(mode),           // Map 'mode' to 'up_down'
        .count(),             // No need to connect the 2-bit counter output
        .one_hot(dout)        // Map 'one_hot' to 'dout'
    );

endmodule



