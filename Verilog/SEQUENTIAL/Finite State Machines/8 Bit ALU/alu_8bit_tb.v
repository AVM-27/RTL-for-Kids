//==================================================
// Filename : alu_8bit_tb.v
// Description : Testbench for 8-bit ALU
// GitHub : https://github.com/AVM-27
// Author : Adarsh Venugopal
// Created On : 2025-08-02
//==================================================
module alu_8bit_tb;

reg  [7:0] A, B;
reg  [3:0] sel;
wire [7:0] Y;
wire carry_out, zero, overflow;

alu_8bit uut (
    .A(A), .B(B), .sel(sel),
    .Y(Y), .carry_out(carry_out), .zero(zero), .overflow(overflow)
);

initial begin
    $display("Time\tA\tB\tSel\tY\tCarry\tZero\tOverflow");
    $monitor("%0t\t%h\t%h\t%b\t%h\t%b\t%b\t%b", 
             $time, A, B, sel, Y, carry_out, zero, overflow);

    A = 8'h12; B = 8'h34; sel = 4'b0000; #10; // A + B
    A = 8'h80; B = 8'h80; sel = 4'b0000; #10; // Overflow expected
    A = 8'h55; B = 8'h11; sel = 4'b0001; #10; // A - B
    A = 8'hF0; B = 8'h0F; sel = 4'b0010; #10; // AND
    A = 8'hF0; B = 8'h0F; sel = 4'b0011; #10; // OR
    A = 8'hAA; B = 8'hFF; sel = 4'b0100; #10; // XOR
    A = 8'h0F; B = 8'h00; sel = 4'b0101; #10; // NOT
    A = 8'h03; B = 8'h00; sel = 4'b0110; #10; // SHL
    A = 8'h80; B = 8'h00; sel = 4'b0111; #10; // SHR

    $finish;
end

endmodule
