module Pipeline_CPU( clk_i, rst_n );

//I/O port
input         clk_i;
input         rst_n;


wire [31:0] instr;
wire [31:0] instr_ID;
wire [31:0] instr_EX;
wire [31:0] instr_MEM;
wire [31:0] instr_WB;

wire [31:0] read_data_1_EX;
wire [31:0] read_data_2_EX;
wire [31:0] EX_result ;
wire [31:0] MEM_result ;


wire [31:0] PC_out;

wire [31:0] PC_in;


wire [4:0]	write_register;
wire [31:0] read_data_1;
wire [31:0] read_data_2;
wire [3:0] 	ALU_operation;
wire [1:0]	FULslt;
wire		zero;
assign zero = 0 ;
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



		
Mux2to1 #(.size(32)) Jump_or_PC(
		.data0_i(adder0_Result),
        .data1_i(Jump_result),
        .select_i(Branch_DM || Jump_DM),
        .data_o(PC_in)
		);		
		
		
//adder0_Result
//use for IF

wire [31:0]adder0_Result_ID;

//use for IF
		
		
		
IF uIF( .clk_i(clk_i), .rst_n(rst_n), .instr_i(instr) , .instr_o(instr_ID) , .adder0_Result_i(adder0_Result) , .adder0_Result_o(adder0_Result_ID) );	
	




Mux3to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(instr_WB[20:16]),
        .data1_i(instr_WB[15:11]),
		.data2_i(5'b11111),
        .select_i(RegDst_WB), //
        .data_o(write_register)
        );
		
		
		
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_n(rst_n) ,     
        .RSaddr_i(instr_ID[25:21]) ,  
        .RTaddr_i(instr_ID[20:16]) ,  
        .Wrtaddr_i(write_register) ,  
        .Wrtdata_i(MEM_result)  , 
        .RegWrite_i(RegWrite_WB),
        .RSdata_o(read_data_1) ,  
        .RTdata_o(read_data_2)   
        );
		

Decoder Decoder(
        .instr_op_i(instr_ID[31:26]), 
	    .RegWrite_o(RegWrite),// 
	    .ALUOp_o(alu_op),   //
	    .ALUSrc_o(ALUSrc),   //
	    .RegDst_o(RegDst), //
		.Jump_o(Jump), //
		.Branch_o(Branch), //
		.BranchType_o(BranchType),//
		.MemWrite_o(MemWrite),
		.MemRead_o(MemRead),
		.MemtoReg_o(MemtoReg)
		);
		
		
// use for ID register //
wire RegWrite_ID ;
wire [2:0]alu_op_ID ;
wire  ALUSrc_ID ;
wire  [1:0]RegDst_ID ;
wire  Jump_ID;
wire  Branch_ID;
wire  BranchType_ID ;
wire  MemWrite_ID ;
wire  MemRead_ID ;
wire  [1:0]MemtoReg_ID ;
wire [31:0]adder0_Result_iID ;




// use for ID register //
		
		
ID uID( .clk_i(clk_i), .rst_n(rst_n) , .instr_i(instr_ID) , .instr_o(instr_EX) 
		, .RSdata_i(read_data_1) , .RTdata_i(read_data_2) ,
		.RSdata_o(read_data_1_EX) , .RTdata_o(read_data_2_EX) , 
		.RegWrite_ID_i(RegWrite) , .RegWrite_ID_o(RegWrite_ID) , 
		.alu_op_ID_i(alu_op) , .alu_op_ID_o(alu_op_ID) , 
		.ALUSrc_ID_i(ALUSrc) , .ALUSrc_ID_o(ALUSrc_ID) , 
		.RegDst_ID_i(RegDst) , .RegDst_ID_o(RegDst_ID) , 
		.Jump_ID_i(Jump) , .Jump_ID_o(Jump_ID) , 
		.Branch_ID_i(Branch) , .Branch_ID_o(Branch_ID) , //
		.BranchType_i(BranchType) , .BranchType_o(BranchType_ID) ,  
		.MemWrite_ID_i(MemWrite) , .MemWrite_ID_o(MemWrite_ID) , 
		.MemRead_ID_i(MemRead) , .MemRead_ID_o(MemRead_ID) ,
		.MemtoReg_ID_i(MemtoReg) , .MemtoReg_ID_o(MemtoReg_ID) ,
		.adder0_Result_ID_i(adder0_Result_ID) , .adder0_Result_ID_o(adder0_Result_iID) ); 
		
		

		
		
// new

		
		

ALU_Ctrl AC(
        .funct_i(instr_EX[5:0]),   
        .ALUOp_i(alu_op_ID),   
        .ALU_operation_o(ALU_operation),
		.FURslt_o(FULslt),
		.Jump_o(Jr_signal)
        );
	
Sign_Extend SE(
        .data_i(instr_EX[15:0]),
        .data_o(sign_extend_result)
        );

Zero_Filled ZF(
        .data_i(instr_EX[15:0]),
        .data_o(zero_fill_result)
        );
		
Mux2to1 #(.size(32)) ALU_src2Src(
        .data0_i(read_data_2_EX),
        .data1_i(sign_extend_result),
        .select_i(ALUSrc_ID),
        .data_o(alu_or_shifter)
        );	
		
ALU ALU(
		.aluSrc1(read_data_1_EX),
	    .aluSrc2(alu_or_shifter),
	    .ALU_operation_i(ALU_operation),
		.result(ALU_result),
		.zero(zero),
		.overflow(overflow)
	    );
		
Shifter shifter( 
		.result(Shifter_Result), 
		.leftRight(~instr_EX[1]),
		.shamt(instr_EX[10:6]),
		.sftSrc(alu_or_shifter) 
		);
		
Mux3to1 #(.size(32)) RDdata_Source(
        .data0_i(ALU_result),
        .data1_i(Shifter_Result),
		.data2_i(zero_fill_result),
        .select_i(FULslt),
        .data_o(Mux3to1_output)
        );		
		
// use for EX register

wire [31:0]read_data_2_DM ;
wire MemRead_DM ;
wire MemWrite_DM ;
wire [1:0]MemtoReg_DM ;
wire [31:0]adder0_Result_DM ;
wire BranchType_DM;
wire Jump_DM ;
wire Branch_DM ;
wire [1:0]RegDst_DM ;
wire RegWrite_DM ;



// use for EX register
		
		
EX uEX( .clk_i(clk_i), .rst_n(rst_n), .instr_i(instr_EX), .instr_o(instr_MEM) , .alu_res_i(Mux3to1_output) , .alu_res_o(EX_result)  , 
			.read_data_2_DM_i(read_data_2_EX) , .read_data_2_DM_o(read_data_2_DM) ,
			.MemRead_DM_i(MemRead_ID) , .MemRead_DM_o(MemRead_DM) , 
			.MemWrite_DM_i(MemWrite_ID) , .MemWrite_DM_o(MemWrite_DM) ,
			.MemWrite_i(MemtoReg_ID) , .MemWrite_o(MemtoReg_DM) ,
			.adder0_Result_EX_i(adder0_Result_iID) , .adder0_Result_EX_o(adder0_Result_DM) ,
			.BranchType_EX_i(BranchType_ID) , .BranchType_EX_o(BranchType_DM) ,
			.Jump_EX_i(Jump_ID) , .Jump_EX_o(Jump_DM) ,
			.Branch_EX_i(Branch_ID) , .Branch_EX_o(Branch_DM) ,
			.RegDst_EX_i(RegDst_ID) , .RegDst_EX_o(RegDst_DM) ,
			.RegWrite_EX_i(RegWrite_ID) , .RegWrite_EX_o(RegWrite_DM)
			);

//MemWrite_i and MemWrite_o is not a correct name

Data_Memory DM(
		.clk_i(clk_i),
		.addr_i(EX_result),
		.data_i(read_data_2_DM), //
		.MemRead_i(MemRead_DM), //
		.MemWrite_i(MemWrite_DM), //
		.data_o(read_DM)
		);
		
Mux3to1 #(.size(32)) MemtoRegSrc(
        .data0_i(EX_result),
        .data1_i(read_DM),
		.data2_i(adder0_Result), //shoud be put ID　stage
        .select_i(MemtoReg_DM), //
        .data_o(write_data_i)
        );	
		
		
//wire use for MEM


//wire use for MEM
		
Mux2to1 #(.size(1)) BranchOrNot(
		.data0_i(zero),
        .data1_i(~zero),
        .select_i(BranchType_DM), //
        .data_o(branch_or_not)
		);
		
and and0(PCSrc, Branch, branch_or_not);

Mux2to1 #(.size(32)) PCSrc_Branch(
		.data0_i(adder0_Result_DM), //
        .data1_i(adder1_Result),
        .select_i(PCSrc),
        .data_o(PCSrcBranch_result)
		);
		
Adder Adder2(
        .src1_i(adder0_Result),     
	    .src2_i(sign_extend_result << 2),
	    .sum_o(adder1_Result)   
	    );

assign PCSrcJumpSrc0 = { adder0_Result[31:28], instr_MEM[25:0] , 2'b00};
		
Mux2to1 #(.size(32)) PCSrc_Jump(
		.data0_i(PCSrcBranch_result),
        .data1_i(PCSrcJumpSrc0),
        .select_i(Jump_DM), //
        .data_o(PCSrc_Jump_result) //to MEM
		);		
		
		
wire [31:0]PCSrc_Jump_result_MEM ;
wire [1:0] RegDst_WB ;
wire RegWrite_WB;
		
		
MEM uMEM( .clk_i(clk_i), .rst_n(rst_n), .instr_i(instr_MEM), .instr_o(instr_WB) , .MEM_res_i(write_data_i) , .MEM_res_o(MEM_result) ,
		.PCSrc_Jump_result_i(PCSrc_Jump_result) , .PCSrc_Jump_result_o(PCSrc_Jump_result_MEM) ,
			 .RegDst_ME_i(RegDst_DM) , .RegDst_ME_o(RegDst_WB) , .RegWrite_WB_i(RegWrite_DM) , .RegWrite_WB_o(RegWrite_WB)  );		
		
		
		
		
wire [31:0]Jump_result ;


Mux2to1 #(.size(32)) JumpRegSrc(
		.data0_i(PCSrc_Jump_result),
        .data1_i(read_data_1),
        .select_i(Jr_signal),
        .data_o(Jump_result)
		);		
		
endmodule



