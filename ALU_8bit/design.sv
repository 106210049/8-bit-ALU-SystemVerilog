// Code your design here
// Code your design here
`ifndef SYNTHESIS
    timeunit 1ps;
    timeprecision 1ps;
`endif
`include "CPU_package.sv"
`include "Arith_Unit.sv"
`include "Logic_Unit.sv"
import CPU_package::*;

module ALU (
    input logic [DATA_WIDTH-1:0] 	in_a,
	input logic [DATA_WIDTH-1:0] 	in_b,
	input logic 					input_carry,
	input  enum_alu_opcode_t 		alu_opcode,
  	output logic [DATA_WIDTH-1:0] 	alu_out,
  	output struct_alu_flag_t 		alu_out_flag
  	
);
  	logic [DATA_WIDTH-1:0] 			arith_out;
  	logic [DATA_WIDTH-1:0]			logic_out;
    logic [1:0]						arith_out_flag;
    logic [2:0]						logic_out_flag;	
  
   
  Arith arith_module(
        	.in_a(in_a),
            .in_b(in_b),
            .input_carry(input_carry),
            .alu_opcode(alu_opcode),
    		.arith_out(arith_out),
    		.arith_out_flag(arith_out_flag)
       );
  
  Logic logic_module(
        	.in_a(in_a),
            .in_b(in_b),
            .alu_opcode(alu_opcode),
            .logic_out(logic_out),
            .logic_out_flag(logic_out_flag)
       );
  
  always_comb	begin
    case(alu_opcode[3])
      1:	begin	
        alu_out=logic_out;
      	alu_out_flag=logic_out_flag;
      end
      0:	begin
        alu_out=arith_out;
      	alu_out_flag=arith_out_flag;
      end
    endcase
  end
  
endmodule
