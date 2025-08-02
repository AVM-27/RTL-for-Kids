//==================================================
// Filename       : full_adder.v
// Description    : 1-bit Full Adder - computes SUM and CARRY with carry-in
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module full_adder(
    input  wire a,         // Input bit A
    input  wire b,         // Input bit B
    input  wire cin,       // Carry-in
    output wire sum,       // SUM output
    output wire carry      // CARRY output (carry-out)
);

    assign sum   = a ^ b ^ cin;               // XOR for sum
    assign carry = (a & b) | (b & cin) | (a & cin);  // Majority logic for carry

endmodule
