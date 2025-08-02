//==================================================
// Filename       : counter_2bit_updown.v
// Description    : 2-bit Up/Down counter with asynchronous reset
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module bit_UpDown (
    input clk,           // Clock input
    input reset,         // Asynchronous active-high reset
    input mode,          // Mode select: 1 = Up count, 0 = Down count
    output reg [1:0] dout // 2-bit counter output
);

// On positive edge of clock or reset
always @(posedge clk or posedge reset) begin
    if (reset)
        dout <= 2'b00;           // Reset counter to 0
    else if (mode)
        dout <= dout + 1;        // Count up
    else
        dout <= dout - 1;        // Count down
end

endmodule
