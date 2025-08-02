//==================================================
// Filename       : xor-gate.v
// Description    : 2-input XOR gate
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module myEXOR(
    input in1,       // First input
    input in2,       // Second input
    output out       // XOR output
);

// XOR gate: output is high only if inputs are different
assign out = in1 ^ in2;

endmodule
