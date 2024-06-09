`include "assignment.sv";
module Multiple_4bit(input [3:0] X,input [3:0] Y,output [7:0] s); 
  wire n1,n2,Cout; 
  
  wire [7:0] X1;  
  wire [7:0] X2; 
  wire [7:0] X3; 
  wire [7:0] X4; 
  
  wire [7:0] m1; 
  wire [7:0] m2;
  
  // bo gan bit
  Assignment_Block Assign(.X(X),.Y(Y),.X1(X1),.X2(X2),.X3(X3),.X4(X4));
  
  // bo cong X1,X2 
  Full_Adder_by8 Mul0(.A(X1),.B(X2),.Cin(0),.S(m1),.Cout(n1)); 
  // bo cong X3,X4 
  Full_Adder_by8 Mul1(.A(X3),.B(X4),.Cin(n1),.S(m2),.Cout(n2)); 
  // bo cong m1,m2 
  Full_Adder_by8 Mul2(.A(m1),.B(m2),.Cin(n2),.S(s),.Cout(Cout));  
endmodule