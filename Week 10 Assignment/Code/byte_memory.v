module byte_memory(
    input [7:0] data,
    input store,
    output reg [7:0] memory 
);

    always @(data, store) begin
        if (store) begin
            memory <= data; 
        end
        
    end

endmodule