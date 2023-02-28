module single_port_memory(
    clk,
    rst,
    wrt,
    add,
    in,
    mode,
    out
);

    input [4:0] add;
    input [31:0] in;
    input clk,rst,wrt,mode;
    output [31:0] out;

    reg [31:0] mem [31:0];
    reg [4:0] out_reg;

    always @(posedge clk) begin
        if(mode == 0 ) begin
            mem[add] <= in ;
            out_reg <= add;
        end
        else
            out_reg <= add;
    end

    assign out = in;

endmodule