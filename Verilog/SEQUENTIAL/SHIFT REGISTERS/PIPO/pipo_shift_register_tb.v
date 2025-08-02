`timescale 1ns / 1ps
//==================================================
// Filename       : pipo_shift_register_tb.v
// Description    : Testbench for PIPO 4-bit register
// GitHub         : https://github.com/AVM-27/
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module pipo_shift_register_tb;

    reg clk;
    reg reset;
    reg load;
    reg [3:0] parallel_in;
    wire [3:0] parallel_out;

    // DUT instantiation
    pipo_shift_register dut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .parallel_in(parallel_in),
        .parallel_out(parallel_out)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0t | load = %b | parallel_in = %b | parallel_out = %b",
                  $time, load, parallel_in, parallel_out);

        // Initialise
        clk = 0;
        reset = 1;
        load = 0;
        parallel_in = 4'b0000;

        // Apply reset
        #10; reset = 0;

        // Load data: 1010
        #5; parallel_in = 4'b1010; load = 1;
        #10; load = 0;

        // Hold state
        #20;

        // Load new data: 0101
        #5; parallel_in = 4'b0101; load = 1;
        #10; load = 0;

        #20;

        $finish;
    end

endmodule
