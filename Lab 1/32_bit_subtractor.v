`include "full_subtractor.v"

module thirty_two_bit_subtractor (
    A, B, diff
);
    input [31:0] A, B;
    wire [31:0] borrow;

    full_Subtractor fs [31:0] (.A(A[0]), .B(B[0]), .cin(1'b0), .diff(diff[0]), .cout(borrow[0]));

    generate
        genvar i;
        for (i = 1; i < 32; i = i + 1) begin
            full_Subtractor fs (.A(A[i]), .B(B[i]), .cin(borrow[i-1]), .diff(diff[i]), .cout(borrow[i]));
        end
    endgenerate
endmodule