module EX( clk_i, rst_n, instr_i, instr_o , alu_res_i , alu_res_o , 
			read_data_2_DM_i ,read_data_2_DM_o ,
			MemRead_DM_i , MemRead_DM_o, 
			MemWrite_DM_i , MemWrite_DM_o,
			MemWrite_i , MemWrite_o ,
			adder0_Result_EX_i , adder0_Result_EX_o ,
			BranchType_EX_i , BranchType_EX_o ,
			Jump_EX_i , Jump_EX_o ,
			Branch_EX_i , Branch_EX_o ,
			RegDst_EX_i ,RegDst_EX_o ,
			RegWrite_EX_i , RegWrite_EX_o
			);
     
//I/O ports
input           clk_i;
input	        rst_n;
input  [32-1:0] instr_i;
input  [31:0] alu_res_i;

input [31:0]read_data_2_DM_i ;
input MemRead_DM_i ;
input MemWrite_DM_i ;
input [1:0]MemWrite_i ;
input [31:0]adder0_Result_EX_i;
input BranchType_EX_i ;
input Jump_EX_i ;
input Branch_EX_i ;
input [1:0]RegDst_EX_i ;
input RegWrite_EX_i ;

output [32-1:0] instr_o;
output [31:0] alu_res_o;

output [31:0]read_data_2_DM_o ;
output MemRead_DM_o ;
output MemWrite_DM_o ;
output [1:0]MemWrite_o ;
output [31:0]adder0_Result_EX_o;
output BranchType_EX_o;
output Jump_EX_o ;
output Branch_EX_o;
output [1:0]RegDst_EX_o ;
output RegWrite_EX_o ;
 
//Internal Signals
reg    [32-1:0] instr_o;
reg		[31:0] alu_res_o ;

reg [31:0]read_data_2_DM_o ;
reg MemRead_DM_o ;
reg MemWrite_DM_o ;
reg [1:0]MemWrite_o ;
reg [31:0]adder0_Result_EX_o ;
reg BranchType_EX_o;
reg Jump_EX_o ;
reg Branch_EX_o;
reg [1:0]RegDst_EX_o ;
reg RegWrite_EX_o ;



//Main function
always @(posedge clk_i or negedge rst_n) begin
    if(~rst_n)begin
	    instr_o <= 0;
		alu_res_o <= 0;
		read_data_2_DM_o <= 0;
		MemRead_DM_o <= 0;
		MemWrite_DM_o <= 0;
		MemWrite_o <= 0 ;
		adder0_Result_EX_o <= 0;
		BranchType_EX_o <= 0;
		Jump_EX_o <= 0;
		Branch_EX_o <= 0;
		RegDst_EX_o <= 0;
		RegWrite_EX_o <= 0 ;
		
		end
	else
		begin
			instr_o <= instr_i;
			alu_res_o <= alu_res_i ;
			read_data_2_DM_o <= read_data_2_DM_i ;
			MemRead_DM_o <= MemRead_DM_i;
			MemWrite_DM_o <= MemWrite_DM_i;
			MemWrite_o <= MemWrite_i;
			adder0_Result_EX_o <= adder0_Result_EX_i ;
			BranchType_EX_o <= BranchType_EX_i ;
			Jump_EX_o <= Jump_EX_i ;	
			Branch_EX_o <= Branch_EX_i ;
			RegDst_EX_o <= RegDst_EX_i ;
			RegWrite_EX_o <= RegWrite_EX_i ;
		end
end

endmodule