//==================================================
// Filename       : decoder4x16_struct.v
// Description    : 4-to-16 Decoder using 2-to-4 Decoders (Structural)
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module decoder2x4 (
    input [1:0] in,
    input en,
    output [3:0] out
);
    assign out[0] = (~in[1] & ~in[0]) & en;
    assign out[1] = (~in[1] &  in[0]) & en;
    assign out[2] = ( in[1] & ~in[0]) & en;
    assign out[3] = ( in[1] &  in[0]) & en;
endmodule

module decoder4x16_struct (
    input  [3:0] in,      // 4-bit input
    output [15:0] out     // 16 one-hot outputs
);
    wire [3:0] en;

    // Higher bits control enables of lower decoders
    decoder2x4 u_en_decoder (
        .in(in[3:2]),
        .en(1'b1),     // Always enabled
        .out(en)
    );

    // Four 2x4 decoders for lower 2 bits
    decoder2x4 u0 (.in(in[1:0]), .en(en[0]), .out(out[3:0]));
    decoder2x4 u1 (.in(in[1:0]), .en(en[1]), .out(out[7:4]));
    decoder2x4 u2 (.in(in[1:0]), .en(en[2]), .out(out[11:8]));
    decoder2x4 u3 (.in(in[1:0]), .en(en[3]), .out(out[15:12]));

endmodule
