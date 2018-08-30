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

  wire aout;
  wire bout;

  wire out0;
  wire out1;
  wire out2;
  wire out3;

  assign aout = (invertA)? ~a: a;
  assign bout = (invertB)? ~b: b;

  and and0(out0, aout, bout); //a0 not defined but legal format

  or or0(out1, aout, bout);

  Full_adder add0( .sum(out2), .carryOut(carryOut), .carryIn(carryIn), .input1(aout), .input2(bout) );

  assign out3 = less;

  assign result = (~operation[1] & ~operation[0] & out0)|
		  (~operation[1] &  operation[0] & out1)|
		  ( operation[1] & ~operation[0] & out2)|
		  ( operation[1] &  operation[0] & out3);
  
endmodule
