//==================================================
// Filename : alu_8bit.v
// Description : 8-bit ALU supporting arithmetic and logical ops
// GitHub : https://github.com/AVM-27
// Author : Adarsh Venugopal
// Created On : 2025-08-02
//==================================================
module alu_8bit (
    input  [7:0] A,          // First operand
    input  [7:0] B,          // Second operand
    input  [3:0] sel,        // Operation select
    output reg [7:0] Y,      // Result
    output reg carry_out,    // Carry for arithmetic ops
    output reg zero,         // Zero flag
    output reg overflow      // Overflow flag
);

// Opcode mapping
// 0000 - A + B
// 0001 - A - B
// 0010 - A & B
// 0011 - A | B
// 0100 - A ^ B
// 0101 - ~A
// 0110 - A << 1
// 0111 - A >> 1

always @(*) begin
    carry_out = 0;
    overflow  = 0;
    case (sel)
        4'b0000: {carry_out, Y} = A + B;                      // Addition
        4'b0001: {carry_out, Y} = A - B;                      // Subtraction
        4'b0010: Y = A & B;                                   // AND
        4'b0011: Y = A | B;                                   // OR
        4'b0100: Y = A ^ B;                                   // XOR
        4'b0101: Y = ~A;                                      // NOT
        4'b0110: Y = A << 1;                                  // Shift left
        4'b0111: Y = A >> 1;                                  // Shift right
        default: Y = 8'h00;
    endcase

    zero = (Y == 8'h00) ? 1 : 0;

    // Overflow for addition/subtraction (2's complement logic)
    if (sel == 4'b0000)
        overflow = (~A[7] & ~B[7] & Y[7]) | (A[7] & B[7] & ~Y[7]);
    else if (sel == 4'b0001)
        overflow = (~A[7] & B[7] & Y[7]) | (A[7] & ~B[7] & ~Y[7]);
end

endmodule
