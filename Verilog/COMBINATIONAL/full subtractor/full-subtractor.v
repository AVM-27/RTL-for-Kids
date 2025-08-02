//==================================================
// Filename       : full-subtractor.v
// Description    : Full Subtractor (1-bit)
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module full_subtractor (
    input a,             // Minuend
    input b,             // Subtrahend
    input bin,           // Borrow-in
    output diff,         // Difference output
    output bout          // Borrow-out
);

    // Difference logic: a - b - bin
    assign diff = a ^ b ^ bin;

    // Borrow-out logic
    assign bout = (~a & b) | ((~(a ^ b)) & bin);

endmodule
