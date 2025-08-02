`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.08.2024 17:49:00
// Design Name: 
// Module Name: moore_1011_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module moore_1011_tb;

    // Inputs
    reg clk;
    reg reset;
    reg in;

    // Output
    wire out;

    // Instantiate the Unit Under Test (UUT)
    moore_1011 uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test vectors and expected outputs
    reg [7:0] test_vector;   // Bit sequence to apply
    reg [7:0] expected_output;  // Expected output sequence
    integer i;

    initial begin
        // Initialize inputs
        reset = 1;
        in = 0;
        test_vector = 8'b01010111; // Example sequence: 01010111 (contains "1011")
        expected_output = 8'b00000010; // Expected output, should reflect "1011" detection
        
        // Wait for the global reset
        #20 reset = 0;

        // Apply test vector
        for (i = 0; i < 8; i = i + 1) begin
            in = test_vector[i];
            #10; // Wait for one clock cycle

            // Self-checking: compare output with expected value
            if (out !== expected_output[i]) begin
                $display("Test failed at time %t: expected %b but got %b", $time, expected_output[i], out);
                $finish;
            end
        end

        $display("All tests passed.");
        $finish;
    end

endmodule

