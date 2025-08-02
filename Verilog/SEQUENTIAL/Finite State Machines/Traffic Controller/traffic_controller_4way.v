`timescale 1ns / 1ps
//==================================================
// Filename       : traffic_controller_4way.v
// Description    : Moore FSM - 4-way traffic light controller
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module traffic_controller_4way (
    input clk,
    input reset,
    output reg [1:0] NS_light,  // 00=Red, 01=Green, 10=Yellow
    output reg [1:0] EW_light,  // 00=Red, 01=Green, 10=Yellow
    output reg [1:0] SN_light,
    output reg [1:0] WE_light
);

    // State encoding
    typedef enum logic [2:0] {
        NORTH_GREEN = 3'd0,
        NORTH_YELLOW = 3'd1,
        EAST_GREEN = 3'd2,
        EAST_YELLOW = 3'd3,
        SOUTH_GREEN = 3'd4,
        SOUTH_YELLOW = 3'd5,
        WEST_GREEN = 3'd6,
        WEST_YELLOW = 3'd7
    } state_t;

    state_t state, next_state;
    integer timer;

    // Output logic (Moore - based on state)
    always @(*) begin
        NS_light = 2'b00; EW_light = 2'b00; SN_light = 2'b00; WE_light = 2'b00;
        case (state)
            NORTH_GREEN:   NS_light = 2'b01;
            NORTH_YELLOW:  NS_light = 2'b10;
            EAST_GREEN:    EW_light = 2'b01;
            EAST_YELLOW:   EW_light = 2'b10;
            SOUTH_GREEN:   SN_light = 2'b01;
            SOUTH_YELLOW:  SN_light = 2'b10;
            WEST_GREEN:    WE_light = 2'b01;
            WEST_YELLOW:   WE_light = 2'b10;
        endcase
    end

    // State transition on timer
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= NORTH_GREEN;
            timer <= 0;
        end else begin
            timer <= timer + 1;
            case (state)
                NORTH_GREEN:   if (timer == 10)  begin state <= NORTH_YELLOW;  timer <= 0; end
                NORTH_YELLOW:  if (timer == 2)   begin state <= EAST_GREEN;    timer <= 0; end
                EAST_GREEN:    if (timer == 10)  begin state <= EAST_YELLOW;   timer <= 0; end
                EAST_YELLOW:   if (timer == 2)   begin state <= SOUTH_GREEN;   timer <= 0; end
                SOUTH_GREEN:   if (timer == 10)  begin state <= SOUTH_YELLOW;  timer <= 0; end
                SOUTH_YELLOW:  if (timer == 2)   begin state <= WEST_GREEN;    timer <= 0; end
                WEST_GREEN:    if (timer == 10)  begin state <= WEST_YELLOW;   timer <= 0; end
                WEST_YELLOW:   if (timer == 2)   begin state <= NORTH_GREEN;   timer <= 0; end
            endcase
        end
    end

endmodule
