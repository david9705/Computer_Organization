module Decoder( instr_op_i, RegWrite_o,	ALUOp_o, ALUSrc_o, RegDst_o, Jump_o, Branch_o, BranchType_o, MemWrite_o, MemRead_o, MemtoReg_o);
     
//I/O ports
input	[6-1:0] instr_op_i;

output			RegWrite_o;
output	[3-1:0] ALUOp_o;
output			ALUSrc_o;
output		[1:0]	RegDst_o;


// new 
output			Jump_o;
output			Branch_o;
output			BranchType_o;
output			MemWrite_o;
output			MemRead_o;
output			MemtoReg_o;
 
//Internal Signals
wire	[3-1:0] ALUOp_o;
wire			ALUSrc_o;
wire			RegWrite_o;
wire	[2-1:0]	RegDst_o;


// new 
wire			Jump_o;
wire			Branch_o;
wire			BranchType_o;
wire			MemWrite_o;
wire			MemRead_o;
wire	[2-1:0]	MemtoReg_o;


//Main function
/*your code here*/



assign {ALUOp_o, ALUSrc_o, RegWrite_o, RegDst_o, Jump_o, Branch_o, BranchType_o, MemWrite_o, MemRead_o, MemtoReg_o} = 
		(instr_op_i == 6'b000000)? 14'b01001010000000://R-type	ALUOp_o = 010 , and jr is the same op code
		(instr_op_i == 6'b001000)? 14'b10011000000000://addi 	ALUOp_o = 100
		(instr_op_i == 6'b001111)? 14'b10111000000000://lui 	ALUOp_o = 101
		(instr_op_i == 6'b100011)? 14'b00011000000101://lw 		ALUOp_o = 000
		(instr_op_i == 6'b101011)? 14'b00010000001000://sw 		ALUOp_o = 000
		(instr_op_i == 6'b000100)? 14'b00100000100000://beq 	ALUOp_o = 001
		(instr_op_i == 6'b000101)? 14'b11000000110000://bne 	ALUOp_o = 110
		(instr_op_i == 6'b000010)? 14'b11100001000000://jump 	ALUOp_o = 111 #don't care , and assign same to jal
		(instr_op_i == 6'b000011)? 14'b11101101000010://jal 	ALUOp_o = 111
								   14'b00000000000000;//for	   exception


endmodule
   