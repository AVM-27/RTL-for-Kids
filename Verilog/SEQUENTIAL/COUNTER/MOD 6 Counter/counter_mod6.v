//==================================================
// Filename       : counter_mod6.v
// Description    : Mod-6 counter with asynchronous reset
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module counter_mod6 (
    input clk,           // Clock input
    input reset,         // Asynchronous reset
    output reg [2:0] dout // 3-bit counter output
);

// Initialise output
initial dout = 3'd0;

// Count 0 to 5 and wrap to 0
always @(posedge clk or posedge reset) begin
    if (reset)
        dout <= 3'd0;
    else if (dout == 3'd5)
        dout <= 3'd0;
    else
        dout <= dout + 1;
end

endmodule
