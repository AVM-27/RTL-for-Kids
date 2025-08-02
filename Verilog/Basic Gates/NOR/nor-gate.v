//==================================================
// Filename       : nor-gate.v
// Description    : 2-input NOR gate
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module myNOR(
    input in1,       // First input
    input in2,       // Second input
    output out       // NOR output
);

// NOR operation: Output is the negation of OR
assign out = ~(in1 | in2);

endmodule
