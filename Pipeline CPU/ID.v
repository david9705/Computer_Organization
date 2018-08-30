module ID( clk_i, rst_n, instr_i, instr_o , RSdata_i , RTdata_i , RSdata_o , RTdata_o ,RegWrite_ID_i ,RegWrite_ID_o , 
	alu_op_ID_i , alu_op_ID_o , ALUSrc_ID_i , ALUSrc_ID_o , RegDst_ID_i , RegDst_ID_o , Jump_ID_i , Jump_ID_o , Branch_ID_i , Branch_ID_o ,
		BranchType_i , BranchType_o , MemWrite_ID_i , MemWrite_ID_o , MemRead_ID_i , MemRead_ID_o , MemtoReg_ID_i , MemtoReg_ID_o ,
		 adder0_Result_ID_i , adder0_Result_ID_o) ;
     
//I/O ports
input           clk_i;
input	        rst_n;
input  [32-1:0] instr_i;
input  [31:0] RSdata_i ;
input  [31:0] RTdata_i;

input RegWrite_ID_i ;
input [2:0]alu_op_ID_i ;
input  ALUSrc_ID_i ;
input  [1:0]RegDst_ID_i ;
input  Jump_ID_i ;
input  Branch_ID_i ;
input  BranchType_i ;
input  MemWrite_ID_i ;
input  MemRead_ID_i ;
input  [1:0]MemtoReg_ID_i ;
input [32:0]adder0_Result_ID_i;



output [32-1:0] instr_o;
output [31:0] RSdata_o;
output [31:0] RTdata_o;

output RegWrite_ID_o ;
output [2:0]alu_op_ID_o ;
output  ALUSrc_ID_o ;
output  [1:0]RegDst_ID_o ;
output  Jump_ID_o ;
output  Branch_ID_o ;
output  BranchType_o ;
output  MemWrite_ID_o ;
output  MemRead_ID_o ;
output  [1:0]MemtoReg_ID_o ;
output [32:0]adder0_Result_ID_o ;

 
//Internal Signals
reg    [32-1:0] instr_o;
reg 	[31:0] RSdata_o ;
reg 	[31:0] RTdata_o ;

reg RegWrite_ID_o ;
reg [2:0]alu_op_ID_o ;
reg  ALUSrc_ID_o ;
reg  [1:0]RegDst_ID_o ;
reg  Jump_ID_o ;
reg  Branch_ID_o ;
reg  BranchType_o ;
reg  MemWrite_ID_o ;
reg  MemRead_ID_o ;
reg  [1:0]MemtoReg_ID_o ;
reg [32:0]adder0_Result_ID_o;

//Main function
always @(posedge clk_i or negedge rst_n) begin
    if(~rst_n)begin
	    instr_o <= 0;
		RSdata_o <= 0 ;
		RTdata_o <= 0 ;
		
		RegWrite_ID_o <= 0;
		alu_op_ID_o <= 0;
		ALUSrc_ID_o <= 0;
		RegDst_ID_o <= 0 ;
		Jump_ID_o <= 0 ;
		Branch_ID_o <= 0 ;
		BranchType_o <= 0 ;
		MemWrite_ID_o <= 0;
		MemRead_ID_o <= 0;
		MemtoReg_ID_o <= 0;
		adder0_Result_ID_o <= 0;
		
		
		end
	else
		begin
			instr_o <= instr_i;
			RSdata_o <= RSdata_i ;
			RTdata_o <= RTdata_i ;
			
			RegWrite_ID_o <= RegWrite_ID_i;
			alu_op_ID_o <= alu_op_ID_i;
			ALUSrc_ID_o <= ALUSrc_ID_i;
			RegDst_ID_o <= RegDst_ID_i ;
			Jump_ID_o <= Jump_ID_i ;
			Branch_ID_o <= Branch_ID_i ;
			BranchType_o <= BranchType_i ;
			MemWrite_ID_o <= MemWrite_ID_i;
			MemRead_ID_o <= MemRead_ID_i;
			MemtoReg_ID_o <= MemtoReg_ID_i ;
			adder0_Result_ID_o <= adder0_Result_ID_i ;
			
			
		end
end

endmodule