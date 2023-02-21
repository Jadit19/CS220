module dual_port_memory (
    input [31:0] data_in;
    input [31:0] addr_a;
    input [31:0] addr_b;
    input mode;
    input clk;
    input wr_en;
    output reg [31:0] data_out;
);
    reg [31:0] mem [0:31];

    always @(posedge clk) begin
        if (mode == 0) begin
            if (wr_en) begin
                mem[addr_a] <= data_in;
            end
            data_out <= mem[addr_a];
        end else begin
            data_out <= mem[addr_b];
        end
    end
endmodule