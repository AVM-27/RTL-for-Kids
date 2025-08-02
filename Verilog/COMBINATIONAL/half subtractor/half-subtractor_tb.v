//==================================================
// Filename       : half-subtractor_tb.v
// Description    : Testbench for Half Subtractor
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module half_subtractor_tb;

    reg t_a, t_b;
    wire t_diff, t_borrow;

    // Instantiate the half subtractor
    half_subtractor uut (
        .a(t_a),
        .b(t_b),
        .diff(t_diff),
        .borrow(t_borrow)
    );

    initial begin
        $monitor("a = %b, b = %b => diff = %b, borrow = %b", t_a, t_b, t_diff, t_borrow);

        // Test Case 1: 0 - 0 = 0, borrow = 0
        t_a = 0; t_b = 0; #10;

        // Test Case 2: 0 - 1 = 1, borrow = 1
        t_a = 0; t_b = 1; #10;

        // Test Case 3: 1 - 0 = 1, borrow = 0
        t_a = 1; t_b = 0; #10;

        // Test Case 4: 1 - 1 = 0, borrow = 0
        t_a = 1; t_b = 1; #10;

        $finish;
    end
endmodule
