// Code your design here
`ifndef SYNTHESIS
    timeunit 1ps;
    timeprecision 1ps;
import CPU_package::*;

module Comparator_1bit(a,b,equal,lower,greater,c2,c1,c3);
  input wire  a;
  input wire  b;
  input reg c1,c2,c3;
  output reg equal;
  output reg lower;
  output reg greater;
    
  assign lower=c1|c2&((~a)&b);
  assign equal=c2&(~a)&(~b)|c2&a&b;
  assign greater=c3|c2&(a&(~b));
endmodule

module Comparator_8bit(a,b,equal,lower,greater);
  input wire  [DATA_WIDTH-1:0]a;
  input wire  [DATA_WIDTH-1:0]b;
  output reg equal;
  output reg lower;
  output reg greater;

  reg [6:0]c1;
  reg [6:0]c2;
  reg [6:0]c3;
  
  Comparator_1bit Compare7(a[7],b[7],c2[6],c1[6],c3[6],1,0,0);
  Comparator_1bit Compare6(a[6],b[6],c2[5],c1[5],c3[5],c2[6],c1[6],c3[6]);
  Comparator_1bit Compare5(a[5],b[5],c2[4],c1[4],c3[4],c2[5],c1[5],c3[5]);
  Comparator_1bit Compare4(a[4],b[4],c2[3],c1[3],c3[3],c2[4],c1[4],c3[4]);
  Comparator_1bit Compare3(a[3],b[3],c2[2],c1[2],c3[2],c2[3],c1[3],c3[3]);
  Comparator_1bit Compare2(a[2],b[2],c2[1],c1[1],c3[1],c2[2],c1[2],c3[2]);
  Comparator_1bit Compare1(a[1],b[1],c2[0],c1[0],c3[0],c2[1],c1[1],c3[1]);
  Comparator_1bit Compare0(a[0],b[0],equal,lower,greater,c2[0],c1[0],c3[0]);
endmodule
