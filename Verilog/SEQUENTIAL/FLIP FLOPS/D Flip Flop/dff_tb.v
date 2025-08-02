//==================================================
// Filename       : dff_tb.v
// Description    : Testbench for D Flip-Flop with Reset
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns / 1ps

module dff_tb;

    reg clk;     // Clock signal
    reg reset;   // Asynchronous reset
    reg d;       // Data input
    wire q;      // Output

    // Instantiate the D flip-flop with async reset
    dff_with_reset dut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generator: toggles every 5ns
    always #5 clk = ~clk;

    initial begin
        // Display header once
        $display("Time\tclk\treset\td\tq");
        $monitor("%4t\t%b\t%b\t%b\t%b", $time, clk, reset, d, q);

        // Initial conditions
        clk = 0;
        reset = 0;
        d = 0;

        // Test Case 1: Apply reset
        #10 reset = 1;
        #10 reset = 0;
        #10;
        if (q !== 1'b0) $display("01 ERROR: Expected q = 0 after reset");

        // Test Case 2: d = 1, should latch on rising clk
        d = 1;
        #10;
        if (q !== 1'b1) $display("02 ERROR: Expected q = 1 after d = 1");

        // Test Case 3: d = 0, should update q
        d = 0;
        #10;
        if (q !== 1'b0) $display("03 ERROR: Expected q = 0 after d = 0");

        // Test Case 4: Reset again
        reset = 1;
        #10 reset = 0;
        #10;
        if (q !== 1'b0) $display("04 ERROR: Expected q = 0 after reset");

        // Test Case 5: d = 1, no reset
        d = 1;
        #10;
        if (q !== 1'b1) $display("05 ERROR: Expected q = 1 when d = 1");

        $finish;
    end

endmodule
