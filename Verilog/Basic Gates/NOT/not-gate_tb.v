//==================================================
// Filename       : not-gate_tb.v
// Description    : Testbench for 1-input NOT gate
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns / 1ps  // Define simulation time unit and precision

module NOT_tb;

    // Declare testbench signals
    reg t_a;         // Input to the DUT
    wire t_y;        // Output from the DUT

    // Instantiate the Design Under Test (DUT)
    myNOT dut (
        .in1(t_a),   // Connect test input to module input
        .out(t_y)    // Connect module output to test output
    );

    // Begin simulation
    initial begin
        $display("Starting NOT gate testbench...");
        $monitor("Time=%0t | a=%b -> y=%b", $time, t_a, t_y);

        // -------- Test Case 1: NOT 0 -> 1 --------
        t_a = 1'b0;
        #10;
        if (t_y !== 1'b1)
            $display("❌ Test 0 FAILED");
        else
            $display("✅ Test 0 PASSED");

        // -------- Test Case 2: NOT 1 -> 0 --------
        t_a = 1'b1;
        #10;
        if (t_y !== 1'b0)
            $display("❌ Test 1 FAILED");
        else
            $display("✅ Test 1 PASSED");

        // End of test
        $display("All tests completed.");
        #10;
        $finish;
    end

endmodule
