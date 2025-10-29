module mux_4_to_1 (
    // Inputs
    input [3:0] A, B, C, D,
    input [1:0] Sel,
    input Enable,
    // Output
    output [3:0] Y
);

    assign Y = Enable ? (
                 Sel == 2'b00 ? A :     
                 Sel == 2'b01 ? B :      
                 Sel == 2'b10 ? C :      
                 D                       
               ) : 4'b0;                 

endmodule