//==================================================
// Filename       : uart_rx.v
// Description    : FSM-based UART Receiver (RX) module
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns / 1ps

module uart_rx (
    input        clk,        // System clock
    input        reset,      // Active-high synchronous reset
    input        rx,         // UART serial input line
    output reg   rx_done,    // High for 1 clk when a byte is received
    output reg [7:0] rx_data // Received 8-bit data
);

    parameter IDLE  = 3'b000,
              START = 3'b001,
              DATA  = 3'b010,
              STOP  = 3'b011,
              DONE  = 3'b100;

    reg [2:0] state = IDLE;
    reg [12:0] clk_count = 0;
    reg [2:0] bit_index = 0;
    reg [7:0] rx_shift = 0;

    parameter CLKS_PER_BIT = 10416;  // Assuming 9600 baud @ 100MHz

    always @(posedge clk) begin
        if (reset) begin
            state      <= IDLE;
            clk_count  <= 0;
            bit_index  <= 0;
            rx_shift   <= 0;
            rx_data    <= 0;
            rx_done    <= 0;
        end else begin
            case (state)
                IDLE: begin
                    rx_done <= 0;
                    clk_count <= 0;
                    bit_index <= 0;
                    if (rx == 0)  // Detect start bit
                        state <= START;
                end

                START: begin
                    if (clk_count == (CLKS_PER_BIT - 1)/2) begin
                        clk_count <= 0;
                        state <= DATA;
                    end else
                        clk_count <= clk_count + 1;
                end

                DATA: begin
                    if (clk_count < CLKS_PER_BIT - 1) begin
                        clk_count <= clk_count + 1;
                    end else begin
                        clk_count <= 0;
                        rx_shift[bit_index] <= rx;
                        if (bit_index < 7)
                            bit_index <= bit_index + 1;
                        else begin
                            bit_index <= 0;
                            state <= STOP;
                        end
                    end
                end

                STOP: begin
                    if (clk_count < CLKS_PER_BIT - 1)
                        clk_count <= clk_count + 1;
                    else begin
                        rx_data <= rx_shift;
                        clk_count <= 0;
                        state <= DONE;
                    end
                end

                DONE: begin
                    rx_done <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule
