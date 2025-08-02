//==================================================
// Filename       : sd1011_mealy.v
// Description    : Mealy FSM to detect sequence "1011"
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

`timescale 1ns / 1ps

module sd1011_mealy (
    input clk,
    input reset,
    input din,
    output reg dout
);

    // Define states
    typedef enum reg [1:0] {
        S0 = 2'b00,
        S1 = 2'b01,
        S2 = 2'b10,
        S3 = 2'b11
    } state_t;

    state_t state, next_state;

    // Sequential logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            dout <= 1'b0;
        end else begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            S0: next_state = din ? S1 : S0;
            S1: next_state = din ? S1 : S2;
            S2: next_state = din ? S3 : S0;
            S3: next_state = din ? S1 : S2;
            default: next_state = S0;
        endcase
    end

    // Output logic (Mealy output depends on current state and input)
    always @(*) begin
        dout = (state == S3 && din);
    end

endmodule
