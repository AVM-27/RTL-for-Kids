`timescale 1ns / 1ps
//==================================================
// Filename       : comparator_4bit_tb.v
// Description    : Testbench for 4-bit Comparator
// GitHub         : https://github.com/AVM-27/RTL-for-Kids
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module comparator_4bit_tb;

    reg  [3:0] A, B;
    wire A_gt_B, A_eq_B, A_lt_B;

    // Instantiate DUT
    comparator_4bit dut (
        .A(A),
        .B(B),
        .A_gt_B(A_gt_B),
        .A_eq_B(A_eq_B),
        .A_lt_B(A_lt_B)
    );

    initial begin
        $monitor("Time = %0t | A = %b, B = %b | A > B = %b | A == B = %b | A < B = %b",
                 $time, A, B, A_gt_B, A_eq_B, A_lt_B);

        // Test A > B
        A = 4'b1010; B = 4'b0101; #10;
        // Test A < B
        A = 4'b0011; B = 4'b1100; #10;
        // Test A == B
        A = 4'b0110; B = 4'b0110; #10;
        // Edge case: both 0
        A = 4'b0000; B = 4'b0000; #10;
        // Edge case: both 15
        A = 4'b1111; B = 4'b1111; #10;
        // Mixed case
        A = 4'b1000; B = 4'b0111; #10;

        $finish;
    end

endmodule
