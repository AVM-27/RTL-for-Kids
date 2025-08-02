module clk_divider (
    input clk_in,       // 100 MHz clock input
    output reg clk_out  // Output clock divided to 2-second pulse
);

    // Parameters for clock division
    parameter DIVIDE_BY = 100000000; // Division factor for 2-second interval

    reg [100:0] counter; // Adjust the counter size for the larger division factor

    // Clock division process
    always @(posedge clk_in) begin
        if (counter == (DIVIDE_BY - 1)) begin
            counter <= 0;
            clk_out <= ~clk_out; // Toggle output clock
        end else begin
            counter <= counter + 1;
        end
    end

    // Initialize clk_out
    initial begin
        clk_out = 0;
        counter = 0;
    end

endmodule
