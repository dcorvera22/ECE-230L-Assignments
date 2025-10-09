module ones_compliment( 
    input [3:0] A, 
    output [3:0] Y
  ); 
  
    assign Y = ~A;
  
  endmodule