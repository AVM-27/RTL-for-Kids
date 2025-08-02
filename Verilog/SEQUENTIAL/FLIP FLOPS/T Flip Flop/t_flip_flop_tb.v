//==================================================
// Filename       : t_flip_flop_tb.v
// Description    : Testbench for T Flip-Flop
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module t_flip_flop_tb;
    reg clk;
    reg reset;
    reg t;
    wire q;

    // Instantiate the T flip-flop
    t_flip_flop dut(.clk(clk), .reset(reset), .t(t), .q(q));

    // Clock generation: Toggle every 5 time units
    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | t = %b | q = %b", $time, clk, reset, t, q);

        // Initialize inputs
        clk = 0;
        reset = 0;
        t = 0;

        // Test 1: Reset
        #10; reset = 1;
        #10; reset = 0;
        if (q !== 1'b0) $display("01 ERROR: Expected q = 0 after reset");

        // Test 2: T = 1, q toggles to 1
        t = 1;
        #10;
        if (q !== 1'b1) $display("02 ERROR: Expected q = 1");

        // Test 3: T = 1 again, q toggles to 0
        #10;
        if (q !== 1'b0) $display("03 ERROR: Expected q = 0");

        // Test 4: Reset again
        reset = 1;
        #10; reset = 0;
        if (q !== 1'b0) $display("04 ERROR: Expected q = 0 after reset");

        // Test 5: T = 1, q toggles to 1
        t = 1;
        #10;
        if (q !== 1'b1) $display("05 ERROR: Expected q = 1");

        // Test 6: T = 0, q should remain 1
        t = 0;
        #10;
        if (q !== 1'b1) $display("06 ERROR: Expected q = 1, no toggle on T=0");

        $finish;
    end
endmodule
