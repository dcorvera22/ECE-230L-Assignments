module jk_ff (
    input J,
    input K,
    input clk,
    output Q_out,
    output nQ_out
);

    wire D_in; 

    assign D_in = (J & ~Q_out) | (~K & Q_out);

    d_ff dff_inst (
        .D   (D_in),
        .clk (clk),
        .Q   (Q_out),
        .nQ  (nQ_out)
    );

endmodule