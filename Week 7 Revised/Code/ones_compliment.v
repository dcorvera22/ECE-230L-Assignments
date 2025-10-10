module ones_compliment(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Sum
);

wire [3:0] B_complement = ~B;

wire [3:0] initial_sum;
wire initial_carry_out;
wire [3:0] carry_chain;

full_adder fa0(.A(A[0]), .B(B_complement[0]), .Cin(1'b0), .Y(initial_sum[0]), .Cout(carry_chain[0]));
full_adder fa1(.A(A[1]), .B(B_complement[1]), .Cin(carry_chain[0]), .Y(initial_sum[1]), .Cout(carry_chain[1]));
full_adder fa2(.A(A[2]), .B(B_complement[2]), .Cin(carry_chain[1]), .Y(initial_sum[2]), .Cout(carry_chain[2]));
full_adder fa3(.A(A[3]), .B(B_complement[3]), .Cin(carry_chain[2]), .Y(initial_sum[3]), .Cout(initial_carry_out));

wire [3:0] final_sum;
wire [3:0] carry_chain2;

full_adder fa4(.A(initial_sum[0]), .B(1'b0), .Cin(initial_carry_out), .Y(final_sum[0]), .Cout(carry_chain2[0]));
full_adder fa5(.A(initial_sum[1]), .B(1'b0), .Cin(carry_chain2[0]), .Y(final_sum[1]), .Cout(carry_chain2[1]));
full_adder fa6(.A(initial_sum[2]), .B(1'b0), .Cin(carry_chain2[1]), .Y(final_sum[2]), .Cout(carry_chain2[2]));
full_adder fa7(.A(initial_sum[3]), .B(1'b0), .Cin(carry_chain2[2]), .Y(final_sum[3]), .Cout(carry_chain2[3]));

assign Sum = final_sum;

endmodule
