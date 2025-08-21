`timescale 1ns/1ps
module tb_counter8bit();

reg clk;
reg reset;
wire [7:0] count;

// Instantiate the counter module
counter8bit uut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

initial begin
    // Initialize signals
    clk = 0;
    reset = 1;
    #10;
    reset = 0;

    // Let counter run for 300 ns
    #300;

    // Apply reset in the middle
    reset = 1;
    #20;
    reset = 0;

    // Run again for 100 ns
    #100;

    $finish;
end

// Generate clock: 10ns period
always #5 clk = ~clk;

initial begin
    $monitor("Time: %t | reset: %b | count: %d", $time, reset, count);
end

endmodule
