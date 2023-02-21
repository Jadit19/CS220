module sequence_detector (
    input clk, input reset, input in, output reg out
);
    parameter START = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            state <= START;
            out <= 1'b0;
        end else begin
            case (state)
                START:  if (in) state <= S1;
                S1:     if (in) state <= S1; else state <= S2;
                S2:     if (in) state <= S3; else state <= S2;
                S3:     if (in) begin
                            state <= S1;
                            out <= 1'b1;
                        end else
                            state <= S2;
            endcase
        end
    end
endmodule