//==================================================
// Module Name  : myAND
// Description  : 2-input AND gate
// GitHub       : https://github.com/AVM-27
// Author       : Adarsh Venugopal
// Created On   : 2025-08-02
//==================================================

module myAND(
    input  in1,   // First input bit
    input  in2,   // Second input bit
    output out    // Output bit = in1 AND in2
);

// Bitwise AND operation using '&' operator.
// Output is 1 only when both inputs are 1.
assign out = in1 & in2;

endmodule
