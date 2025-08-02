`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2024 15:19:14
// Design Name: 
// Module Name: Top_Module
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


module Top_Module (
    input wire clk,            // Clock input (currently unused)
    input wire [15:0] sw,      // 16 switches for inputs
    output wire [15:0] led     // 16 LEDs for outputs
);

    // Internal wires for MUX connections
    wire d0, d1, d2, d3;
    wire s0, s1;
    wire y;

    // Default values to avoid unknown states
    assign d0 = 1'b0;
    assign d1 = 1'b0;
    assign d2 = 1'b0;
    assign d3 = 1'b0;
    assign s0 = 1'b0;
    assign s1 = 1'b0;

    // Instantiate the 4x1 MUX
    mux4x1 my_mux (
        .d0(sw[0]),      // Connect sw[0] to d0
        .d1(sw[1]),      // Connect sw[1] to d1
        .d2(sw[2]),      // Connect sw[2] to d2
        .d3(sw[3]),      // Connect sw[3] to d3
        .s0(sw[4]),      // Connect sw[4] to s0
        .s1(sw[5]),      // Connect sw[5] to s1
        .y(led[0])       // Connect output of MUX to led[0]
    );

endmodule


