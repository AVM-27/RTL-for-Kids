//==================================================
// Filename       : mux8x1_tb.v
// Description    : Testbench for 8:1 Multiplexer
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns/1ps

module mux8x1_tb;

    reg [7:0] in;        // 8-bit input
    reg [2:0] sel;       // 3-bit select
    wire y;              // Output

    // Instantiate the DUT
    mux8x1 dut (
        .in(in),
        .sel(sel),
        .y(y)
    );

    initial begin
        $display("\n=== 8:1 Multiplexer Test ===");
        $display(" in[7:0]   sel | y ");
        $display("----------------|---");

        in = 8'b10101010;  // Set inputs alternating pattern

        sel = 3'b000; #10 $display(" %b %b | %b", in, sel, y); // Expect in[0] = 0
        sel = 3'b001; #10 $display(" %b %b | %b", in, sel, y); // Expect in[1] = 1
        sel = 3'b010; #10 $display(" %b %b | %b", in, sel, y); // Expect in[2] = 0
        sel = 3'b011; #10 $display(" %b %b | %b", in, sel, y); // Expect in[3] = 1
        sel = 3'b100; #10 $display(" %b %b | %b", in, sel, y); // Expect in[4] = 0
        sel = 3'b101; #10 $display(" %b %b | %b", in, sel, y); // Expect in[5] = 1
        sel = 3'b110; #10 $display(" %b %b | %b", in, sel, y); // Expect in[6] = 0
        sel = 3'b111; #10 $display(" %b %b | %b", in, sel, y); // Expect in[7] = 1

        $display("Test complete.\n");
        $finish;
    end

endmodule
