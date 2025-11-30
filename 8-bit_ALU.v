module alu_8bit (
    input  [7:0] a,       // operand A
    input  [7:0] b,       // operand B
    input  [2:0] sel,     // operation select
    output reg [7:0] result,
    output reg carry
);

reg [8:0] temp;           // 9 bits to hold carry

always @(*) begin
    temp  = 9'd0;
    carry = 1'b0;
    result = 8'd0;

    case (sel)
        3'b000: begin                 // ADD
            temp   = a + b;
            result = temp[7:0];
            carry  = temp[8];
        end
        3'b001: begin                 // SUBTRACT
            temp   = a - b;
            result = temp[7:0];
            carry  = temp[8];         // borrow flag (simple)
        end
        3'b010: result = a & b;       // AND
        3'b011: result = a | b;       // OR
        3'b100: result = a ^ b;       // XOR
        3'b101: result = ~a;          // NOT A
        3'b110: result = a + 1'b1;    // INCREMENT A
        3'b111: result = 8'd0;        // CLEAR
        default: result = 8'd0;
    endcase
end

endmodule

