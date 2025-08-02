//==================================================
// Filename       : priority_encoder8x3.v
// Description    : 8-to-3 Priority Encoder (MSB Priority)
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module encoder8x3_priority (
    input  [7:0] in,     // 8-bit input (multiple bits may be high)
    output reg [2:0] out, // Encoded output
    output reg valid      // Output is valid if any input is high
);

    always @(*) begin
        casex (in)
            8'b1???????: begin out = 3'b111; valid = 1; end // in[7]
            8'b01??????: begin out = 3'b110; valid = 1; end // in[6]
            8'b001?????: begin out = 3'b101; valid = 1; end // in[5]
            8'b0001????: begin out = 3'b100; valid = 1; end // in[4]
            8'b00001???: begin out = 3'b011; valid = 1; end // in[3]
            8'b000001??: begin out = 3'b010; valid = 1; end // in[2]
            8'b0000001?: begin out = 3'b001; valid = 1; end // in[1]
            8'b00000001: begin out = 3'b000; valid = 1; end // in[0]
            default:     begin out = 3'b000; valid = 0; end
        endcase
    end

endmodule
