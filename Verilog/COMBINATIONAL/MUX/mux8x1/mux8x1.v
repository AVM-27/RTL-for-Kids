//==================================================
// Filename       : mux8x1.v
// Description    : 8:1 Multiplexer (1-bit wide)
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module mux8x1 (
    input  wire [7:0] in,    // Data inputs: in[7] to in[0]
    input  wire [2:0] sel,   // 3-bit select input
    output wire y            // Output
);

    // Use ternary selection based on 'sel'
    assign y = (sel == 3'b000) ? in[0] :
               (sel == 3'b001) ? in[1] :
               (sel == 3'b010) ? in[2] :
               (sel == 3'b011) ? in[3] :
               (sel == 3'b100) ? in[4] :
               (sel == 3'b101) ? in[5] :
               (sel == 3'b110) ? in[6] :
                                in[7];

endmodule
