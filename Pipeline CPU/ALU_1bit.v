`include "Full_adder.v"

module ALU_1bit( result, carryOut, a, b, invertA, invertB, operation, carryIn, less ); 
  
  output wire result;
  output wire carryOut;
  
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  input wire carryIn;
  input wire less;
  
  /*your code here*/ 

  wire a_out;
  wire b_out;

  wire out0;
  wire out1;
  wire out2;
  wire out3;

  assign a_out = (invertA)? ~a: a;
  assign b_out = (invertB)? ~b: b;

  and u0(out0, a_out, b_out); //a0 not defined but legal format

  or u1(out1, a_out, b_out);

  Full_adder u2(
	.sum(out2),
	.carryOut(carryOut),
	.carryIn(carryIn),
	.input1(a_out),
	.input2(b_out)
  );

  assign out3 = less;

  assign result = (~operation[1] & ~operation[0] & out0)|
		  (~operation[1] &  operation[0] & out1)|
		  ( operation[1] & ~operation[0] & out2)|
		  ( operation[1] &  operation[0] & out3);
  
endmodule
