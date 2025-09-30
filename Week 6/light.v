module light(
    input downstairs,// Declare downstairs and upstairs input
    input upstairs,// Declare stair light output
	output stair_light
);

    assign stair_light = downstairs ^ upstairs;// Enter logic equation here

endmodule