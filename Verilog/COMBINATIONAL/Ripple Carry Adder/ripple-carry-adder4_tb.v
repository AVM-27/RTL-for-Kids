//==================================================
// Filename       : ripple-carry-adder4_tb.v
// Description    : Testbench for 4-bit Ripple Carry Adder
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module ripple_carry_adder4_tb;

    reg  [3:0] t_a, t_b;
    reg        t_cin;
    wire [3:0] t_sum;
    wire       t_cout;

    // Instantiate the 4-bit ripple carry adder
    ripple_carry_adder4 uut (
        .a(t_a),
        .b(t_b),
        .cin(t_cin),
        .sum(t_sum),
        .cout(t_cout)
    );

    initial begin
        $monitor("a = %b, b = %b, cin = %b => sum = %b, cout = %b",
                  t_a, t_b, t_cin, t_sum, t_cout);

        // Test Cases
        t_a = 4'b0000; t_b = 4'b0000; t_cin = 0; #10;
        t_a = 4'b0011; t_b = 4'b0001; t_cin = 0; #10;
        t_a = 4'b1010; t_b = 4'b0101; t_cin = 1; #10;
        t_a = 4'b1111; t_b = 4'b1111; t_cin = 0; #10;
        t_a = 4'b1111; t_b = 4'b1111; t_cin = 1; #10;

        $finish;
    end
endmodule
