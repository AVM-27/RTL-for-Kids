`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2024 23:04:24
// Design Name: 
// Module Name: seven_segment_decoder
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
module seven_segment_decoder (
    input [1:0] binary_input,  // 2-bit binary input
    output reg [6:0] seg       // 7-segment display output
);

    always @(*) begin
        case(binary_input)
            2'b00: seg = 7'b1000000;  // Display '0'
            2'b01: seg = 7'b1111001;  // Display '1'
            2'b10: seg = 7'b0100100;  // Display '2'
            2'b11: seg = 7'b0110000;  // Display '3'
            default: seg = 7'b1111111; // Default case to turn off all segments
        endcase
    end

endmodule
