`timescale 1ns / 1ps
//==================================================
// Filename       : johnson_counter_4bit_tb.v
// Description    : Testbench for 4-bit Johnson counter
// GitHub         : https://github.com/AVM-27/RTL-for-Kids
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module johnson_counter_4bit_tb;

    // Declare testbench signals
    reg clk;
    reg reset;
    wire [3:0] dout;

    // Instantiate the DUT (Device Under Test)
    johnson_counter_4bit dut (
        .clk(clk),
        .reset(reset),
        .dout(dout)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Print signal transitions during simulation
        $monitor("Time = %0t | reset = %b | dout = %b", $time, reset, dout);

        // Initialise signals
        clk = 0;
        reset = 1;

        #10;
        reset = 0;

        // Let the Johnson counter run through its 8 unique states
        #80;

        // Apply reset again mid-way to test restart behaviour
        reset = 1;
        #10;
        reset = 0;

        #40;

        $finish;
    end

endmodule
