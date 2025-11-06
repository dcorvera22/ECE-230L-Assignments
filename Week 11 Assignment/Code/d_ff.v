module d_ff (
    input D,
    input clk,
    output reg Q,
    output wire nQ 
);

    initial begin
        Q <= 1'b0;
    end

    always @(posedge clk) begin
        Q <= D; 
    end

    // Output for the inverted state (~Q)
    assign nQ = ~Q;

endmodule