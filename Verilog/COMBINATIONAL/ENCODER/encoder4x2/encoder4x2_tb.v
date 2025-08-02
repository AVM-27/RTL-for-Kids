//==================================================
// Filename       : encoder4x2_tb.v
// Description    : Testbench for 4-to-2 Encoder
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module encoder4x2_tb;

    reg  [3:0] t_in;
    wire [1:0] t_out;

    encoder4x2 uut (
        .in(t_in),
        .out(t_out)
    );

    initial begin
        $display("Input\tOutput");
        $monitor("%b\t%b", t_in, t_out);

        t_in = 4'b0001; #10;
        t_in = 4'b0010; #10;
        t_in = 4'b0100; #10;
        t_in = 4'b1000; #10;

        t_in = 4'b0000; #10; // Invalid
        t_in = 4'b1111; #10; // Invalid
        $finish;
    end

endmodule
