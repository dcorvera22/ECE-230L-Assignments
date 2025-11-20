module binary (
    input w,     
    input clk,   
    input reset, 
    output z,    
    output [2:0] state_out 
);

    wire [2:0] State;
    wire [2:0] Next;

    assign state_out = State;

    // --- State Storage (dff Instantiation) ---
    // Initial state A = 000 (Default 0 for all bits)

    dff dff_0 ( 
        .Default(1'b0), 
        .D(Next[0]), 
        .clk(clk), 
        .reset(reset), 
        .Q(State[0]) 
    ); 
    
    dff dff_1 ( 
        .Default(1'b0), 
        .D(Next[1]), 
        .clk(clk), 
        .reset(reset), 
        .Q(State[1]) 
    );
    
    dff dff_2 ( 
        .Default(1'b0), 
        .D(Next[2]), 
        .clk(clk), 
        .reset(reset), 
        .Q(State[2]) 
    );


    // --- Next State Logic (Combinational Assignments) ---
    // Y2 (Next MSB)
    assign Next[2] = ( w & State[1] & State[0]) | ( w & State[2] & ~State[1] & ~State[0]);

    // Y1 (Middle Bit)
    assign Next[1] = (~w & State[1] & ~State[0]) | (~w & ~State[2] & State[0]) | (w & ~State[2] & ~State[0]);

    // Y0 (Next LSB)
    assign Next[0] = (~w & ~State[1] & ~State[0]) | (~w & State[2] & ~State[1]) | (w & ~State[2] & ~State[1]);

    
    // --- Output Logic (Combinational - Moore Machine) ---
    assign z = (~State[2] & State[1] & ~State[0]) | (State[2] & ~State[1] & ~State[0]);

endmodule