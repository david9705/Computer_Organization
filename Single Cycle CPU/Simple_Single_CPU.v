module Simple_Single_CPU( clk_i, rst_n );

//I/O port
input         clk_i;
input         rst_n;


wire [31:0] instr;


wire [31:0] PC_out;
wire [31:0] PC_in;
wire [4:0]	write_register;
wire [31:0] read_data_1;
wire [31:0] read_data_2;
wire [3:0] 	ALU_operation;
wire [1:0]	FULslt;
wire		zero;
wire 		overflow;
wire [31:0] sign_extend_result;
wire [31:0] alu_or_shifter;


wire [31:0] Shifter_Result;
wire [31:0] zero_fill_result;
wire [31:0] ALU_result;
wire [31:0] write_data_i;

//for decoder
wire RegWrite;
wire [2:0] alu_op;
wire ALUSrc;
wire [1:0]RegDst;

//new
wire Jump;
wire Branch;
wire BranchType;
wire MemWrite;
wire MemRead;
wire [1:0]MemtoReg;

wire [31:0]read_DM;
wire [31:0]Mux3to1_output;

wire branch_or_not;// after use and to Branch

wire PCSrc;


wire [31:0]PCSrcBranch_result;
wire [31:0]adder0_Result;
wire [31:0]adder1_Result;
wire [31:0]PCSrcJumpSrc0;
wire [31:0]PCSrc_Jump_result;
wire Jr_signal;


//modules
Program_Counter PC(
        .clk_i(clk_i),      
	    .rst_n(rst_n),     
	    .pc_in_i(PC_in) ,   
	    .pc_out_o(PC_out) 
	    );
		
		
Instr_Memory IM(
        .pc_addr_i(PC_out),  
	    .instr_o(instr)    
	    );		
	
	
Adder Adder0(
        .src1_i(PC_out),     
	    .src2_i(32'd4),
	    .sum_o(adder0_Result)   
	    );
	


			
		
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_n(rst_n) ,     
        .RSaddr_i(instr[25:21]) ,  
        .RTaddr_i(instr[20:16]) ,  
        .RDaddr_i(write_register) ,  
        .RDdata_i(write_data_i)  , 
        .RegWrite_i(RegWrite),
        .RSdata_o(read_data_1) ,  
        .RTdata_o(read_data_2)   
        );
		
		
Mux3to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(instr[20:16]),
        .data1_i(instr[15:11]),
		.data2_i(5'b11111),
        .select_i(RegDst),
        .data_o(write_register)
        );
		
		
// new
Decoder Decoder(
        .instr_op_i(instr[31:26]), 
	    .RegWrite_o(RegWrite), 
	    .ALUOp_o(alu_op),   
	    .ALUSrc_o(ALUSrc),   
	    .RegDst_o(RegDst),
		.Jump_o(Jump),
		.Branch_o(Branch),
		.BranchType_o(BranchType),
		.MemWrite_o(MemWrite),
		.MemRead_o(MemRead),
		.MemtoReg_o(MemtoReg)
		);
		
		

ALU_Ctrl AC(
        .funct_i(instr[5:0]),   
        .ALUOp_i(alu_op),   
        .ALU_operation_o(ALU_operation),
		.FURslt_o(FULslt),
		.Jump_o(Jr_signal)
        );
	
Sign_Extend SE(
        .data_i(instr[15:0]),
        .data_o(sign_extend_result)
        );

Zero_Filled ZF(
        .data_i(instr[15:0]),
        .data_o(zero_fill_result)
        );
		
Mux2to1 #(.size(32)) ALU_src2Src(
        .data0_i(read_data_2),
        .data1_i(sign_extend_result),
        .select_i(ALUSrc),
        .data_o(alu_or_shifter)
        );	
		
ALU ALU(
		.aluSrc1(read_data_1),
	    .aluSrc2(alu_or_shifter),
	    .ALU_operation_i(ALU_operation),
		.result(ALU_result),
		.zero(zero),
		.overflow(overflow)
	    );
		
Shifter shifter( 
		.result(Shifter_Result), 
		.leftRight(~instr[1]),
		.shamt(instr[10:6]),
		.sftSrc(alu_or_shifter) 
		);
		
Mux3to1 #(.size(32)) RDdata_Source(
        .data0_i(ALU_result),
        .data1_i(Shifter_Result),
		.data2_i(zero_fill_result),
        .select_i(FULslt),
        .data_o(Mux3to1_output)
        );			



Data_Memory DM(
		.clk_i(clk_i),
		.addr_i(Mux3to1_output),
		.data_i(read_data_2),
		.MemRead_i(MemRead),
		.MemWrite_i(MemWrite),
		.data_o(read_DM)
		);
		
Mux3to1 #(.size(32)) MemtoRegSrc(
        .data0_i(Mux3to1_output),
        .data1_i(read_DM),
		.data2_i(adder0_Result),
        .select_i(MemtoReg),
        .data_o(write_data_i)
        );	

Mux2to1 #(.size(1)) BranchOrNot(
		.data0_i(zero),
        .data1_i(~zero),
        .select_i(BranchType),
        .data_o(branch_or_not)
		);
		
and and0(PCSrc, Branch, branch_or_not);

Mux2to1 #(.size(32)) PCSrc_Branch(
		.data0_i(adder0_Result),
        .data1_i(adder1_Result),
        .select_i(PCSrc),
        .data_o(PCSrcBranch_result)
		);
		
Adder Adder2(
        .src1_i(adder0_Result),     
	    .src2_i(sign_extend_result << 2),
	    .sum_o(adder1_Result)   
	    );

assign PCSrcJumpSrc0 = { adder0_Result[31:28], instr[25:0] , 2'b00};
		
Mux2to1 #(.size(32)) PCSrc_Jump(
		.data0_i(PCSrcBranch_result),
        .data1_i(PCSrcJumpSrc0),
        .select_i(Jump),
        .data_o(PCSrc_Jump_result)
		);

Mux2to1 #(.size(32)) JumpRegSrc(
		.data0_i(PCSrc_Jump_result),
        .data1_i(read_data_1),
        .select_i(Jr_signal),
        .data_o(PC_in)
		);		
		
endmodule



