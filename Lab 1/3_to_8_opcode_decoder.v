module opcode_decoder (
    opcode, output
);
    input [2:0] opcode;
    output [7:0] output;

    assign output = 8'b0;

    case (opcode)
        3'b000: output = 8'b00000001;
        3'b001: output = 8'b00000010;
        3'b010: output = 8'b00000100;
        3'b011: output = 8'b00001000;
        3'b100: output = 8'b00010000;
        3'b101: output = 8'b00100000; 
        3'b110: output = 8'b01000000;
        3'b111: output = 8'b10000000;
        default: 
    endcase
endmodule