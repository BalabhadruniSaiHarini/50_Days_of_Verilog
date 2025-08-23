module tb_priority_encoder4to2;
    reg  [3:0] d;
    wire [1:0] y;
    wire       valid;

    // Instantiate the priority encoder
    priority_encoder4to2 uut (
        .d(d),
        .y(y),
        .valid(valid)
    );

    initial begin
        $display("Time |   d   | y | valid");
        $display("-------------------------");
        d = 4'b0000; #10;  // No input active
        d = 4'b0001; #10;  // Only d[0] active
        d = 4'b0010; #10;  // Only d active
        d = 4'b0100; #10;  // Only d active
        d = 4'b1000; #10;  // Only d active
        d = 4'b0110; #10;  // d and d; d should be prioritized
        d = 4'b1011; #10;  // d and lower; d prioritized
        $finish;
    end

    initial begin
        $monitor("%4t | %b | %b | %b", $time, d, y, valid);
    end
endmodule
