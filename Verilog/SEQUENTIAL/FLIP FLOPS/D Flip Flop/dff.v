//==================================================
// Filename       : dff.v
// Description    : D Flip-Flop with Positive-Edge Trigger
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module dff (
    input  wire clk,  // Clock input (positive-edge triggered)
    input  wire d,    // Data input
    output reg  q     // Flip-flop output
);

    // On each rising edge of the clock, update output q with input d
    always @(posedge clk) begin
        q <= d;
    end

endmodule
