//==================================================
// Filename       : xor-gate_tb.v
// Description    : Testbench for 2-input XOR gate
// GitHub         : https://github.com/AVM-27/RTL-for-Kids
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns / 1ps

module EXOR_tb;

    // Declare testbench inputs and outputs
    reg t_a, t_b;       // Inputs
    wire t_y;           // Output

    // Instantiate the DUT (Device Under Test)
    myEXOR dut (
        .in1(t_a),
        .in2(t_b),
        .out(t_y)
    );

    initial begin
        $display("Starting XOR gate testbench...");
        $monitor("Time=%0t | a=%b, b=%b -> y=%b", $time, t_a, t_b, t_y);

        // Test Case 1: 0 ^ 0 = 0
        t_a = 1'b0; t_b = 1'b0;
        #10;
        if (t_y !== 1'b0) $display("❌ Test 00 FAILED"); else $display("✅ Test 00 PASSED");

        // Test Case 2: 0 ^ 1 = 1
        t_a = 1'b0; t_b = 1'b1;
        #10;
        if (t_y !== 1'b1) $display("❌ Test 01 FAILED"); else $display("✅ Test 01 PASSED");

        // Test Case 3: 1 ^ 0 = 1
        t_a = 1'b1; t_b = 1'b0;
        #10;
        if (t_y !== 1'b1) $display("❌ Test 10 FAILED"); else $display("✅ Test 10 PASSED");

        // Test Case 4: 1 ^ 1 = 0
        t_a = 1'b1; t_b = 1'b1;
        #10;
        if (t_y !== 1'b0) $display("❌ Test 11 FAILED"); else $display("✅ Test 11 PASSED");

        $display("All tests completed.");
        #10;
        $finish;
    end

endmodule
