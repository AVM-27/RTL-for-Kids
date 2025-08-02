//==================================================
// Filename       : not-gate.v
// Description    : 1-input NOT gate (Inverter)
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module myNOT(
    input in1,       // Input to NOT gate
    output out       // Output of NOT gate
);

// Bitwise NOT operation: output is inverse of input
assign out = ~in1;

endmodule
