`include "dual_port_memory.v"

module dual_port_memory_tb;
    reg [31:0] data_in;
    reg [31:0] addr_a;
    reg [31:0] addr_b;
    reg mode;
    reg clk;
    reg wr_en;

    wire [31:0] data_out;

    dual_port_memory(.data_in(data_in),
                     .addr_a(addr_a),
                     .addr_b(addr_b),
                     .mode(mode),
                     .clk(clk),
                     .wr_en(wr_en),
                     .data_out(data_out));
    
    initial begin
        data_in <= 32'h1234;
        addr_A <= 5;
        mode <= 0;
        clk <= 0;
        wr_en <= 1;

        #10;
        wr_en <= 0;

        #10;
        data_in <= 0;
        addr_a <= 0;
        mode <= 1;
        addr_b <= 5;
        wr_en <= 0;

        #10;
        $display("Data at address 5 is %h", data_out);
        $finish;
    end
endmodule