//==================================================
// Filename       : comparator_4bit.v
// Description    : 4-bit Comparator (A vs B)
// GitHub         : https://github.com/AVM-27/RTL-for-Kids
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module comparator_4bit (
    input  [3:0] A,
    input  [3:0] B,
    output       A_gt_B,
    output       A_eq_B,
    output       A_lt_B
);

assign A_gt_B = (A > B);
assign A_eq_B = (A == B);
assign A_lt_B = (A < B);

endmodule
