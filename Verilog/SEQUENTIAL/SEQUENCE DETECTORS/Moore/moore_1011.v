//==================================================
// Filename       : moore_1011.v
// Description    : Moore FSM to detect sequence "1011"
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module moore_1011 (
    input  wire clk,      // Clock input
    input  wire reset,    // Synchronous reset
    input  wire in,       // Serial input bit
    output reg  out       // High when sequence "1011" is detected
);

    // State encoding using binary pattern
    localparam IDLE    = 4'b0000;
    localparam GOT_1   = 4'b0001;
    localparam GOT_10  = 4'b0010;
    localparam GOT_101 = 4'b0101;
    localparam GOT_1011= 4'b1011;

    reg [3:0] current_state, next_state;

    // Sequential state transition
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Combinational next-state logic
    always @(*) begin
        case (current_state)
            IDLE:      next_state = (in) ? GOT_1    : IDLE;
            GOT_1:     next_state = (in) ? GOT_1    : GOT_10;
            GOT_10:    next_state = (in) ? GOT_101  : IDLE;
            GOT_101:   next_state = (in) ? GOT_1011 : GOT_10;
            GOT_1011:  next_state = (in) ? GOT_1    : GOT_10;
            default:   next_state = IDLE;
        endcase
    end

    // Moore output logic: output depends only on current state
    always @(posedge clk or posedge reset) begin
        if (reset)
            out <= 1'b0;
        else
            out <= (current_state == GOT_1011);
    end

endmodule
