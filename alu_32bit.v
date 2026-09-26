module ALU_32bit (
    input  [31:0] A,
    input  [31:0] B,
    input  [3:0]  opcode,
    output reg [31:0] result,
    output reg carry,
    output zero
);

reg [32:0] temp;

always @(*) begin
    result = 32'b0;
    carry  = 1'b0;
    temp   = 33'b0;

    case (opcode)
        4'b0000: begin
            temp   = {1'b0, A} + {1'b0, B};
            result = temp[31:0];
            carry  = temp[32];
        end
        4'b0001: result = A - B;
        4'b0010: result = A & B;
        4'b0011: result = A | B;
        4'b0100: result = A ^ B;
        4'b0101: result = ~A;
        4'b0110: result = A << 1;
        4'b0111: result = A >> 1;
        default: begin
            result = 32'b0;
            carry  = 1'b0;
        end
    endcase
end

assign zero = (result == 32'b0);

endmodule
