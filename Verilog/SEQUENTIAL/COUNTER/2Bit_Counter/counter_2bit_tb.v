//==================================================
// Filename       : counter_2bit_tb.v
// Description    : Testbench for 2-bit binary up-counter
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module counter_2bit_tb;
    reg clk;               // Clock signal
    reg reset;             // Reset signal
    wire [1:0] dout;       // Output from counter

    // Instantiate the 2-bit counter
    counter_2bit dut (
        .clk(clk),
        .reset(reset),
        .dout(dout)
    );

    // Generate clock: 10-time-unit period
    always #5 clk = ~clk;

    initial begin
        // Monitor signal values during simulation
        $monitor("Time = %0t | clk = %b | reset = %b | dout = %b", $time, clk, reset, dout);

        // Initial values
        clk = 0;
        reset = 0;

        // === Test Case 1: Reset functionality ===
        #10 reset = 1;
        #10 reset = 0;
        #10;
        if (dout !== 2'b00) $display("01 ERROR: Expected dout = 00 after reset");

        // === Test Case 2: Normal counting ===
        #10; if (dout !== 2'b01) $display("02 ERROR: Expected dout = 01");
        #10; if (dout !== 2'b10) $display("03 ERROR: Expected dout = 10");
        #10; if (dout !== 2'b11) $display("04 ERROR: Expected dout = 11");
        #10; if (dout !== 2'b00) $display("05 ERROR: Expected dout = 00 (wrap around)");

        // === Test Case 3: Reset again ===
        #10 reset = 1;
        #10 reset = 0;
        #10;
        if (dout !== 2'b00) $display("06 ERROR: Expected dout = 00 after second reset");

        // End simulation
        $finish;
    end
endmodule
