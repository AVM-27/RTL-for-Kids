//==================================================
// Filename       : sd1011_mealy_tb.v
// Description    : Testbench for Mealy FSM (detect "1011")
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns / 1ps

module sd1011_mealy_tb;

    reg clk, reset, din;
    wire dout;

    sd1011_mealy dut (
        .clk(clk),
        .reset(reset),
        .din(din),
        .dout(dout)
    );

    // Generate clock (10 ns period)
    always #5 clk = ~clk;

    initial begin
        $monitor("Time: %0t | din = %b | dout = %b", $time, din, dout);

        // Initialize signals
        clk = 0;
        reset = 1;
        din = 0;
        #12; reset = 0;

        // Input sequence: 1 0 1 1 → should detect here
        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;

        // Overlapping check: 0 1 1
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;

        // Noise: 0 0 1 0 1 1
        din = 0; #10;
        din = 0; #10;
        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;

        #10 $finish;
    end

endmodule
