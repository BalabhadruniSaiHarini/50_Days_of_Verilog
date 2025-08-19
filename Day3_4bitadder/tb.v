module tb_adder4bit;
    reg  [3:0] A, B;
    reg        Cin;
    wire [3:0] Sum;
    wire       Cout;

    adder4bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Test cases
        A = 4'b0001; B = 4'b0010; Cin = 0; #10;
        A = 4'b1111; B = 4'b0001; Cin = 0; #10;
        A = 4'b1010; B = 4'b0101; Cin = 1; #10;
        A = 4'b1001; B = 4'b1001; Cin = 1; #10;
        $finish;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b Cin=%b : Sum=%b Cout=%b", $time, A, B, Cin, Sum, Cout);
    end
endmodule
