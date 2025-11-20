module onehot (
    input w,     
    input clk,   
    input reset, 
    output z,    
    output [4:0] state_out 
);

    // --- Next State Wires ---
    wire Anext, Bnext, Cnext, Dnext, Enext;

    // --- Current State Wires ---
    wire Astate, Bstate, Cstate, Dstate, Estate;

    // Output the states to the LEDs (Order: E, D, C, B, A)
    assign state_out = {Estate, Dstate, Cstate, Bstate, Astate};
    
    // --- State Storage (dff Instantiation) ---

    dff dff_A ( .Default(1'b1), .D(Anext), .clk(clk), .reset(reset), .Q(Astate) );
    dff dff_B ( .Default(1'b0), .D(Bnext), .clk(clk), .reset(reset), .Q(Bstate) );
    dff dff_C ( .Default(1'b0), .D(Cnext), .clk(clk), .reset(reset), .Q(Cstate) );
    dff dff_D ( .Default(1'b0), .D(Dnext), .clk(clk), .reset(reset), .Q(Dstate) );
    dff dff_E ( .Default(1'b0), .D(Enext), .clk(clk), .reset(reset), .Q(Estate) );


    // --- Next State Logic (Combinational Assignments) ---
    assign Anext = 1'b0;
    assign Bnext = (~w) & (Astate | Dstate | Estate);
    assign Cnext = (~w) & (Bstate | Cstate);
    assign Dnext = w & (Astate | Bstate | Cstate);
    assign Enext = w & (Dstate | Estate);


    // --- Output Logic (Combinational - Moore Machine) ---
    assign z = Cstate | Estate;

endmodule