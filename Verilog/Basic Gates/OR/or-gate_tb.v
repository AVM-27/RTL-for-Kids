//==================================================
// Filename       : or-gate_tb.v
// Description    : Testbench for 2-input OR gate
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns / 1ps  // Define time unit and precision for simulation

module OR_tb;

    // Declare input and output testbench signals
    reg t_a, t_b;       // Test inputs (reg because we assign values in 'initial')
    wire t_y;           // Output wire to observe DUT (myOR)

    // Instantiate the Design Under Test (DUT)
    myOR dut (
        .in1(t_a),      // Connect t_a to in1
        .in2(t_b),      // Connect t_b to in2
        .out(t_y)       // Connect t_y to out
    );

    // Initial block: executes once at time 0
    initial begin
        // Display banner
        $display("Starting OR gate testbench...");

        // Monitor signal values whenever any change occurs
        $monitor("Time=%0t | a=%b b=%b -> y=%b", $time, t_a, t_b, t_y);

        // -------- Test Case 1: 0 OR 0 -> 0 --------
        t_a = 0; t_b = 0;   // Apply inputs
        #10;               // Wait 10 time units
        if (t_y !== 0)     // Check output
            $display("❌ Test 00 FAILED");
        else
            $display("✅ Test 00 PASSED");

        // -------- Test Case 2: 0 OR 1 -> 1 --------
        t_a = 0; t_b = 1;
        #10;
        if (t_y !== 1)
            $display("❌ Test 01 FAILED");
        else
            $display("✅ Test 01 PASSED");

        // -------- Test Case 3: 1 OR 0 -> 1 --------
        t_a = 1; t_b = 0;
        #10;
        if (t_y !== 1)
            $display("❌ Test 10 FAILED");
        else
            $display("✅ Test 10 PASSED");

        // -------- Test Case 4: 1 OR 1 -> 1 --------
        t_a = 1; t_b = 1;
        #10;
        if (t_y !== 1)
            $display("❌ Test 11 FAILED");
        else
            $display("✅ Test 11 PASSED");

        // Finish the simulation
        $display("All tests complete.");
        $finish;  // Stop simulation
    end

endmodule  // End of testbench module
