module tb_d_ff;
    reg clk;
    reg rst;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop
    d_ff uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Generate clock (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Initialize inputs
        rst = 1;
        d = 0;

        // Apply reset for 15ns
        #15 rst = 0;

        // Test cases
        #10 d = 1;   // Q should become 1 at next clock edge
        #10 d = 0;   // Q should become 0 at next clock edge
        #10 d = 1;   // Q should become 1 at next clock edge
        #10;
        // Assert reset
        rst = 1;
        #10 rst = 0;
        #10 d = 0;
        #10;

        $finish;
    end

    initial begin
        $dumpfile("tb_d_ff.vcd");
        $dumpvars(0, tb_d_ff);
    end
endmodule
