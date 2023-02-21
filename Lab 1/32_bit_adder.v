`include "full_adder.v"

module thirty_two_bit_adder (
    A, B, sum
);
    input [31:0] A, B;
    output [31:0] sum;
    wire [31:0] carry;

    full_adder FA [31:0] (.A(A[0]), .B(B[0]), .cin(1'b0), .sum(sum[0]), .cout(carry[0]));

    generate
        genvar i;
        for (i=1; i<32; i=1+1) begin
            full_adder fa(.A(A[i]), .B(B[i]), .cin(carry[i-1]), .sum(sum[i]), .cout(carry[i]));
        end
    endgenerate
endmodule