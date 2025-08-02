`timescale 1ns / 1ps
//==================================================
// Filename       : moore_1011_tb.v
// Description    : Testbench for Moore FSM (detects "1011")
// GitHub         : https://github.com/AVM-27/RTL-for-Kids
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module moore_1011_tb;

    reg clk;
    reg reset;
    reg in;
    wire out;

    // Instantiate the FSM
    moore_1011 uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    // Clock generation (10 ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    reg [7:0] input_sequence     = 8'b01010111; // Serial input stream
    reg [7:0] expected_output    = 8'b00000010; // Output should go high on detecting "1011"
    integer i;

    initial begin
        $display("Starting Moore FSM Testbench...");
        reset = 1;
        in = 0;
        #15 reset = 0;

        for (i = 0; i < 8; i = i + 1) begin
            in = input_sequence[i];
            #10; // Wait for one clock cycle
            if (out !== expected_output[i]) begin
                $display("❌ Mismatch at time %0t | in=%b | expected out=%b | got out=%b", $time, in, expected_output[i], out);
                $finish;
            end else begin
                $display("✅ Time=%0t | in=%b | out=%b (correct)", $time, in, out);
            end
        end

        $display("🎉 All tests passed successfully.");
        $finish;
    end

endmodule
