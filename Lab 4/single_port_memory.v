module single_port_memory (
    input clk,                  // clock input
    input mode,                 // mode input
    input [4:0] addr,           // address input (up to 32 memory locations)
    input [31:0] data_in        // data input (32 bits)
    output [31:0] data_out      // data output (32 bits)
);
    reg [31:0] mem [31:0];      // memory array with 32x32 bits

    always @(posedge clk) begin
        if (mode == 0) begin
            mem[addr] <= data_in;
            data_put <= data_in;
        end else begin
            data_out <= mem[addr];
        end
    end
endmodule