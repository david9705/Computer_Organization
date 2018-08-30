`include "ALU_1bit.v"

module ALU( result, zero, overflow, aluSrc1, aluSrc2, invertA, invertB, operation );
   
  output wire[31:0] result;
  output wire zero;
  output wire overflow;

  input wire[31:0] aluSrc1;
  input wire[31:0] aluSrc2;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  
  
  
  wire a1;
  wire a2;
  wire a3;
  wire a4;
  wire a5;
  wire a6;
  wire a7;
  wire a8;
  wire a9;
  wire a10;
  wire a11;
  wire a12;
  wire a13;
  wire a14;
  wire a15;
  wire a16;
  wire a17;
  wire a18;
  wire a19;
  wire a20;
  wire a21;
  wire a22;
  wire a23;
  wire a24;
  wire a25;
  wire a26;
  wire a27;
  wire a28;
  wire a29;
  wire a30;
  wire a31;
  wire a32;
  wire set;
  
  ALU_1bit alu0(.result(result[0]), .carryOut(a1), .a(aluSrc1[0]), .b(aluSrc2[0]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(invertB), .less(set));
  ALU_1bit alu1(.result(result[1]), .carryOut(a2), .a(aluSrc1[1]), .b(aluSrc2[1]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a1), .less(1'b0));
  ALU_1bit alu2(.result(result[2]), .carryOut(a3), .a(aluSrc1[2]), .b(aluSrc2[2]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a2), .less(1'b0));
  ALU_1bit alu3(.result(result[3]), .carryOut(a4), .a(aluSrc1[3]), .b(aluSrc2[3]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a3), .less(1'b0));
  ALU_1bit alu4(.result(result[4]), .carryOut(a5), .a(aluSrc1[4]), .b(aluSrc2[4]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a4), .less(1'b0));
  ALU_1bit alu5(.result(result[5]), .carryOut(a6), .a(aluSrc1[5]), .b(aluSrc2[5]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a5), .less(1'b0));
  ALU_1bit alu6(.result(result[6]), .carryOut(a7), .a(aluSrc1[6]), .b(aluSrc2[6]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a6), .less(1'b0));
  ALU_1bit alu7(.result(result[7]), .carryOut(a8), .a(aluSrc1[7]), .b(aluSrc2[7]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a7), .less(1'b0));
  ALU_1bit alu8(.result(result[8]), .carryOut(a9), .a(aluSrc1[8]), .b(aluSrc2[8]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a8), .less(1'b0));
  ALU_1bit alu9(.result(result[9]), .carryOut(a10), .a(aluSrc1[9]), .b(aluSrc2[9]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a9), .less(1'b0));
  ALU_1bit alu10(.result(result[10]), .carryOut(a11), .a(aluSrc1[10]), .b(aluSrc2[10]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a10), .less(1'b0));
  ALU_1bit alu11(.result(result[11]), .carryOut(a12), .a(aluSrc1[11]), .b(aluSrc2[11]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a11), .less(1'b0));
  ALU_1bit alu12(.result(result[12]), .carryOut(a13), .a(aluSrc1[12]), .b(aluSrc2[12]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a12), .less(1'b0));
  ALU_1bit alu13(.result(result[13]), .carryOut(a14), .a(aluSrc1[13]), .b(aluSrc2[13]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a13), .less(1'b0));
  ALU_1bit alu14(.result(result[14]), .carryOut(a15), .a(aluSrc1[14]), .b(aluSrc2[14]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a14), .less(1'b0));
  ALU_1bit alu15(.result(result[15]), .carryOut(a16), .a(aluSrc1[15]), .b(aluSrc2[15]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a15), .less(1'b0));
  ALU_1bit alu16(.result(result[16]), .carryOut(a17), .a(aluSrc1[16]), .b(aluSrc2[16]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a16), .less(1'b0));
  ALU_1bit alu17(.result(result[17]), .carryOut(a18), .a(aluSrc1[17]), .b(aluSrc2[17]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a17), .less(1'b0));
  ALU_1bit alu18(.result(result[18]), .carryOut(a19), .a(aluSrc1[18]), .b(aluSrc2[18]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a18), .less(1'b0));
  ALU_1bit alu19(.result(result[19]), .carryOut(a20), .a(aluSrc1[19]), .b(aluSrc2[19]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a19), .less(1'b0));
  ALU_1bit alu20(.result(result[20]), .carryOut(a21), .a(aluSrc1[20]), .b(aluSrc2[20]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a20), .less(1'b0));
  ALU_1bit alu21(.result(result[21]), .carryOut(a22), .a(aluSrc1[21]), .b(aluSrc2[21]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a21), .less(1'b0));
  ALU_1bit alu22(.result(result[22]), .carryOut(a23), .a(aluSrc1[22]), .b(aluSrc2[22]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a22), .less(1'b0));
  ALU_1bit alu23(.result(result[23]), .carryOut(a24), .a(aluSrc1[23]), .b(aluSrc2[23]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a23), .less(1'b0));
  ALU_1bit alu24(.result(result[24]), .carryOut(a25), .a(aluSrc1[24]), .b(aluSrc2[24]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a24), .less(1'b0));
  ALU_1bit alu25(.result(result[25]), .carryOut(a26), .a(aluSrc1[25]), .b(aluSrc2[25]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a25), .less(1'b0));
  ALU_1bit alu26(.result(result[26]), .carryOut(a27), .a(aluSrc1[26]), .b(aluSrc2[26]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a26), .less(1'b0));
  ALU_1bit alu27(.result(result[27]), .carryOut(a28), .a(aluSrc1[27]), .b(aluSrc2[27]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a27), .less(1'b0));
  ALU_1bit alu28(.result(result[28]), .carryOut(a29), .a(aluSrc1[28]), .b(aluSrc2[28]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a28), .less(1'b0));
  ALU_1bit alu29(.result(result[29]), .carryOut(a30), .a(aluSrc1[29]), .b(aluSrc2[29]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a29), .less(1'b0));
  ALU_1bit alu30(.result(result[30]), .carryOut(a31), .a(aluSrc1[30]), .b(aluSrc2[30]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a30), .less(1'b0));
  ALU_1bit alu31(.result(result[31]), .carryOut(a32), .a(aluSrc1[31]), .b(aluSrc2[31]), .invertA(invertA), .invertB(invertB), .operation(operation), .carryIn(a31), .less(1'b0));

  assign zero = (result == 32'b0)? 1: 0;
  
  assign overflow = a32;
  
  assign set=(aluSrc1>=0&&aluSrc2>=0&&aluSrc1<aluSrc2)?1:
			   (aluSrc1<=0&&aluSrc2>=0)?1:
			   (aluSrc1<=0&&aluSrc2<=0&&aluSrc2-aluSrc1>0)?1:0;
  
 endmodule