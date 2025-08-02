//==================================================
// Filename       : mux16x1_struct_tb.v
// Description    : Testbench for 16:1 MUX using 4:1 MUX modules
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns/1ps

module mux16x1_struct_tb;

    reg  [15:0] in;     // Input vector to 16:1 MUX
    reg  [3:0]  sel;    // Selector input (4 bits to choose 1 out of 16)
    wire y;             // Output from MUX

    // Instantiate the design under test (DUT)
    mux16x1_struct dut (
        .in(in),
        .sel(sel),
        .y(y)
    );

    integer i;  // Loop variable

    initial begin
        $display("\n=== 16:1 MUX via 4:1 Modules Test ===");
        $display("   sel    | y ");
        $display("----------|---");

        // Set up a predictable input pattern
        // Let even positions = 1, odd positions = 0
        for (i = 0; i < 16; i = i + 1)
            in[i] = (i % 2 == 0) ? 1'b1 : 1'b0;

        // Test all select values from 0 to 15
        for (i = 0; i < 16; i = i + 1) begin
            sel = i[3:0];       // Assign selector
            #5;                 // Wait for signal to settle
            $display("  %b | %b (Expect %b)", sel, y, in[sel]);
        end

        $display("Test complete.\n");
        $finish;  // End simulation
    end

endmodule
