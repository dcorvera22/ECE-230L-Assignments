module top(
	input [3:0] sw,
	output [2:0] led
);// Implement top level module

	full_adder fa0 (
		.A(sw[0]),
		.B(sw[2], //C
		.Cin(1`b0),
		.Y(led[0],
		.Cout(c0)
	);
	
	full_adder fa1 (
		.A(sw[1]), //b
		.B(sw[3]),
		.Cin(c0),
		.Y(led[1]),
		.Cout(led[2])
	);
	
endmodule