//==================================================
// Filename       : uart_full_tb.v
// Description    : Testbench for full UART (TX + RX) module with loopback
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns / 1ps

module uart_full_tb;

    reg clk;
    reg rst;
    reg tx_start;
    reg [7:0] tx_data;
    wire tx;
    wire tx_busy;
    wire [7:0] rx_data;
    wire rx_done;

    // Connect TX to RX for loopback
    wire rx;
    assign rx = tx;

    // Instantiate the DUT
    uart_full #(
        .CLK_FREQ(10000000),   // 10 MHz for simulation
        .BAUD_RATE(9600)
    ) uut (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .tx_busy(tx_busy),
        .rx(rx),
        .rx_data(rx_data),
        .rx_done(rx_done)
    );

    // Clock Generation (10 MHz)
    always #50 clk = ~clk;

    initial begin
        $dumpfile("uart_full.vcd");
        $dumpvars(0, uart_full_tb);

        clk = 0;
        rst = 1;
        tx_start = 0;
        tx_data = 8'h00;

        // Reset
        #200;
        rst = 0;
        #200;

        // Send byte 1
        tx_data = 8'hA5;
        tx_start = 1;
        #100;
        tx_start = 0;

        wait (rx_done);
        #100;
        $display("RX Data = %h", rx_data);

        // Send byte 2
        tx_data = 8'h3C;
        tx_start = 1;
        #100;
        tx_start = 0;

        wait (rx_done);
        #100;
        $display("RX Data = %h", rx_data);

        // Finish
        #1000;
        $finish;
    end

endmodule
