//==================================================
// Filename       : ripple-carry-adder4.v
// Description    : 4-bit Ripple Carry Adder
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module full_adder (
    input a,           // First bit
    input b,           // Second bit
    input cin,         // Carry-in
    output sum,        // Sum output
    output cout        // Carry-out
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module ripple_carry_adder4 (
    input  [3:0] a,     // First operand
    input  [3:0] b,     // Second operand
    input        cin,   // Initial carry-in
    output [3:0] sum,   // 4-bit sum output
    output       cout   // Final carry-out
);
    wire c1, c2, c3;

    // Instantiate full adders in ripple fashion
    full_adder fa0 (a[0], b[0], cin,  sum[0], c1);
    full_adder fa1 (a[1], b[1], c1,   sum[1], c2);
    full_adder fa2 (a[2], b[2], c2,   sum[2], c3);
    full_adder fa3 (a[3], b[3], c3,   sum[3], cout);

endmodule
