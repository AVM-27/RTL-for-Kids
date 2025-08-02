//==================================================
// Filename       : t_flip_flop.v
// Description    : T Flip-Flop with Synchronous Reset
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module t_flip_flop (
    input clk,
    input reset,
    input t,
    output reg q
);

    initial q = 0;

    always @(posedge clk) begin
        if (reset)
            q <= 0;
        else if (t)
            q <= ~q;
        else
            q <= q;
    end

endmodule
