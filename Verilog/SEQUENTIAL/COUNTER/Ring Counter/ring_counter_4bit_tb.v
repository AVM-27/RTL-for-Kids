
//==================================================
// Filename       : ring_counter_4bit_tb.v
// Description    : Testbench for 4-bit ring counter
// GitHub         : https://github.com/AVM-27/RTL-for-Kids
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================
`timescale 1ns / 1ps
module ring_counter_4bit_tb;

    // Declare testbench signals
    reg clk;
    reg reset;
    wire [3:0] dout;

    // Instantiate the DUT (Device Under Test)
    ring_counter_4bit dut (
        .clk(clk),
        .reset(reset),
        .dout(dout)
    );

    // Clock generation block (10 ns clock period)
    always #5 clk = ~clk;

    initial begin
        // Display simulation output on terminal
        $monitor("Time = %0t | reset = %b | dout = %b", $time, reset, dout);

        // Initial signal values
        clk = 0;
        reset = 1;     // Assert reset

        #10;
        reset = 0;     // Deassert reset

        // Allow the counter to cycle through outputs
        #80;

        // Re-assert reset to check correct reset behaviour
        reset = 1;
        #10;
        reset = 0;

        // Observe output after second reset
        #40;

        // End simulation
        $finish;
    end

endmodule
