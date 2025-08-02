//==================================================
// Filename       : priority_encoder4x2.v
// Description    : 4-to-2 Priority Encoder (MSB Priority)
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module priority_encoder4x2 (
    input  [3:0] in,     // 4-bit input vector
    output reg [1:0] out, // Encoded binary output
    output reg valid      // Output valid flag
);

    always @(*) begin
        casez (in)
            4'b1???: begin out = 2'b11; valid = 1; end // in[3]
            4'b01??: begin out = 2'b10; valid = 1; end // in[2]
            4'b001?: begin out = 2'b01; valid = 1; end // in[1]
            4'b0001: begin out = 2'b00; valid = 1; end // in[0]
            default: begin out = 2'b00; valid = 0; end // No input set
        endcase
    end

endmodule
