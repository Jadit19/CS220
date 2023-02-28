module float_adder(
    input [31:0] a, 
    input [31:0] b, 
    output reg [31:0] sum
);

    reg [30:0] mantissa_a;
    reg [30:0] mantissa_b;
    reg [31:0] exp_a;
    reg [31:0] exp_b;
    reg [31:0] mantissa_sum;
    reg [31:0] exp_sum;
    reg [31:0] exp_diff;
    reg sign_a, sign_b, sign_sum;
    reg [31:0] zero = 32'h00000000;
    reg [31:0] nan = 32'h7F800001;

    always @(*) begin
        // Extract mantissa, exponent, and sign from input a
        mantissa_a = {1'b1, a[22:0]};
        exp_a = a[30:23];
        sign_a = a[31];

        // Extract mantissa, exponent, and sign from input b
        mantissa_b = {1'b1, b[22:0]};
        exp_b = b[30:23];
        sign_b = b[31];

        // Calculate the difference between the exponents
        exp_diff = exp_a - exp_b;

        // Adjust the mantissa and exponent of the smaller number
        if (exp_diff > 0) begin
            mantissa_b = mantissa_b >> exp_diff;
            exp_sum = exp_a;
        end
        else if (exp_diff < 0) begin
            mantissa_a = mantissa_a >> -exp_diff;
            exp_sum = exp_b;
        end
        else begin
            exp_sum = exp_a;
        end

        // Add or subtract the mantissas, depending on the sign of the inputs
        if (sign_a == sign_b) begin
            mantissa_sum = mantissa_a + mantissa_b;
            sign_sum = sign_a;
        end
        else begin
            mantissa_sum = mantissa_a - mantissa_b;
            sign_sum = mantissa_a > mantissa_b ? sign_a : sign_b;
        end

        // Check for overflow and underflow
        if (mantissa_sum[24]) begin
            // Overflow
            if (exp_sum == 255) begin
                sum = nan;
                // return;
            end
            // Normalization
            mantissa_sum = mantissa_sum >> 1;
            exp_sum = exp_sum + 1;
        end
        else if (exp_sum == 0) begin
            // Underflow
            sum = zero;
            // return;
        end

        // Combine the sign, exponent, and mantissa into the sum output
        sum = {sign_sum, exp_sum, mantissa_sum[22:0]};
    end

endmodule