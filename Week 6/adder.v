module adder(
    // Declare your A/B inputs
	input A,
	input B,
	output Y,
	output Carry
    // Declare Y output
    // Declare carry output
);

	assign Y = A ^ B;
    assign Carry = A & B// Enter logic equation here

endmodule