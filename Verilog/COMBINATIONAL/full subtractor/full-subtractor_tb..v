//==================================================
// Filename       : full-subtractor_tb.v
// Description    : Testbench for Full Subtractor
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module full_subtractor_tb;

    reg t_a, t_b, t_bin;
    wire t_diff, t_bout;

    // Instantiate the full subtractor
    full_subtractor uut (
        .a(t_a),
        .b(t_b),
        .bin(t_bin),
        .diff(t_diff),
        .bout(t_bout)
    );

    initial begin
        $monitor("a = %b, b = %b, bin = %b => diff = %b, bout = %b", 
                  t_a, t_b, t_bin, t_diff, t_bout);

        // Test Cases
        t_a = 0; t_b = 0; t_bin = 0; #10;
        t_a = 0; t_b = 0; t_bin = 1; #10;
        t_a = 0; t_b = 1; t_bin = 0; #10;
        t_a = 0; t_b = 1; t_bin = 1; #10;
        t_a = 1; t_b = 0; t_bin = 0; #10;
        t_a = 1; t_b = 0; t_bin = 1; #10;
        t_a = 1; t_b = 1; t_bin = 0; #10;
        t_a = 1; t_b = 1; t_bin = 1; #10;

        $finish;
    end
endmodule
