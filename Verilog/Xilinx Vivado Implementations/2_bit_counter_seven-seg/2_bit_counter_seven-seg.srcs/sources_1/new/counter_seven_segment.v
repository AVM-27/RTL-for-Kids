module bit_UpDown(
    input clk,        // Clock signal
    input reset,      // Reset signal
    input mode,       // Mode signal (1 for up, 0 for down)
    output reg [1:0] dout  // 2-bit output (counter value)
);

// Counter operation
always @(posedge clk or posedge reset) begin
    if (reset)
        dout <= 2'b00;  // Reset counter to 0
    else if (mode)
        dout <= dout + 1;  // Increment counter when mode is high
    else
        dout <= dout - 1;  // Decrement counter when mode is low
end

endmodule

