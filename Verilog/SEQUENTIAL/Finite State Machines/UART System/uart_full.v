//==================================================
// Filename       : uart_full.v
// Description    : Top-level UART module integrating TX and RX FSMs
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns / 1ps

module uart_full #(
    parameter CLK_FREQ = 50000000,   // 50 MHz
    parameter BAUD_RATE = 9600
)(
    input clk,
    input rst,
    input tx_start,
    input [7:0] tx_data,
    output tx,
    output tx_busy,
    input rx,
    output [7:0] rx_data,
    output rx_done
);

    // Calculate baud rate tick frequency
    localparam integer TICKS_PER_BIT = CLK_FREQ / BAUD_RATE;

    wire tick;
    reg [15:0] tick_cnt;

    // Baud rate tick generator
    always @(posedge clk or posedge rst) begin
        if (rst)
            tick_cnt <= 0;
        else if (tick_cnt == TICKS_PER_BIT - 1)
            tick_cnt <= 0;
        else
            tick_cnt <= tick_cnt + 1;
    end

    assign tick = (tick_cnt == TICKS_PER_BIT - 1);

    // Instantiate UART Transmitter
    uart_tx_fsm #(
        .CLK_FREQ(CLK_FREQ),
        .BAUD_RATE(BAUD_RATE)
    ) uart_tx_inst (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .tx_busy(tx_busy),
        .tick(tick)
    );

    // Instantiate UART Receiver
    uart_rx_fsm #(
        .CLK_FREQ(CLK_FREQ),
        .BAUD_RATE(BAUD_RATE)
    ) uart_rx_inst (
        .clk(clk),
        .rst(rst),
        .rx(rx),
        .rx_data(rx_data),
        .rx_done(rx_done),
        .tick(tick)
    );

endmodule
