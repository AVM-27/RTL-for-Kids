//==================================================
// Filename       : cla4.v
// Description    : 4-bit Carry Lookahead Adder (CLA)
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module cla4 (
    input  [3:0] a,       // First operand
    input  [3:0] b,       // Second operand
    input        cin,     // Initial carry-in
    output [3:0] sum,     // Sum output
    output       cout     // Final carry-out
);
    wire [3:0] g, p; // Generate and propagate
    wire [3:1] c;    // Internal carries

    // Generate and Propagate
    assign g = a & b;     // Generate
    assign p = a ^ b;     // Propagate

    // Carry Lookahead Logic
    assign c[1] = g[0] | (p[0] & cin);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) |
                  (p[3] & p[2] & p[1] & g[0]) |
                  (p[3] & p[2] & p[1] & p[0] & cin);

    // Sum calculation
    assign sum[0] = p[0] ^ cin;
    assign sum[1] = p[1] ^ c[1];
    assign sum[2] = p[2] ^ c[2];
    assign sum[3] = p[3] ^ c[3];

endmodule
