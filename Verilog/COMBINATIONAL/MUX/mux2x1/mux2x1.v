//==================================================
// Filename       : mux2x1.v
// Description    : 2:1 Multiplexer (1-bit wide)
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module mux2x1 (
    input  wire a,      // Input line 0
    input  wire b,      // Input line 1
    input  wire sel,    // Select line
    output wire y       // Output
);

    // If sel = 0, y = a; if sel = 1, y = b
    assign y = sel ? b : a;

endmodule
