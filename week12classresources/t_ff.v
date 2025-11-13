module t_ff (
    input T,
    input clk,
    output reg Q,
    output wire nQ
);

    // Set initial state to 0
    initial begin
        Q <= 1'b0;
    end

    // Edge-sensitive logic
    always @(posedge clk, posedge reset) begin 
        if (reset) begin
            Q <= 1'b0;      // Asynchronous Reset
        end else if (T) begin
            Q <= ~Q;
    end
end

    // Output for the inverted state (~Q)
    assign nQ = ~Q;


endmodule
