//==================================================
// Filename       : mux4x1_tb.v
// Description    : Testbench for 4:1 Multiplexer
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns/1ps

module mux4x1_tb;

    reg [3:0] in;        // 4-bit input
    reg [1:0] sel;       // 2-bit select
    wire y;              // Output

    // Instantiate the DUT
    mux4x1 dut (
        .in(in),
        .sel(sel),
        .y(y)
    );

    initial begin
        $display("\n=== 4:1 Multiplexer Test ===");
        $display(" in[3:0] sel | y ");
        $display("-------------|---");

        in = 4'b1010;

        sel = 2'b00; #10 $display("  %b   %b  | %b", in, sel, y); // Expect in[0] = 0
        sel = 2'b01; #10 $display("  %b   %b  | %b", in, sel, y); // Expect in[1] = 1
        sel = 2'b10; #10 $display("  %b   %b  | %b", in, sel, y); // Expect in[2] = 0
        sel = 2'b11; #10 $display("  %b   %b  | %b", in, sel, y); // Expect in[3] = 1

        $display("Test complete.\n");
        $finish;
    end

endmodule
