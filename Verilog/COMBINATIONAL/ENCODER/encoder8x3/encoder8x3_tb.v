//==================================================
// Filename       : encoder8x3_tb.v
// Description    : Testbench for 8-to-3 Encoder
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module encoder8x3_tb;

    reg  [7:0] t_in;
    wire [2:0] t_out;
    wire       t_valid;

    encoder8x3 uut (
        .in(t_in),
        .out(t_out),
        .valid(t_valid)
    );

    initial begin
        $display("Input       Output Valid");
        $monitor("%b %b     %b", t_in, t_out, t_valid);

        t_in = 8'b00000000; #10; // Invalid
        t_in = 8'b00000001; #10;
        t_in = 8'b00000010; #10;
        t_in = 8'b00000100; #10;
        t_in = 8'b00001000; #10;
        t_in = 8'b00010000; #10;
        t_in = 8'b00100000; #10;
        t_in = 8'b01000000; #10;
        t_in = 8'b10000000; #10;
        $finish;
    end

endmodule
