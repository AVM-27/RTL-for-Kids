`timescale 1ns / 1ps
//==================================================
// Filename       : siso_shift_register.v
// Description    : Serial-In Serial-Out (SISO) 4-bit shift register
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module siso_shift_register (
    input clk,
    input reset,
    input serial_in,
    output reg serial_out
);

    reg [3:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset)
            shift_reg <= 4'b0000;
        else begin
            shift_reg <= {shift_reg[2:0], serial_in};  // Shift left
        end
    end

    always @(*) begin
        serial_out = shift_reg[3];  // MSB is shifted out
    end

endmodule
