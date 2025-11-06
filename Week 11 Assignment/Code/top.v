module top (
    
    input [3:0] sw,   
    input btnC,       
    output [5:0] led  
);
    
    d_ff dff_inst (
        .D   (sw[0]),
        .clk (btnC),
        .Q   (led[0]),
        .nQ  (led[1])
    );

    jk_ff jkff_inst (
        .J   (sw[1]),
        .K   (sw[2]),
        .clk (btnC),
        .Q_out (led[2]),
        .nQ_out (led[3])
    );

    t_ff tff_inst (
        .T   (sw[3]),
        .clk (btnC),
        .Q   (led[4]),
        .nQ  (led[5])
    );

endmodule