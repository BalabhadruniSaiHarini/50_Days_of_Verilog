module mux2to1_tb;
    reg a, b, sel;
    wire out;
    mux2to1 u_mux2to1(a, b, sel, out);
    initial begin
        $dumpfile("mux2to1_tb.vcd");
        $dumpvars(0, mux2to1_tb);
        a = 0; b = 0; sel = 0; #10;
        a = 0; b = 1; sel = 0; #10;
        a = 1; b = 0; sel = 0; #10;
        a = 1; b = 1; sel = 0; #10;
        a = 0; b = 0; sel = 1; #10;
        a = 0; b = 1; sel = 1; #10;
        a = 1; b = 0; sel = 1; #10;
        a = 1; b = 1; sel = 1; #10;
        #10 $finish;
    end
    initial begin
        $monitor("a = %b, b = %b, sel = %b, out = %b", a, b, sel, out);
    end
endmodule
