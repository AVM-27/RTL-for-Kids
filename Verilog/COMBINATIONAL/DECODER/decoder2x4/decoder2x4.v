//==================================================
// Filename       : decoder2x4.v
// Description    : 2-to-4 Line Decoder (Behavioural)
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module decoder2x4_beh (
    input  [1:0] in,    // 2-bit input
    output reg [3:0] out // One-hot 4-bit output
);

    always @(*) begin
        // Default all outputs to 0
        out = 4'b0000;

        // Activate exactly one output bit based on input
        case (in)
            2'b00: out = 4'b0001;
            2'b01: out = 4'b0010;
            2'b10: out = 4'b0100;
            2'b11: out = 4'b1000;
        endcase
    end

endmodule
