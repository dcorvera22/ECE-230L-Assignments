module top(
	 input [6:0] sw, 
	 output [1:0] led
	); 

wire y_wire;
assign led[0] = y_wire;

	circuit_a Ainst( 
		.A(sw[0]), 
		.B(sw[1]), 
		.C(sw[2]), 
		.D(sw[3]), 
		.Y(led[0])
	);
	
	circuit_b Binst( 
	.A(y_wire),
	.B(sw[4]), 
	.C(sw[5]), 
	.D(sw[6]), 
	.Y(led[1])
);
	 
endmodule