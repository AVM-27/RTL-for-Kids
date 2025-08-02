//==================================================
// Filename       : ring_counter_4bit.v
// Description    : 4-bit ring counter (circular shift register)
// GitHub         : https://github.com/AVM-27/RTL-for-Kids
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module ring_counter_4bit (
    input clk,
    input reset,
    output reg [3:0] dout
);

    reg [1:0] state;  // state index: 0 to 3

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= 2'd0;
            dout  <= 4'b0001;  // Start with LSB high
        end else begin
            state <= state + 1;
            case (state)
                2'd0: dout <= 4'b0001;
                2'd1: dout <= 4'b0010;
                2'd2: dout <= 4'b0100;
                2'd3: dout <= 4'b1000;
            endcase
        end
    end

endmodule
