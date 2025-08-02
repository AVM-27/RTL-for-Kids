`timescale 1ns / 1ps
//==================================================
// Filename       : piso_shift_register_tb.v
// Description    : Testbench for PISO 4-bit shift register
// GitHub         : https://github.com/AVM-27/
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module piso_shift_register_tb;

    reg clk;
    reg reset;
    reg load;
    reg [3:0] parallel_in;
    wire serial_out;

    // Instantiate DUT
    piso_shift_register dut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0t | load = %b | parallel_in = %b | serial_out = %b", 
                 $time, load, parallel_in, serial_out);

        // Initial values
        clk = 0;
        reset = 1;
        load = 0;
        parallel_in = 4'b0000;

        // Apply reset
        #10; reset = 0;

        // Load data: 1011
        #5; parallel_in = 4'b1011; load = 1;
        #10; load = 0;

        // Let it shift out
        #40;

        // Load new data: 0101
        #5; parallel_in = 4'b0101; load = 1;
        #10; load = 0;

        // Observe output again
        #40;

        $finish;
    end

endmodule
