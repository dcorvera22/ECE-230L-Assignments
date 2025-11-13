module modulo_counter (
    input clk,
    input reset, 
    output led_3,
    output led_4, 
    output led_5, 
    output led_6  
);

    wire Q0, Q1, Q2;
    wire D0, D1, D2;
    wire C0, C1;
    wire Q_out, nQ_out; 
    wire D_out;
    
    
    wire Cmp_Reset = Q2 & Q1 & (~Q0);

    full_adder fa_0 (
        .A   (Q0),
        .B   (1'b0),
        .Cin (1'b1), 
        .Sum (D0),   
        .Cout(C0)
    );

    full_adder fa_1 (
        .A   (Q1),
        .B   (1'b0),
        .Cin (C0),
        .Sum (D1),   
        .Cout(C1)
    );

    full_adder fa_2 (
        .A   (Q2),
        .B   (1'b0),
        .Cin (C1),
        .Sum (D2),   
        .Cout()      
    );
    
    assign D_out = Cmp_Reset ? nQ_out : Q_out;

   d_ff dff_0 (
        .D   (D0), 
        .clk (clk),
        .reset (reset),     // <-- PASS RESET
        .Q   (Q0),
        .nQ  ()
    );
    assign led_3 = Q0;

    d_ff dff_1 (
        .D   (D1), 
        .clk (clk),
        .reset (reset),     // <-- PASS RESET
        .Q   (Q1),
        .nQ  ()
    );
    assign led_4 = Q1;

    d_ff dff_2 (
        .D   (D2), 
        .clk (clk),
        .reset (reset),     // <-- PASS RESET
        .Q   (Q2),
        .nQ  ()
    );
    assign led_5 = Q2;

    d_ff dff_out (
        .D   (D_out), 
        .clk (clk),
        .reset (reset),     // <-- PASS RESET
        .Q   (Q_out),
        .nQ  (nQ_out)
    );
    assign led_6 = Q_out; 


endmodule
