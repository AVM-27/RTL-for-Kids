//==================================================
// Filename       : half_adder.v
// Description    : 1-bit Half Adder - computes SUM and CARRY
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module half_adder(
    input  wire a,         // Input bit A
    input  wire b,         // Input bit B
    output wire sum,       // SUM = A XOR B
    output wire carry      // CARRY = A AND B
);

    assign sum   = a ^ b;  // XOR for sum
    assign carry = a & b;  // AND for carry

endmodule
