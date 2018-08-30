

module ALU_32bit( result, zero, overflow, aluSrc1, aluSrc2, invertA, invertB, operation );
   
  output wire[31:0] result;
  output wire zero;
  output wire overflow;

  input wire[31:0] aluSrc1;
  input wire[31:0] aluSrc2;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;

  wire c1;
  wire c2;
  wire c3;
  wire c4;
  wire c5;
  wire c6;
  wire c7;
  wire c8;
  wire c9;
  wire c10;
  wire c11;
  wire c12;
  wire c13;
  wire c14;
  wire c15;
  wire c16;
  wire c17;
  wire c18;
  wire c19;
  wire c20;
  wire c21;
  wire c22;
  wire c23;
  wire c24;
  wire c25;
  wire c26;
  wire c27;
  wire c28;
  wire c29;
  wire c30;
  wire c31;
  wire c32;
  wire set;
  wire a_out;
  wire b_out;

  wire out0;
  wire out1;
  wire out2;
  wire out3;

  /*your code here*/
  ALU_1bit u0(.result(result[0]), .carryOut(c1), .a(aluSrc1[0]), .b(aluSrc2[0]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(invertB), .less(set));
  ALU_1bit u1(.result(result[1]), .carryOut(c2), .a(aluSrc1[1]), .b(aluSrc2[1]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c1), .less(1'b0));
  ALU_1bit u2(.result(result[2]), .carryOut(c3), .a(aluSrc1[2]), .b(aluSrc2[2]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c2), .less(1'b0));
  ALU_1bit u3(.result(result[3]), .carryOut(c4), .a(aluSrc1[3]), .b(aluSrc2[3]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c3), .less(1'b0));
  ALU_1bit u4(.result(result[4]), .carryOut(c5), .a(aluSrc1[4]), .b(aluSrc2[4]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c4), .less(1'b0));
  ALU_1bit u5(.result(result[5]), .carryOut(c6), .a(aluSrc1[5]), .b(aluSrc2[5]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c5), .less(1'b0));
  ALU_1bit u6(.result(result[6]), .carryOut(c7), .a(aluSrc1[6]), .b(aluSrc2[6]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c6), .less(1'b0));
  ALU_1bit u7(.result(result[7]), .carryOut(c8), .a(aluSrc1[7]), .b(aluSrc2[7]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c7), .less(1'b0));
  ALU_1bit u8(.result(result[8]), .carryOut(c9), .a(aluSrc1[8]), .b(aluSrc2[8]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c8), .less(1'b0));
  ALU_1bit u9(.result(result[9]), .carryOut(c10), .a(aluSrc1[9]), .b(aluSrc2[9]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c9), .less(1'b0));
  ALU_1bit u10(.result(result[10]), .carryOut(c11), .a(aluSrc1[10]), .b(aluSrc2[10]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c10), .less(1'b0));
  ALU_1bit u11(.result(result[11]), .carryOut(c12), .a(aluSrc1[11]), .b(aluSrc2[11]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c11), .less(1'b0));
  ALU_1bit u12(.result(result[12]), .carryOut(c13), .a(aluSrc1[12]), .b(aluSrc2[12]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c12), .less(1'b0));
  ALU_1bit u13(.result(result[13]), .carryOut(c14), .a(aluSrc1[13]), .b(aluSrc2[13]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c13), .less(1'b0));
  ALU_1bit u14(.result(result[14]), .carryOut(c15), .a(aluSrc1[14]), .b(aluSrc2[14]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c14), .less(1'b0));
  ALU_1bit u15(.result(result[15]), .carryOut(c16), .a(aluSrc1[15]), .b(aluSrc2[15]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c15), .less(1'b0));
  ALU_1bit u16(.result(result[16]), .carryOut(c17), .a(aluSrc1[16]), .b(aluSrc2[16]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c16), .less(1'b0));
  ALU_1bit u17(.result(result[17]), .carryOut(c18), .a(aluSrc1[17]), .b(aluSrc2[17]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c17), .less(1'b0));
  ALU_1bit u18(.result(result[18]), .carryOut(c19), .a(aluSrc1[18]), .b(aluSrc2[18]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c18), .less(1'b0));
  ALU_1bit u19(.result(result[19]), .carryOut(c20), .a(aluSrc1[19]), .b(aluSrc2[19]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c19), .less(1'b0));
  ALU_1bit u20(.result(result[20]), .carryOut(c21), .a(aluSrc1[20]), .b(aluSrc2[20]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c20), .less(1'b0));
  ALU_1bit u21(.result(result[21]), .carryOut(c22), .a(aluSrc1[21]), .b(aluSrc2[21]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c21), .less(1'b0));
  ALU_1bit u22(.result(result[22]), .carryOut(c23), .a(aluSrc1[22]), .b(aluSrc2[22]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c22), .less(1'b0));
  ALU_1bit u23(.result(result[23]), .carryOut(c24), .a(aluSrc1[23]), .b(aluSrc2[23]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c23), .less(1'b0));
  ALU_1bit u24(.result(result[24]), .carryOut(c25), .a(aluSrc1[24]), .b(aluSrc2[24]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c24), .less(1'b0));
  ALU_1bit u25(.result(result[25]), .carryOut(c26), .a(aluSrc1[25]), .b(aluSrc2[25]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c25), .less(1'b0));
  ALU_1bit u26(.result(result[26]), .carryOut(c27), .a(aluSrc1[26]), .b(aluSrc2[26]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c26), .less(1'b0));
  ALU_1bit u27(.result(result[27]), .carryOut(c28), .a(aluSrc1[27]), .b(aluSrc2[27]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c27), .less(1'b0));
  ALU_1bit u28(.result(result[28]), .carryOut(c29), .a(aluSrc1[28]), .b(aluSrc2[28]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c28), .less(1'b0));
  ALU_1bit u29(.result(result[29]), .carryOut(c30), .a(aluSrc1[29]), .b(aluSrc2[29]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c29), .less(1'b0));
  ALU_1bit u30(.result(result[30]), .carryOut(c31), .a(aluSrc1[30]), .b(aluSrc2[30]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c30), .less(1'b0));
//  ALU_1bit u31(.result(result[31]), .carryOut(c32), .a(aluSrc1[31]), .b(aluSrc2[31]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(c31), .less(1'b0));

  assign zero = (result == 32'b0)? 1: 0;
  assign overflow = c32 ^ c31;
 
 
  assign a_out = (invertA)? ~aluSrc1[31]: aluSrc1[31];
  assign b_out = (invertB)? ~aluSrc2[31]: aluSrc2[31];

  and d0(out0, a_out, b_out); //a0 not defined but legal format

  or d1(out1, a_out, b_out);

  Full_adder d2(
	.sum(out2),
	.carryOut(c32),
	.carryIn(c31),
	.input1(a_out),
	.input2(b_out)
  );
  assign set = out2;
  assign out3 = 1'b0;

  assign result[31] = (~operation[1] & ~operation[0] & out0)|
		  (~operation[1] &  operation[0] & out1)|
		  ( operation[1] & ~operation[0] & out2)|
		  ( operation[1] &  operation[0] & out3);  

//  assign set = ($signed(aluSrc1)<$signed(aluSrc2))? 1: 0;

endmodule
