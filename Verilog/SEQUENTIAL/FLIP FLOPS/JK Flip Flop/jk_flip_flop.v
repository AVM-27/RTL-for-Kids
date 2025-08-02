//==================================================
// Filename       : jk_flip_flop.v
// Description    : JK Flip-Flop with synchronous reset
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module jk_flip_flop (
    input clk,       // Clock input
    input reset,     // Synchronous reset
    input j,         // J input
    input k,         // K input
    output reg q     // Output
);

// Initialise output
initial q = 0;

always @(posedge clk) begin
    if (reset)
        q <= 0;           // Clear on reset
    else begin
        case ({j, k})
            2'b00: q <= q;        // Hold state
            2'b01: q <= 0;        // Reset
            2'b10: q <= 1;        // Set
            2'b11: q <= ~q;       // Toggle
        endcase
    end
end

endmodule
