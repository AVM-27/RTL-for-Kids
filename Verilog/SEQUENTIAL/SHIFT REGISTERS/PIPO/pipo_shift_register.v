`timescale 1ns / 1ps
//==================================================
// Filename       : pipo_shift_register.v
// Description    : Parallel-In Parallel-Out (PIPO) 4-bit register
// GitHub         : https://github.com/AVM-27/
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module pipo_shift_register (
    input clk,
    input reset,
    input load,
    input [3:0] parallel_in,
    output reg [3:0] parallel_out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            parallel_out <= 4'b0000;
        else if (load)
            parallel_out <= parallel_in;
    end

endmodule
