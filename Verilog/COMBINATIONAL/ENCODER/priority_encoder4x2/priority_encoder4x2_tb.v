//==================================================
// Filename       : priority_encoder4x2_tb.v
// Description    : Testbench for 4-to-2 Priority Encoder
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module priority_encoder4x2_tb;

    reg  [3:0] t_in;
    wire [1:0] t_out;
    wire       t_valid;

    priority_encoder4x2 uut (
        .in(t_in),
        .out(t_out),
        .valid(t_valid)
    );

    initial begin
        $display("Input\tOutput\tValid");
        $monitor("%b\t%b\t%b", t_in, t_out, t_valid);

        t_in = 4'b0000; #10; // No input high
        t_in = 4'b0001; #10; // Only LSB high
        t_in = 4'b0010; #10;
        t_in = 4'b0100; #10;
        t_in = 4'b1000; #10;

        t_in = 4'b0011; #10; // Multiple inputs; MSB wins
        t_in = 4'b1111; #10; // MSB again wins
        $finish;
    end

endmodule
