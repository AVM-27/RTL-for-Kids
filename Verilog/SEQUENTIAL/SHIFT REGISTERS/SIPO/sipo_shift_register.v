`timescale 1ns / 1ps
//==================================================
// Filename       : sipo_shift_register.v
// Description    : Serial-In Parallel-Out (SIPO) 4-bit shift register
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module sipo_shift_register (
    input clk,
    input reset,
    input serial_in,
    output reg [3:0] parallel_out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            parallel_out <= 4'b0000;
        else
            parallel_out <= {parallel_out[2:0], serial_in};  // Left shift
    end

endmodule
