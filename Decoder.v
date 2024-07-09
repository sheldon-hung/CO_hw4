module Decoder( instr_op_i, RegWrite_o,	ALUOp_o, ALUSrc_o, RegDst_o, Jump_o, Branch_o, BranchType_o, MemWrite_o, MemRead_o, MemtoReg_o);
     
//I/O ports
input	[6-1:0] instr_op_i;

output			RegWrite_o;
output	[3-1:0] ALUOp_o;
output			ALUSrc_o;
output	[2-1:0]	RegDst_o, MemtoReg_o;
output			Jump_o, Branch_o, BranchType_o, MemWrite_o, MemRead_o;
 
//Internal Signals
wire	[3-1:0] ALUOp_o;
wire			ALUSrc_o;
wire			RegWrite_o;
wire	[2-1:0]	RegDst_o, MemtoReg_o;
wire			Jump_o, Branch_o, BranchType_o, MemWrite_o, MemRead_o;

//Main function
/*your code here*/

reg [3-1:0] ALUOp_r;
always@(instr_op_i) begin
    case(instr_op_i)
        6'b000000: // R-type
            ALUOp_r = 3'b010;
        6'b001000: // addi
            ALUOp_r = 3'b011;
        6'b100001: // lw
            ALUOp_r = 3'b000;
        6'b100011: // sw
            ALUOp_r = 3'b000;
        6'b111011: // beq
            ALUOp_r = 3'b001;
        6'b100101: // bne
            ALUOp_r = 3'b110;
        6'b100010: // j
            ALUOp_r = 3'bxxx;
    endcase
end
assign ALUOp_o = ALUOp_r;

assign ALUSrc_o = (instr_op_i == 6'b100001) | (instr_op_i == 6'b100011)
                | (instr_op_i == 6'b001000); // lw, sw, addi
assign RegWrite_o = (instr_op_i == 6'b000000) | (instr_op_i == 6'b100001)
                  | (instr_op_i == 6'b001000); // R-type, lw, addi

assign RegDst_o[0] = (instr_op_i == 6'b000000); // R-type
assign MemtoReg_o[0] = (instr_op_i == 6'b100001); // lw

assign Jump_o = (instr_op_i == 6'b100010); // j
assign Branch_o = (instr_op_i == 6'b111011) | (instr_op_i == 6'b100101); // beq, bne
assign BranchType_o = (instr_op_i == 6'b100101); // bne
assign MemWrite_o = (instr_op_i == 6'b100011); // sw
assign MemRead_o = (instr_op_i == 6'b100001); // lw

endmodule
   