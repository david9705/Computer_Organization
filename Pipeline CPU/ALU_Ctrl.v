module ALU_Ctrl( funct_i, ALUOp_i, ALU_operation_o, FURslt_o, Jump_o );

//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALU_operation_o;  
output     [2-1:0] FURslt_o;
output			   Jump_o;
     
//Internal Signals
wire		[4-1:0] ALU_operation_o;
wire		[2-1:0] FURslt_o;
wire 				Jump_o;


//Main function
/*your code here*/
assign FURslt_o = (ALUOp_i == 3'b101) ? 2'b10 : //lui
				  (funct_i[5:3] == 3'b000 && ALUOp_i == 3'b010) ? 2'b01 : //sll srl
				  2'b00;

				  
assign ALU_operation_o = (ALUOp_i == 3'b010)?(
							(funct_i == 6'b100000)? 4'b0010://add
							(funct_i == 6'b100010)? 4'b0110://sub
							(funct_i == 6'b100100)? 4'b0000://and
							(funct_i == 6'b100101)? 4'b0001://or
							(funct_i == 6'b100111)? 4'b1100://nor
							(funct_i == 6'b101010)? 4'b0111://slt
													4'b0000):
						  (ALUOp_i == 3'b100 || ALUOp_i == 3'b000)? 4'b0010: // addi  lw  sw
						  (ALUOp_i == 3'b001 || ALUOp_i == 3'b110)? 4'b0110: // beq  bne
																	4'b0000;

																	
																	
assign Jump_o = (ALUOp_i == 3'b010 && funct_i == 6'b001000) ? 1: 0;


						  
endmodule     
