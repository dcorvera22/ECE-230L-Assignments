module top (
    // Data Sources (Switches)
    input [15:0] sw,

    // Control Inputs (Buttons)
    input btnL,   // MUX Sel[0]
    input btnU,   // MUX Sel[1]
    input btnD,   // DEMUX Sel[0]
    input btnR,   // DEMUX Sel[1]
    input btnC,   // System Enable

    output [15:0] led
);

    // Internal Wires
    wire [3:0] mux_out;      
    wire [1:0] mux_sel;      
    wire [1:0] demux_sel;   

    assign mux_sel = {btnU, btnL};

    assign demux_sel = {btnR, btnD};

    mux_4_to_1 sender_valve (
        // Data Inputs (from sw)
        .A(sw[3:0]),        // CEO (00)
        .B(sw[7:4]),        // You (01)
        .C(sw[11:8]),       // Fred (10)
        .D(sw[15:12]),      // Jill (11)
        // Control
        .Sel(mux_sel),      // MUX selector
        .Enable(btnC),      // System Enable
        // Output
        .Y(mux_out)         
    );

    demux_1_to_4 receiver_valve (
        // Input (from MUX output)
        .In(mux_out),
        // Control
        .Sel(demux_sel),    // DEMUX selector
        .Enable(btnC),      // System Enable
        // Outputs (to led)
        .Y0(led[3:0]),      // local_lib (00)
        .Y1(led[7:4]),      // Fire Department (01)
        .Y2(led[11:8]),     // School (10)
        .Y3(led[15:12])     // Rib Shack (11)
    );

endmodule