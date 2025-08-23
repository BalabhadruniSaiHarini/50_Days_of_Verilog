module priority_encoder4to2 (
    input  wire [3:0] d,      // Input lines
    output reg  [1:0] y,      // Encoded output
    output reg        valid   // Indicates if any input is high
);
    always @(*) begin
        valid = 1'b1;         // Assume valid unless no inputs active
        casex(d)
            4'b1xxx: begin y = 2'b11; end  // d[3] has highest priority
            4'b01xx: begin y = 2'b10; end
            4'b001x: begin y = 2'b01; end
            4'b0001: begin y = 2'b00; end
            default: begin y = 2'b00; valid = 1'b0; end // No input active
        endcase
    end
endmodule
