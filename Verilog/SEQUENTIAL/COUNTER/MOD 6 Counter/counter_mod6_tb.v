//==================================================
// Filename       : counter_mod6_tb.v
// Description    : Testbench for Mod-6 counter
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns / 1ps

module counter_mod6_tb;
    reg clk;
    reg reset;
    wire [2:0] dout;

    // Instantiate DUT
    counter_mod6 dut (
        .clk(clk),
        .reset(reset),
        .dout(dout)
    );

    // Clock: 10 time unit period
    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | dout = %d", 
                  $time, clk, reset, dout);

        // Initial values
        clk = 0;
        reset = 0;

        // Test 1: Reset
        #10; reset = 1;
        #10; reset = 0;
        #10;
        if (dout !== 3'd0) $display("01 ERROR: Expected dout = 0 after reset");

        // Test 2: Count up to 5 and wrap
        #10; if (dout !== 3'd1) $display("02 ERROR: Expected dout = 1");
        #10; if (dout !== 3'd2) $display("03 ERROR: Expected dout = 2");
        #10; if (dout !== 3'd3) $display("04 ERROR: Expected dout = 3");
        #10; if (dout !== 3'd4) $display("05 ERROR: Expected dout = 4");
        #10; if (dout !== 3'd5) $display("06 ERROR: Expected dout = 5");
        #10; if (dout !== 3'd0) $display("07 ERROR: Expected dout = 0 (wrap)");

        // Test 3: Reset again
        #10; reset = 1;
        #10; reset = 0;
        #10;
        if (dout !== 3'd0) $display("08 ERROR: Expected dout = 0 after second reset");

        // End simulation
        $finish;
    end
endmodule
