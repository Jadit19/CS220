`include "sequence_detector.v"

module sequence_detector_tb;
    reg clk, reset, in;
    wire out;

    sequence_detector dut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    initial begin
        clk = 0;
        reset = 1;
        in = 0;

        #10 reset = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 $finish;
    end

    always #5 clk = ~clk;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, sequence_detector_tb);
        #50;
        $finish;
    end
endmodule