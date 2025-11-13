module top (

    input btnU, 
    input btnC, 
    
    
    output [6:0] led 
);
    
   
    ripple_counter ripple_inst (
        .clk (btnC),
        .reset (btnU),
        .led_0 (led[0]), 
        .led_1 (led[1]), 
        .led_2 (led[2]) 
    );
    
   
    modulo_counter modulo_inst (
        .clk   (btnC),
        .reset (btnU),
        .led_3 (led[3]),
        .led_4 (led[4]),
        .led_5 (led[5]), 
        .led_6 (led[6])  
    );


endmodule
