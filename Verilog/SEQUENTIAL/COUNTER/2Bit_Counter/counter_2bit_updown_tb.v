//==================================================
// Filename       : counter_2bit_updown_tb.v
// Description    : Testbench for 2-bit Up/Down counter
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns / 1ps

module bit_UpDown_tb;
    reg clk;                // Clock signal
    reg reset;              // Reset signal
    reg mode;               // Mode: 1 = up, 0 = down
    wire [1:0] dout;        // Counter output

    // Instantiate the DUT (Device Under Test)
    bit_UpDown dut (
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .dout(dout)
    );

    // Clock generation: 10-time-unit period
    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | mode = %b | dout = %b",
                  $time, clk, reset, mode, dout);

        // === Initialise signals ===
        clk = 0;
        reset = 0;
        mode = 0;

        // === Test Case 1: Apply reset ===
        #10; reset = 1;
        #10; reset = 0;
        #10;
        if (dout !== 2'b00) $display("01 ERROR: Expected dout = 00 after reset");

        // === Test Case 2: Up Counting ===
        mode = 1;
        #10; if (dout !== 2'b01) $display("02 ERROR: Expected dout = 01");
        #10; if (dout !== 2'b10) $display("03 ERROR: Expected dout = 10");
        #10; if (dout !== 2'b11) $display("04 ERROR: Expected dout = 11");
        #10; if (dout !== 2'b00) $display("05 ERROR: Expected dout = 00 (wrap around)");

        // === Test Case 3: Down Counting ===
        mode = 0;
        #10; if (dout !== 2'b11) $display("06 ERROR: Expected dout = 11");
        #10; if (dout !== 2'b10) $display("07 ERROR: Expected dout = 10");
        #10; if (dout !== 2'b01) $display("08 ERROR: Expected dout = 01");
        #10; if (dout !== 2'b00) $display("09 ERROR: Expected dout = 00 (wrap around)");

        // === Test Case 4: Reset again ===
        #10; reset = 1;
        #10; reset = 0;
        #10;
        if (dout !== 2'b00) $display("10 ERROR: Expected dout = 00 after reset");

        // === End simulation ===
        $finish;
    end
endmodule
