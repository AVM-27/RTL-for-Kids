//==================================================
// Filename       : johnson_counter_4bit.v
// Description    : 4-bit Johnson counter (twisted ring)
// GitHub         : https://github.com/AVM-27/RTL-for-Kids
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================
module johnson_counter_4bit (
    input clk,
    input reset,
    output reg [3:0] dout
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            dout <= 4'b0000;  // Start with all 0s
        else
            dout <= {~dout[0], dout[3:1]};  // Feedback inverted MSB into LSB
    end

endmodule
