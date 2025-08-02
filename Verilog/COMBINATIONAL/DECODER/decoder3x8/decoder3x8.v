//==================================================
// Filename       : decoder3x8.v
// Description    : 3-to-8 Line Decoder (Behavioural)
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module decoder3x8_beh (
    input  [2:0] in,     // 3-bit input
    output reg [7:0] out // One-hot 8-bit output
);

    always @(*) begin
        // Default output
        out = 8'b00000000;

        // Set only one output bit based on input value
        case (in)
            3'b000: out = 8'b00000001;
            3'b001: out = 8'b00000010;
            3'b010: out = 8'b00000100;
            3'b011: out = 8'b00001000;
            3'b100: out = 8'b00010000;
            3'b101: out = 8'b00100000;
            3'b110: out = 8'b01000000;
            3'b111: out = 8'b10000000;
        endcase
    end

endmodule
