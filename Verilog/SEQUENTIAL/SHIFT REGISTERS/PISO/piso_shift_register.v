`timescale 1ns / 1ps
//==================================================
// Filename       : piso_shift_register.v
// Description    : Parallel-In Serial-Out (PISO) 4-bit shift register
// GitHub         : https://github.com/AVM-27/
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module piso_shift_register (
    input clk,
    input reset,
    input load,
    input [3:0] parallel_in,
    output reg serial_out
);

    reg [3:0] temp;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            temp <= 4'b0000;
            serial_out <= 1'b0;
        end
        else if (load) begin
            temp <= parallel_in;
        end
        else begin
            serial_out <= temp[3];       // MSB goes out first
            temp <= temp << 1;          // Left shift
        end
    end

endmodule
