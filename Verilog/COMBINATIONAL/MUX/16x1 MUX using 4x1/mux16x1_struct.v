//==================================================
// Filename       : mux16x1_struct.v
// Description    : 16:1 MUX built using five 4:1 MUX modules
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

// 4:1 Multiplexer module (used as building block)
module mux4x1 (
    input  wire [3:0] in,    // 4 inputs to the mux
    input  wire [1:0] sel,   // 2-bit select line
    output wire y            // Output
);
    // Based on select value, route the correct input to output
    assign y = (sel == 2'b00) ? in[0] :
               (sel == 2'b01) ? in[1] :
               (sel == 2'b10) ? in[2] :
                               in[3];
endmodule


// 16:1 Multiplexer using 4:1 MUX hierarchy
module mux16x1_struct (
    input  wire [15:0] in,   // 16 input lines
    input  wire [3:0]  sel,  // 4-bit selector (to choose one out of 16)
    output wire y            // Final output
);

    wire [3:0] mux4_out;  // Intermediate outputs from first-level muxes

    // First-level: Divide 16 inputs into 4 groups of 4
    // Each 4:1 mux picks one input based on sel[1:0]
    mux4x1 m0 (.in(in[3:0]),   .sel(sel[1:0]), .y(mux4_out[0]));    // Selects from in[0] to in[3]
    mux4x1 m1 (.in(in[7:4]),   .sel(sel[1:0]), .y(mux4_out[1]));    // Selects from in[4] to in[7]
    mux4x1 m2 (.in(in[11:8]),  .sel(sel[1:0]), .y(mux4_out[2]));    // Selects from in[8] to in[11]
    mux4x1 m3 (.in(in[15:12]), .sel(sel[1:0]), .y(mux4_out[3]));    // Selects from in[12] to in[15]

    // Second-level: Final 4:1 mux selects from previous outputs based on sel[3:2]
    mux4x1 m4 (.in(mux4_out), .sel(sel[3:2]), .y(y));               // Final output

endmodule
