module clock_divider (
    input clk_in,    // 100 MHz input clock (from btnC)
    input reset,     // Reset signal (from btnU)
    output reg clk_out // Output clock, divided to ~1 Hz
);

parameter MAX_COUNT = 27'd49_999_999;

reg [26:0] counter = 27'd0;

always @(posedge clk_in) begin
    if (reset) begin
        counter <= 27'd0;
        clk_out <= 1'b0;
    end else begin
        if (counter == MAX_COUNT) begin
            counter <= 27'd0;       
            clk_out <= ~clk_out;    
        end else begin
            counter <= counter + 27'd1; 
        end
    end
end

endmodule