module IF( clk_i, rst_n, instr_i, instr_o , adder0_Result_i , adder0_Result_o );
     
//I/O ports
input           clk_i;
input	        rst_n;
input  [32-1:0] instr_i;
input  [31:0] adder0_Result_i;
output [32-1:0] instr_o;
output [31:0] adder0_Result_o ;
 
//Internal Signals
reg    [32-1:0] instr_o;
reg 	[31:0] adder0_Result_o ;

//Main function
always @(posedge clk_i or negedge rst_n) begin
    if(~rst_n)
	begin
	    instr_o <= 0;
		adder0_Result_o <= 0 ;
	end
	else
		begin
	    instr_o <= instr_i;
		adder0_Result_o <= adder0_Result_i ;
		end
end

endmodule