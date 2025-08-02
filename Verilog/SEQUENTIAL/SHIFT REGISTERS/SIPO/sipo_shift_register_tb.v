`timescale 1ns / 1ps
//==================================================
// Filename       : sipo_shift_register_tb.v
// Description    : Testbench for SIPO 4-bit shift register
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module sipo_shift_register_tb;

    reg clk;
    reg reset;
    reg serial_in;
    wire [3:0] parallel_out;

    // Instantiate DUT
    sipo_shift_register dut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0t | serial_in = %b | parallel_out = %b", $time, serial_in, parallel_out);

        // Initialise
        clk = 0;
        reset = 1;
        serial_in = 0;

        // Apply reset
        #10;
        reset = 0;

        // Shift in 4 bits: 1 -> 0 -> 1 -> 1
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;

        // Hold line to observe stable output
        serial_in = 0; #20;

        // Reset mid-sequence
        reset = 1; #10;
        reset = 0; #10;

        $finish;
    end

endmodule
