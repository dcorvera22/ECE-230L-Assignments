module top(
    input [9:0] sw,
    output [13:0] led
);

half_sub sub_inst(
    .A(sw[0]),
    .B(sw[1]),
    .Y(led[0]),
    .Borrow(led[1])
);

ones_compliment ones_inst(
    .A(sw[5:2]), 
    .B(sw[9:6]),  
    .Sum(led[5:2])  
);


twos_compliment twos_inst(
    .A(sw[9:2]),  // 8-bit input
    .Y(led[13:6])  // 8-bit output
);

endmodule
