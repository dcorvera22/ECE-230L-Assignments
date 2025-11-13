module ripple_counter (
    input clk,
    output led_0, 
    output led_1, 
    output led_2 
);

    wire Q1; 
    wire Q2; 

    t_ff tff_1 (
        .T   (1'b1), 
        .clk (clk), 
        .Q   (Q1), 
        .nQ  ()
    );
    assign led_0 = Q1;

    t_ff tff_2 (
        .T   (1'b1), 
        .clk (Q1), 
        .Q   (Q2), 
        .nQ  ()
    );
    assign led_1 = Q2;

    t_ff tff_3 (
        .T   (1'b1), 
        .clk (Q2), 
        .Q   (led_2), 
        .nQ  ()
    );

endmodule