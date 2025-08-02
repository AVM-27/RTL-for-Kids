//==================================================
// Filename       : sr_flip_flop_tb.v
// Description    : Testbench for SR Flip-Flop
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module sr_flip_flop_tb;
    reg clk;
    reg reset;
    reg s;
    reg r;
    wire q;

    // Instantiate SR Flip-Flop
    sr_flip_flop dut(.clk(clk), .reset(reset), .s(s), .r(r), .q(q));

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | s = %b | r = %b | q = %b", 
                  $time, clk, reset, s, r, q);

        // Initial states
        clk = 0;
        reset = 0;
        s = 0;
        r = 0;

        // Apply reset
        #10 reset = 1; #10 reset = 0;
        if (q !== 0) $display("01 ERROR: Expected q = 0 after reset");

        // Set condition
        s = 1; r = 0; #10;
        if (q !== 1) $display("02 ERROR: Expected q = 1 for S=1, R=0");

        // Reset condition
        s = 0; r = 1; #10;
        if (q !== 0) $display("03 ERROR: Expected q = 0 for S=0, R=1");

        // Hold state
        s = 0; r = 0; #10;
        if (q !== 0) $display("04 ERROR: Expected q = 0 (hold)");

        // Invalid condition
        s = 1; r = 1; #10;
        if (q !== 1'bx) $display("05 ERROR: Expected q = x for S=1, R=1");

        // End simulation
        $finish;
    end
endmodule
