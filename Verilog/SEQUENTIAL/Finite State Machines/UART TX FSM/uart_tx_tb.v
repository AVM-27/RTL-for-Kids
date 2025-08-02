`timescale 1ns / 1ps
//==================================================
// Filename       : uart_tx_tb.v
// Description    : Testbench for UART Transmitter FSM
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module uart_tx_tb;

    // Inputs
    reg clk;
    reg reset;
    reg tx_start;
    reg [7:0] tx_data;

    // Outputs
    wire tx;
    wire tx_busy;

    // Instantiate the UART Transmitter
    uart_tx dut (
        .clk(clk),
        .reset(reset),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .tx_busy(tx_busy)
    );

    // Clock generation: 10 ns period (100 MHz)
    always #5 clk = ~clk;

    initial begin
        // Initial values
        clk = 0;
        reset = 1;
        tx_start = 0;
        tx_data = 8'b0;

        // Reset pulse
        #20;
        reset = 0;

        // Wait a little before transmission
        #40;

        // Transmit 0xA5 (10100101)
        tx_data = 8'hA5;
        tx_start = 1;
        #10;
        tx_start = 0;

        // Wait for transmission to complete
        wait(tx_busy == 0);
        #100;

        // Transmit 0x3C (00111100)
        tx_data = 8'h3C;
        tx_start = 1;
        #10;
        tx_start = 0;

        wait(tx_busy == 0);
        #100;

        // End simulation
        $finish;
    end

    // Monitor UART output
    initial begin
        $monitor("Time = %0t | tx = %b | tx_busy = %b", $time, tx, tx_busy);
    end

endmodule
