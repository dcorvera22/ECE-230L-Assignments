module top(
    input sw,     // w (Connects directly to w_in)
    output [9:0] led, // Output LEDs [9:0]
    input btnC,   // clk
    input btnU    // reset
);

    // --- Internal Wires ---
    // The single 'sw' input serves as our 'w_in' for the FSMs
    wire w_in = sw;
    
    wire clk_100m = btnC;
    wire reset_in = btnU;
    wire clk_slow;

    wire z_oh; 
    wire z_bin; 
    wire [4:0] state_oh; 
    wire [2:0] state_bin; 

    // --- 1. Instantiate Clock Divider ---
    // Creates a slow clock (clk_slow) from the 100MHz clock (clk_100m)
    clock_divider divider (
        .clk_in(clk_100m),
        .reset(reset_in),
        .clk_out(clk_slow)
    );

    // --- 2. Hook up binary and one-hot state machines ---

    // Instantiate One-Hot FSM
    onehot one_hot_inst (
        .w(w_in),
        .clk(clk_slow), 
        .reset(reset_in),
        .z(z_oh),
        .state_out(state_oh)
    );

    // Instantiate Binary FSM
    binary binary_inst (
        .w(w_in),
        .clk(clk_slow), 
        .reset(reset_in),
        .z(z_bin),
        .state_out(state_bin)
    );

    // --- 3. Connect Outputs to LEDs (led[9:0] assignments) ---

    // led[0] = One-hot Z
    assign led[0] = z_oh;

    // led[1] = Binary Z
    assign led[1] = z_bin;

    // led[6:2] = One-hot State (E, D, C, B, A)
    assign led[6:2] = state_oh;

    // led[9:7] = Binary State (MSB, Mid, LSB)
    assign led[9:7] = state_bin;

endmodule