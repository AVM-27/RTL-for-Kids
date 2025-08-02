//==================================================
// Filename       : nand-gate.v
// Description    : 2-input NAND gate
// GitHub         : https://github.com/AVM-27/RTL-for-Kids
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module myNAND(
    input in1,       // First input
    input in2,       // Second input
    output out       // NAND output
);

// NAND operation: Output is the negation of AND
assign out = ~(in1 & in2);

endmodule
