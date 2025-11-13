// d_ff.v (MODIFIED)
module d_ff (
    input D,
    input clk,
    input reset,        // <-- ADDED RESET INPUT
    output reg Q,
    output wire nQ
);

    // Initial block is no longer strictly necessary, but can remain.
    initial begin
        Q <= 1'b0;
    end

    // Sensitivity list must now include the reset signal
    always @(posedge clk, posedge reset) begin 
        if (reset) begin       // <-- Asynchronous Reset: executes immediately if reset is high
            Q <= 1'b0;
        end else begin
            Q <= D;            // Synchronous operation only if reset is low
        end
    end

    assign nQ = ~Q;

endmodule
