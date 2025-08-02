//==================================================
// Filename       : decoder2x4_beh_tb.v
// Description    : Testbench for 2-to-4 Decoder (Behavioural)
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module decoder2x4_beh_tb;

    reg  [1:0] t_in;     // Test input
    wire [3:0] t_out;    // Decoder output

    // Instantiate the behavioural decoder
    decoder2x4_beh uut (
        .in(t_in),
        .out(t_out)
    );

    initial begin
        $monitor("in = %b, out = %b", t_in, t_out);

        // Apply all input combinations
        t_in = 2'b00; #10;
        t_in = 2'b01; #10;
        t_in = 2'b10; #10;
        t_in = 2'b11; #10;

        $finish;
    end

endmodule
