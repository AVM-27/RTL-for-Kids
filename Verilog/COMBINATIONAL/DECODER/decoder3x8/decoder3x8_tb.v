//==================================================
// Filename       : decoder3x8_tb.v
// Description    : Testbench for 3-to-8 Decoder (Behavioural)
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module decoder3x8_beh_tb;

    reg  [2:0] t_in;      // 3-bit test input
    wire [7:0] t_out;     // Decoder output

    // Instantiate decoder
    decoder3x8_beh uut (
        .in(t_in),
        .out(t_out)
    );

    initial begin
        $monitor("in = %b, out = %b", t_in, t_out);

        // Apply all possible inputs
        t_in = 3'b000; #10;
        t_in = 3'b001; #10;
        t_in = 3'b010; #10;
        t_in = 3'b011; #10;
        t_in = 3'b100; #10;
        t_in = 3'b101; #10;
        t_in = 3'b110; #10;
        t_in = 3'b111; #10;

        $finish;
    end

endmodule
