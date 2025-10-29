module demux_1_to_4 (
    // Input
    input [3:0] In,
    input [1:0] Sel,
    input Enable,
    // Outputs
    output [3:0] Y0, Y1, Y2, Y3
);

    assign Y0 = (Enable && (Sel == 2'b00)) ? In : 4'b0;

    assign Y1 = (Enable && (Sel == 2'b01)) ? In : 4'b0;

    assign Y2 = (Enable && (Sel == 2'b10)) ? In : 4'b0;

    assign Y3 = (Enable && (Sel == 2'b11)) ? In : 4'b0;

endmodule