`timescale 1ns / 1ps
//==================================================
// Filename       : traffic_controller_4way_tb.v
// Description    : Testbench for 4-way traffic controller FSM
// GitHub         : https://github.com/AVM-27
// Author         : Adarsh Venugopal
// Created On     : 2025-08-02
//==================================================

module traffic_controller_4way_tb;

    reg clk;
    reg reset;
    wire [1:0] NS_light, EW_light, SN_light, WE_light;

    traffic_controller_4way dut (
        .clk(clk),
        .reset(reset),
        .NS_light(NS_light),
        .EW_light(EW_light),
        .SN_light(SN_light),
        .WE_light(WE_light)
    );

    // Generate clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        #20 reset = 0;

        // Run simulation for a complete cycle (96 ticks)
        #1000 $finish;
    end

    initial begin
        $monitor("Time=%0t | NS=%b EW=%b SN=%b WE=%b", $time, NS_light, EW_light, SN_light, WE_light);
    end

endmodule
