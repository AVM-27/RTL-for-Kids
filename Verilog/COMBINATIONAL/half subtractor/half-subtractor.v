//==================================================
// Filename       : half-subtractor.v
// Description    : Half Subtractor (1-bit) 
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module half_subtractor (
    input a,           // Minuend
    input b,           // Subtrahend
    output diff,       // Difference output
    output borrow      // Borrow output
);

    // Difference is a XOR b
    assign diff = a ^ b;

    // Borrow is ~a & b
    assign borrow = (~a) & b;

endmodule
