module multiplexer (
    input0, input1, input2, input3, select, output
);
    input [31:0] input0, input1, input2, input3;
    input [1:0] select;
    output [31:0] output;

    assign output = (select == 2'b00) ? input0 :
                    (select == 2'b01) ? input1 :
                    (select == 2'b10) ? input2 :
                    (select == 2'b11) ? input3 : 32b'0;
endmodule