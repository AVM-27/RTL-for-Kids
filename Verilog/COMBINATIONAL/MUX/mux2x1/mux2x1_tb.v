//==================================================
// Filename       : mux2x1_tb.v
// Description    : Testbench for 2:1 Multiplexer
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns/1ps

module mux2x1_tb;

    reg a, b, sel;     // Inputs to DUT
    wire y;            // Output from DUT

    // Instantiate the Design Under Test
    mux2x1 dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        $display("\n=== 2:1 Multiplexer Test ===");
        $display(" a b sel | y ");
        $display("---------|---");

        // Test 1
        a = 0; b = 0; sel = 0;
        #10 $display(" %b %b  %b  | %b", a, b, sel, y);

        // Test 2
        a = 0; b = 1; sel = 0;
        #10 $display(" %b %b  %b  | %b", a, b, sel, y);

        // Test 3
        a = 0; b = 1; sel = 1;
        #10 $display(" %b %b  %b  | %b", a, b, sel, y);

        // Test 4
        a = 1; b = 0; sel = 1;
        #10 $display(" %b %b  %b  | %b", a, b, sel, y);

        // Test 5
        a = 1; b = 1; sel = 0;
        #10 $display(" %b %b  %b  | %b", a, b, sel, y);

        $display("Test complete.\n");
        $finish;
    end

endmodule
