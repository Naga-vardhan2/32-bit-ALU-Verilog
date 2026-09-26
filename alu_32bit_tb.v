`timescale 1ns/1ps

module alu_32bit_tb;

reg [31:0] A, B;
reg [3:0] opcode;
wire [31:0] result;
wire carry;
wire zero;

ALU_32bit uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry(carry),
    .zero(zero)
);

task test;
    input [31:0] a_in;
    input [31:0] b_in;
    input [3:0] op_in;
    begin
        A = a_in;
        B = b_in;
        opcode = op_in;
        #10;
        $display("A=%h B=%h Opcode=%b Result=%h Carry=%b Zero=%b",
                 A, B, opcode, result, carry, zero);
    end
endtask

initial begin
    $dumpfile("alu_32bit.vcd");
    $dumpvars(0, alu_32bit_tb);

    test(32'd10, 32'd5, 4'b0000); // ADD
    test(32'd10, 32'd5, 4'b0001); // SUB
    test(32'hF0F0F0F0, 32'h0F0F0F0F, 4'b0010); // AND
    test(32'hF0F0F0F0, 32'h0F0F0F0F, 4'b0011); // OR
    test(32'hAAAAAAAA, 32'h55555555, 4'b0100); // XOR
    test(32'h0000000F, 32'd0, 4'b0101); // NOT
    test(32'd5, 32'd0, 4'b0110); // Left shift
    test(32'd10, 32'd0, 4'b0111); // Right shift

    #10;
    $finish;
end

endmodule
