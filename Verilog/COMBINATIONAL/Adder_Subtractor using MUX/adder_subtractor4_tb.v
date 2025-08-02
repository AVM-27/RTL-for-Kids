//==================================================
// Filename       : adder_subtractor4_tb.v
// Description    : Testbench for 4-bit Adder/Subtractor
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module adder_subtractor4_tb;

    reg  [3:0] t_a, t_b;
    reg        t_mode;
    wire [3:0] t_result;
    wire       t_cout;

    // Instantiate the module
    adder_subtractor4 uut (
        .a(t_a),
        .b(t_b),
        .mode(t_mode),
        .result(t_result),
        .cout(t_cout)
    );

    initial begin
        $monitor("a = %b, b = %b, mode = %b => result = %b, cout = %b",
                  t_a, t_b, t_mode, t_result, t_cout);

        // ADDITION tests (mode = 0)
        t_mode = 0; t_a = 4'b0010; t_b = 4'b0011; #10; // 2 + 3 = 5
        t_mode = 0; t_a = 4'b1001; t_b = 4'b0110; #10; // 9 + 6 = 15

        // SUBTRACTION tests (mode = 1)
        t_mode = 1; t_a = 4'b0110; t_b = 4'b0011; #10; // 6 - 3 = 3
        t_mode = 1; t_a = 4'b1000; t_b = 4'b1001; #10; // 8 - 9 = -1 (overflow)

        $finish;
    end
endmodule
