module d_latch(
    input D, E,
    output reg Q, 
    output NotQ
);

    always @(D, E) begin
        if (E) begin
            Q <= D;
        end
   
    end

    assign NotQ = ~Q;

endmodule