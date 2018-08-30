module MEM( clk_i, rst_n, instr_i, instr_o , MEM_res_i , MEM_res_o , PCSrc_Jump_result_i , PCSrc_Jump_result_o , RegDst_ME_i , RegDst_ME_o ,
			RegWrite_WB_i , RegWrite_WB_o );
     
//I/O ports
input           clk_i;
input	        rst_n;
input  [32-1:0] instr_i;
input  [31:0] MEM_res_i;
input  [31:0] PCSrc_Jump_result_i ;
input  [1:0] RegDst_ME_i ;
input  RegWrite_WB_i ;

output [32-1:0] instr_o;
output [31:0] MEM_res_o;
output [31:0] PCSrc_Jump_result_o ;
output [1:0] RegDst_ME_o ;
output RegWrite_WB_o ;
 
//Internal Signals
reg    [32-1:0] instr_o;
reg		[31:0] MEM_res_o ;
reg		[31:0] PCSrc_Jump_result_o ;
reg 	[1:0] RegDst_ME_o ;
reg		RegWrite_WB_o ;


//Main function
always @(posedge clk_i or negedge rst_n) begin
    if(~rst_n)begin
	    instr_o <= 0;
		MEM_res_o <= 0;
		PCSrc_Jump_result_o <= 0 ;
		RegDst_ME_o <= 0;
		RegWrite_WB_o <= 0 ;
		end
	else
		begin
			instr_o <= instr_i;
			MEM_res_o <= MEM_res_i ;
			PCSrc_Jump_result_o <= PCSrc_Jump_result_i ; 
			RegDst_ME_o <= RegDst_ME_i ;
			RegWrite_WB_o <= RegWrite_WB_i ;
			
		end
end

endmodule