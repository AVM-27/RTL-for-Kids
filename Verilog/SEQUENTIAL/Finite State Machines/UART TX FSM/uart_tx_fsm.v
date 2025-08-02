//==================================================
// Filename       : uart_tx_fsm.v
// Description    : UART Transmitter using FSM (start, data, stop bits)
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module uart_tx_fsm (
    input        clk,
    input        reset,
    input        tx_start,       // Signal to start transmission
    input [7:0]  tx_data,        // 8-bit data to transmit
    output reg   tx_serial,      // Serial data output
    output reg   tx_busy         // Indicates transmission in progress
);

    // UART states
    typedef enum logic [2:0] {
        IDLE  = 3'd0,
        START = 3'd1,
        DATA  = 3'd2,
        STOP  = 3'd3
    } state_t;

    state_t state, next_state;
    reg [2:0] bit_index;         // Tracks current bit being transmitted (0–7)
    reg [7:0] tx_buffer;         // Holds data to transmit
    reg [3:0] baud_counter;      // Simple counter to simulate baud rate delay

    parameter BAUD_DIV = 10;     // Simulated baud rate divider (adjust for real timing)

    // FSM state transitions and control
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state       <= IDLE;
            bit_index   <= 0;
            tx_serial   <= 1'b1;  // Idle line is high
            tx_busy     <= 0;
            baud_counter<= 0;
        end else begin
            if (baud_counter < BAUD_DIV)
                baud_counter <= baud_counter + 1;
            else begin
                baud_counter <= 0;
                case (state)
                    IDLE: begin
                        tx_serial <= 1'b1;
                        tx_busy   <= 0;
                        if (tx_start) begin
                            tx_buffer <= tx_data;
                            tx_busy   <= 1;
                            state     <= START;
                        end
                    end

                    START: begin
                        tx_serial <= 1'b0; // Start bit
                        state     <= DATA;
                        bit_index <= 0;
                    end

                    DATA: begin
                        tx_serial <= tx_buffer[bit_index];
                        if (bit_index == 3'd7)
                            state <= STOP;
                        else
                            bit_index <= bit_index + 1;
                    end

                    STOP: begin
                        tx_serial <= 1'b1; // Stop bit
                        state     <= IDLE;
                    end
                endcase
            end
        end
    end
endmodule
