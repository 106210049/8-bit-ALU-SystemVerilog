module Assignment_Block(X,Y,X1,X2,X3,X4);
  input wire [3:0] X;
  input wire [3:0] Y;
  output reg [7:0] X1;  
  output reg [7:0] X2; 
  output reg [7:0] X3; 
  output reg [7:0] X4;
  
  assign X1[0]=X[0]&Y[0]; 
  assign X1[1]=X[1]&Y[0]; 
  assign X1[2]=X[2]&Y[0]; 
  assign X1[3]=X[3]&Y[0]; 
  assign X1[4]=0; 
  assign X1[5]=0; 
  assign X1[6]=0; 
  assign X1[7]=0;
  
  assign X2[0]=0; 
  assign X2[1]=X[0]&Y[1]; 
  assign X2[2]=X[1]&Y[1]; 
  assign X2[3]=X[2]&Y[1]; 
  assign X2[4]=X[3]&Y[1]; 
  assign X2[5]=0; 
  assign X2[6]=0; 
  assign X2[7]=0; 
  
  assign X3[0]=0; 
  assign X3[1]=0; 
  assign X3[2]=X[0]&Y[2]; 
  assign X3[3]=X[1]&Y[2]; 
  assign X3[4]=X[2]&Y[2]; 
  assign X3[5]=X[3]&Y[2]; 
  assign X3[6]=0; 
  assign X3[7]=0; 
  
  assign X4[0]=0; 
  assign X4[1]=0; 
  assign X4[2]=0; 
  assign X4[3]=X[0]&Y[3]; 
  assign X4[4]=X[1]&Y[3]; 
  assign X4[5]=X[2]&Y[3]; 
  assign X4[6]=X[3]&Y[3]; 
  assign X4[7]=0;
endmodule