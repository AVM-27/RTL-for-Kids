
//==================================================
// Filename       : jk_flip_flop_tb.v
// Description    : Testbench for JK Flip-Flop
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module jk_flip_flop_tb;
    reg clk;
    reg reset;
    reg j;
    reg k;
    wire q;

    // Instantiate JK Flip-Flop
    jk_flip_flop dut(.clk(clk), .reset(reset), .j(j), .k(k), .q(q));

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | j = %b | k = %b | q = %b",
                 $time, clk, reset, j, k, q);

        // Initial states
        clk = 0;
        reset = 0;
        j = 0;
        k = 0;

        // Apply reset
        #10 reset = 1; #10 reset = 0;
        if (q !== 0) $display("01 ERROR: Expected q = 0 after reset");

        // Hold condition (j=0,k=0)
        j = 0; k = 0; #10;
        if (q !== 0) $display("02 ERROR: Expected q = 0 (hold)");

        // Set condition (j=1,k=0)
        j = 1; k = 0; #10;
        if (q !== 1) $display("03 ERROR: Expected q = 1 for J=1,K=0");

        // Reset condition (j=0,k=1)
        j = 0; k = 1; #10;
        if (q !== 0) $display("04 ERROR: Expected q = 0 for J=0,K=1");

        // Toggle condition (j=1,k=1)
        j = 1; k = 1; #10;
        if (q !== 1) $display("05 INFO: Expected q toggled to 1");

        j = 1; k = 1; #10;
        if (q !== 0) $display("06 INFO: Expected q toggled to 0");

        // End simulation
        $finish;
    end
endmodule
