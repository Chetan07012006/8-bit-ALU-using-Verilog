module alu_8bit_tb;

reg  [7:0] a;
reg  [7:0] b;
reg  [2:0] sel;
wire [7:0] result;
wire       carry;

alu_8bit UUT (
    .a(a),
    .b(b),
    .sel(sel),
    .result(result),
    .carry(carry)
);

initial begin
    // initial values
    a = 8'd10;
    b = 8'd5;

    // ADD
    sel = 3'b000; #10;

    // SUB
    sel = 3'b001; #10;

    // AND
    sel = 3'b010; #10;

    // OR
    sel = 3'b011; #10;

    // XOR
    sel = 3'b100; #10;

    // NOT A
    sel = 3'b101; #10;

    // INC A
    sel = 3'b110; #10;

    // CLEAR
    sel = 3'b111; #10;

    $stop;
end

endmodule

