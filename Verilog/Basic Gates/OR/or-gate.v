//==================================================
// Filename       : or-gate.v
// Description    : 2-input OR gate
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

// Define the module named myOR with two inputs and one output
module myOR(
    input in1,        // First input to the OR gate
    input in2,        // Second input to the OR gate
    output out        // Output of the OR gate
);

// Perform bitwise OR operation
assign out = in1 | in2;  // OR logic: output is 1 if any input is 1

endmodule  // End of module
