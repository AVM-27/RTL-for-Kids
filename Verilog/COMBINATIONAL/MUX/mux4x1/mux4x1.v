//==================================================
// Filename       : mux4x1.v
// Description    : 4:1 Multiplexer (1-bit wide)
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module mux4x1 (
    input  wire [3:0] in,   // Data inputs: in[3] to in[0]
    input  wire [1:0] sel,  // 2-bit select input
    output wire y           // Output
);

    // Select one of the four inputs based on sel
    assign y = (sel == 2'b00) ? in[0] :
               (sel == 2'b01) ? in[1] :
               (sel == 2'b10) ? in[2] :
                               in[3];

endmodule
