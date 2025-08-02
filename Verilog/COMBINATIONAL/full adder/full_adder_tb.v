//==================================================
// Filename       : full_adder_tb.v
// Description    : Testbench for 1-bit Full Adder
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns/1ps

module full_adder_tb;

    reg  a, b, cin;         // Inputs to DUT
    wire sum, carry;        // Outputs from DUT

    // DUT instantiation
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $display("=== Full Adder Testbench ===");
        $display(" A B Cin | SUM CARRY ");
        $display("--------|-------------");

        // 0 + 0 + 0 => sum = 0, carry = 0
        a = 0; b = 0; cin = 0;
        #10 $display(" %b %b  %b  |  %b     %b", a, b, cin, sum, carry);

        // 0 + 0 + 1 => sum = 1, carry = 0
        a = 0; b = 0; cin = 1;
        #10 $display(" %b %b  %b  |  %b     %b", a, b, cin, sum, carry);

        // 0 + 1 + 0 => sum = 1, carry = 0
        a = 0; b = 1; cin = 0;
        #10 $display(" %b %b  %b  |  %b     %b", a, b, cin, sum, carry);

        // 0 + 1 + 1 => sum = 0, carry = 1
        a = 0; b = 1; cin = 1;
        #10 $display(" %b %b  %b  |  %b     %b", a, b, cin, sum, carry);

        // 1 + 0 + 0 => sum = 1, carry = 0
        a = 1; b = 0; cin = 0;
        #10 $display(" %b %b  %b  |  %b     %b", a, b, cin, sum, carry);

        // 1 + 0 + 1 => sum = 0, carry = 1
        a = 1; b = 0; cin = 1;
        #10 $display(" %b %b  %b  |  %b     %b", a, b, cin, sum, carry);

        // 1 + 1 + 0 => sum = 0, carry = 1
        a = 1; b = 1; cin = 0;
        #10 $display(" %b %b  %b  |  %b     %b", a, b, cin, sum, carry);

        // 1 + 1 + 1 => sum = 1, carry = 1
        a = 1; b = 1; cin = 1;
        #10 $display(" %b %b  %b  |  %b     %b", a, b, cin, sum, carry);

        $display("Testbench completed.");
        $finish;
    end

endmodule
