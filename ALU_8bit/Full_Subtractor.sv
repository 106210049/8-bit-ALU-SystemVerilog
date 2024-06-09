// Code your design here
// Code your design here
`ifndef SYNTHESIS
    timeunit 1ps;
    timeprecision 1ps;
import CPU_package::*;

module Full_Subtractor_by1(a,b,Bin,B,D);
  input wire a;
  input wire b;
  input wire Bin;
  output reg B;
  output reg D;
  
  wire tmp,tmp2,tmp3;
  xor(D,a,b,Bin);
  or(tmp,~a,b);
  and(tmp2,Bin,tmp);
  and(tmp3,~a,b);
  or(B,tmp3,tmp2);
endmodule

module Full_Subtractor_by8(a,b,Bin,B,D);
  input wire [DATA_WIDTH-1:0]a;
  input wire [DATA_WIDTH-1:0]b;
  input wire Bin;
  output reg B;
  output reg [DATA_WIDTH-1:0]D;
  
  reg [6:0] Carries;
  
  Full_Subtractor_by1 Sub1(.a(a[0]),.b(b[0]),.Bin(Bin),.B(Carries[0]),.D(D[0]));
  Full_Subtractor_by1 Sub2(.a(a[1]),.b(b[1]),.Bin(Carries[0]),.B(Carries[1]),.D(D[1]));
  Full_Subtractor_by1 Sub3(.a(a[2]),.b(b[2]),.Bin(Carries[1]),.B(Carries[2]),.D(D[2]));
  Full_Subtractor_by1 Sub4(.a(a[3]),.b(b[3]),.Bin(Carries[2]),.B(Carries[3]),.D(D[3]));
  Full_Subtractor_by1 Sub5(.a(a[4]),.b(b[4]),.Bin(Carries[3]),.B(Carries[4]),.D(D[4]));
  Full_Subtractor_by1 Sub6(.a(a[5]),.b(b[5]),.Bin(Carries[4]),.B(Carries[5]),.D(D[5]));
  Full_Subtractor_by1 Sub7(.a(a[6]),.b(b[6]),.Bin(Carries[5]),.B(Carries[6]),.D(D[6]));
  Full_Subtractor_by1 Sub8(a[7],b[7],Carries[6],B,D[7]);

endmodule
