//==================================================
// Filename       : priority_encoder8x3_tb.v
// Description    : Testbench for 8-to-3 Priority Encoder
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module encoder8x3_priority_tb;

    reg  [7:0] t_in;
    wire [2:0] t_out;
    wire       t_valid;

    encoder8x3_priority uut (
        .in(t_in),
        .out(t_out),
        .valid(t_valid)
    );

    initial begin
        $display("Input       Output Valid");
        $monitor("%b %b     %b", t_in, t_out, t_valid);

        t_in = 8'b00000000; #10; // Invalid
        t_in = 8'b00000001; #10;
        t_in = 8'b00000011; #10; // Priority: in[1]
        t_in = 8'b00000101; #10; // Priority: in[2]
        t_in = 8'b00011000; #10; // Priority: in[4]
        t_in = 8'b10011011; #10; // Priority: in[7]
        $finish;
    end

endmodule
