//==================================================
// Filename       : uart_rx_tb.v
// Description    : Testbench for UART Receiver FSM
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns / 1ps

module uart_rx_tb;

    reg clk = 0;
    reg reset = 0;
    reg rx = 1;
    wire [7:0] rx_data;
    wire rx_done;

    uart_rx dut (
        .clk(clk),
        .reset(reset),
        .rx(rx),
        .rx_done(rx_done),
        .rx_data(rx_data)
    );

    // Clock generation: 100 MHz
    always #5 clk = ~clk;

    task uart_send_byte(input [7:0] data);
        integer i;
        begin
            rx = 0; // Start bit
            #(104160); // 1 bit period

            for (i = 0; i < 8; i = i + 1) begin
                rx = data[i];
                #(104160); // 1 bit period
            end

            rx = 1; // Stop bit
            #(104160); // 1 bit period
        end
    endtask

    initial begin
        $monitor("Time=%0t | rx_done=%b | rx_data=0x%02X", $time, rx_done, rx_data);
        reset = 1; #20;
        reset = 0;

        #100000; // Idle time
        uart_send_byte(8'hA5); // Send 0b10100101
        #200000;

        uart_send_byte(8'h3C); // Send 0b00111100
        #200000;

        $finish;
    end

endmodule
