module adder4bit (
    input  [3:0] A,    // 4-bit input A
    input  [3:0] B,    // 4-bit input B
    input        Cin,  // Carry in
    output [3:0] Sum,  // 4-bit sum output
    output       Cout  // Carry out
);
    assign {Cout, Sum} = A + B + Cin;
endmodule