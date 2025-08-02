//==================================================
// Filename       : and-gate_tb.v
// Description    : Testbench for a 2-input AND gate
// GitHub         : https://github.com/AVM-27/RTL-for-Kids
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns / 1ps

module AND_tb;

    reg t_a, t_b;     // Inputs to the AND gate
    wire t_y;         // Output from the AND gate

    // DUT (Design Under Test) instantiation
    myAND dut (
        .in1(t_a),
        .in2(t_b),
        .out(t_y)
    );

    initial begin
        $display("Starting AND gate testbench...");
        $monitor("Time=%0t | a=%b b=%b -> y=%b", $time, t_a, t_b, t_y);

        // Test 00 -> Expect 0
        t_a = 0; t_b = 0;
        #10;
        if (t_y !== 0) $display("❌ Test 00 FAILED");
        else $display("✅ Test 00 PASSED");

        // Test 01 -> Expect 0
        t_a = 0; t_b = 1;
        #10;
        if (t_y !== 0) $display("❌ Test 01 FAILED");
        else $display("✅ Test 01 PASSED");

        // Test 10 -> Expect 0
        t_a = 1; t_b = 0;
        #10;
        if (t_y !== 0) $display("❌ Test 10 FAILED");
        else $display("✅ Test 10 PASSED");

        // Test 11 -> Expect 1
        t_a = 1; t_b = 1;
        #10;
        if (t_y !== 1) $display("❌ Test 11 FAILED");
        else $display("✅ Test 11 PASSED");

        $display("All tests complete.");
        $finish;
    end

endmodule
