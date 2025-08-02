//==================================================
// Filename       : decoder4x16_struct_tb.v
// Description    : Testbench for 4-to-16 Decoder (Structural)
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module decoder4x16_struct_tb;

    reg  [3:0] t_in;
    wire [15:0] t_out;

    decoder4x16_struct uut (
        .in(t_in),
        .out(t_out)
    );

    integer i;

    initial begin
        $monitor("in = %b, out = %b", t_in, t_out);
        for (i = 0; i < 16; i = i + 1) begin
            t_in = i[3:0];
            #10;
        end
        $finish;
    end

endmodule
