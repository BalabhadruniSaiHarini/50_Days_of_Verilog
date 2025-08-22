module decoder2to4_tb;

reg  [1:0] in;
reg        en;
wire [3:0] out;

// Instantiate the Unit Under Test (UUT)
decoder2to4 uut (
    .in(in),
    .en(en),
    .out(out)
);

initial begin
    $display("Time\tEn\tIn\tOut");
    $monitor("%g\t%b\t%b\t%b", $time, en, in, out);

    // Test all input combinations with enable off
    en = 0;
    in = 2'b00; #10;
    in = 2'b01; #10;
    in = 2'b10; #10;
    in = 2'b11; #10;

    // Test all input combinations with enable on
    en = 1;
    in = 2'b00; #10;
    in = 2'b01; #10;
    in = 2'b10; #10;
    in = 2'b11; #10;

    $finish;
end

endmodule
