`include "single_port_memory.v"

module single_port_memory_tb;
    reg clk;
    reg mode;
    reg [4:0] addr;
    reg [31:0] data_in;
    wire [31:0] data_out;

    single_port_memory dut (.clk(clk), .mode(mode), .addr(addr), .data_in(data_in), .data_out(data_out));

    initial begin
        clk = 0;
        mode = 0;
        addr = 0;
        data_in = 32'h01234567;
        #10;

        // Testing scribble mode
        mode = 0;
        data_in = 32'h01234567;
        addr = 0;
        #10;
        assert(data_out == 32'h01234567) else $error("Scribble mode test failed: expected 32'h01234567, got %$h", data_out);

        data_in = 32'h89ABCDEF;
        addr = 31;
        #10;
        assert(data_out == 32'h89ABCDEF) else $error("Scribble mode test failed: expected 32'h89ABCDEF, got %$h", data_out);

        // Testing interpret mode
        mode = 1;
        addr = 0;
        #10;
        assert(data_out == 32'h01234567) else $error("Scribble mode test failed: expected 32'h01234567, got %$h", data_out);

        data_in = 32'h89ABCDEF;
        addr = 31;
        #10;
        assert(data_out == 32'h89ABCDEF) else $error("Scribble mode test failed: expected 32'h89ABCDEF, got %$h", data_out);

        $finish;
    end
endmodule