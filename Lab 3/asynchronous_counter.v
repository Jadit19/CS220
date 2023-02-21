module asynchronous_counter (
    input clk, output reg [3:0] q
);
    reg [3:0] next_q;

    always @(posedge clk) begin
        next_q = q + 1;
        if (q == 4'b1001)
            next_q = 4'b0000;
    end

    always @(posedge clk) begin
        if (q == 4'b1001)
            q <= 4'b0000;
        else
            q <= next_q;
    end
endmodule