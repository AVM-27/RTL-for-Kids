`timescale 1ns / 1ps
//==================================================
// Filename       : siso_shift_register_tb.v
// Description    : Serial-In Serial-Out (SISO) 4-bit shift register
// GitHub         : https://github.com/AVM-27/
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module siso_shift_register_tb;

    reg clk;
    reg reset;
    reg serial_in;
    wire serial_out;

    // DUT instantiation
    siso_shift_register dut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    // Clock generator: 10 ns period
    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | serial_in=%b | serial_out=%b", $time, serial_in, serial_out);
        
        // Initialisation
        clk = 0;
        reset = 1;
        serial_in = 0;

        // Apply reset
        #10;
        reset = 0;

        // Shift in bits 1 0 1 1 (MSB first)
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;

        // Continue clocking to observe output shift
        serial_in = 0;
        #40;

        // Final reset to test
        reset = 1; #10;
        reset = 0; #10;

        $finish;
    end

endmodule
