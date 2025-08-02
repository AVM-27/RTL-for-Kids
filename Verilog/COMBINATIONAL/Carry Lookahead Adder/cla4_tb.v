//==================================================
// Filename       : cla4_tb.v
// Description    : Testbench for 4-bit CLA Adder
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module cla4_tb;

    reg  [3:0] t_a, t_b;
    reg        t_cin;
    wire [3:0] t_sum;
    wire       t_cout;

    cla4 uut (
        .a(t_a),
        .b(t_b),
        .cin(t_cin),
        .sum(t_sum),
        .cout(t_cout)
    );

    initial begin
        $monitor("a = %b, b = %b, cin = %b => sum = %b, cout = %b",
                  t_a, t_b, t_cin, t_sum, t_cout);

        // Basic tests
        t_a = 4'b0001; t_b = 4'b0010; t_cin = 0; #10; // 1 + 2 = 3
        t_a = 4'b1001; t_b = 4'b0110; t_cin = 0; #10; // 9 + 6 = 15
        t_a = 4'b1111; t_b = 4'b0001; t_cin = 0; #10; // 15 + 1 = 16 (cout = 1)

        $finish;
    end

endmodule
