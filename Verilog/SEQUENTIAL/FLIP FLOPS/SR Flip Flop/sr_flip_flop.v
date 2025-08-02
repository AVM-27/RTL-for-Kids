//==================================================
// Filename       : sr_flip_flop.v
// Description    : SR Flip-Flop with synchronous reset
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module sr_flip_flop (
    input clk,       // Clock input
    input reset,     // Synchronous reset
    input s,         // Set input
    input r,         // Reset input
    output reg q     // Output
);

// Initialise output
initial q = 0;

always @(posedge clk) begin
    if (reset)
        q <= 0;           // Clear on reset
    else if (s && !r)
        q <= 1;           // Set
    else if (!s && r)
        q <= 0;           // Reset
    else if (!s && !r)
        q <= q;           // Hold state
    else
        q <= 1'bx;        // Invalid: s=1, r=1
end

endmodule
