`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.08.2024 17:39:33
// Design Name: 
// Module Name: moore_1011
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


module moore_1011(
    input wire clk,
    input wire reset,
    input wire in,
    output reg out
);

    // State encoding using `localparam`
    localparam idle    = 4'b0000;
    localparam got1    = 4'b0001;
    localparam got10   = 4'b0010;
    localparam got101  = 4'b0101;
    localparam got1011 = 4'b1011;

    reg [3:0] current_state, next_state;  // Updated width to 4 bits

    // State transition logic (sequential)
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= idle;
        else
            current_state <= next_state;
    end

    // Next state logic (combinational)
    always @(*) begin
        case (current_state)
            idle:    next_state = (in) ? got1 : idle;
            got1:    next_state = (in) ? got1 : got10;
            got10:   next_state = (in) ? got101 : idle;
            got101:  next_state = (in) ? got1011 : got10;
            got1011: next_state = (in) ? got1 : got10;
            default: next_state = idle;
        endcase
    end

    // Output logic (Moore)
    always @(posedge clk or posedge reset) begin
        if (reset)
            out <= 0;
        else
            out <= (current_state == got1011);
    end

endmodule
