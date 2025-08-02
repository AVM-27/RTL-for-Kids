//==================================================
// Filename       : counter_2bit.v
// Description    : 2-bit binary up-counter with asynchronous reset
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module counter_2bit (
    input clk,           // Clock input
    input reset,         // Asynchronous active-high reset
    output reg [1:0] dout // 2-bit counter output
);

// Initialise counter output
initial dout = 0;

// On every positive clock edge or asynchronous reset
always @(posedge clk or posedge reset) begin
    if (reset)
        dout <= 0;           // Reset output to 0
    else
        dout <= dout + 1;    // Increment counter
end

endmodule
