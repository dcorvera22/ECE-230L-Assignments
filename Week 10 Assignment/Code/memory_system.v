module memory_system(
    input [7:0] data,  
    input store,        
    input [1:0] addr,   
    output reg [7:0] memory 
);

    wire [7:0] byte_out[3:0]; 
    wire store_in[3:0];

    // 1. Store/Enable Demultiplexer (1-to-4, 1-bit wide)
    assign store_in[0] = (addr == 2'b00) ? store : 1'b0;
    assign store_in[1] = (addr == 2'b01) ? store : 1'b0;
    assign store_in[2] = (addr == 2'b10) ? store : 1'b0;
    assign store_in[3] = (addr == 2'b11) ? store : 1'b0;

    // 2. Instantiate 4 instances of the 8-bit memory block
    byte_memory byte0 (
        .data(data),
        .store(store_in[0]),
        .memory(byte_out[0])
    );

    byte_memory byte1 (
        .data(data),
        .store(store_in[1]),
        .memory(byte_out[1])
    );

    byte_memory byte2 (
        .data(data),
        .store(store_in[2]),
        .memory(byte_out[2])
    );

    byte_memory byte3 (
        .data(data),
        .store(store_in[3]),
        .memory(byte_out[3])
    );

    // 3. Output Data Multiplexer (4-to-1, 8-bit wide)
    always @(*) begin
        case(addr)
            2'b00: memory = byte_out[0];
            2'b01: memory = byte_out[1];
            2'b10: memory = byte_out[2];
            2'b11: memory = byte_out[3];
            default: memory = 8'b0;
        endcase
    end

endmodule