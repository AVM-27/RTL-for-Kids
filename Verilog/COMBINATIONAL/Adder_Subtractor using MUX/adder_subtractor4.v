//==================================================
// Filename       : adder_subtractor4.v
// Description    : 4-bit Adder/Subtractor using MUX and Ripple-Carry Adder
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module adder_subtractor4 (
    input  [3:0] a,      // First operand
    input  [3:0] b,      // Second operand
    input        mode,   // 0 = Add, 1 = Subtract
    output [3:0] result, // 4-bit result
    output       cout    // Final carry-out (or borrow out)
);
    wire [3:0] b_xor; // b after XOR with mode (for subtraction)
    wire c1, c2, c3;

    // XOR b with mode: if mode=1, invert b (two's complement)
    assign b_xor[0] = b[0] ^ mode;
    assign b_xor[1] = b[1] ^ mode;
    assign b_xor[2] = b[2] ^ mode;
    assign b_xor[3] = b[3] ^ mode;

    // Full adder chain with cin = mode (for add: 0, sub: 1)
    full_adder fa0 (a[0], b_xor[0], mode,   resu
