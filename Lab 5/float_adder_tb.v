`include "float_adder.v"
`include "compare.v"
`include "VEDA.v"

module float_adder_tb(
    input clk,
    output wire isEqual
);

    wire [31:0] a,b,c;
    reg rst;
    reg wrt;
    reg mode;
    reg [31:0] in1,in2,in3;
    reg [4:0] adda,addb,addc,addd;
    wire eq;

    single_port_memory S1(clk,rst,wrt,adda,in1,mode,a);
    single_port_memory S2(clk,rst,wrt,addb,in2,mode,b);
    single_port_memory S3(clk,rst,wrt,addc,in3,mode,c);

    reg [31:0] test1;
    reg [31:0] test2;
    wire [31:0] sum;

    float_adder dut(
        .a(a),
        .b(b),
        .sum(sum)
    );
    comparator comp(
        .a(c),
        .b(sum),
        .equal(isEqual)
    );

    initial begin
        mode = 1'b0;
		  
        in1 = 32'h3f800000;
        in2 = 32'h3f800000;
        in3 = 32'h40000001;
        adda = 5'b10;
        addb = 5'b1;
        addc = 5'b11;
    end

endmodule