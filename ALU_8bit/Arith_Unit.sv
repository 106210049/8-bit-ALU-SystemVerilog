// `include "CPU_package.sv"
`ifndef SYNTHESIS
    timeunit 1ps;
    timeprecision 1ps;
`endif
`include "Full_Adder.sv"
`include "Full_Subtractor.sv"
`include "4_bit_multiple.sv"
import CPU_package::*;
module Arith 
(
    input logic [DATA_WIDTH-1:0] 	in_a,
	input logic [DATA_WIDTH-1:0] 	in_b,
	input logic  					input_carry,
	input  enum_alu_opcode_t 		alu_opcode,
  	output logic [DATA_WIDTH-1:0] 	arith_out,
  	output logic [1:0] 				arith_out_flag 
);
  logic [DATA_WIDTH-1:0] adder_out;
  logic adder_Cout;
  Full_Adder_by8 adder(.A(in_a),.B(in_b),.Cin(input_carry),.Cout(adder_Cout),.S(adder_out));
  logic [DATA_WIDTH-1:0] subtractor_out;
  logic subtractor_Bout;
  Full_Subtractor_by8 subtractor(.a(in_a),.b(in_b),.Bin(input_carry),.B(subtractor_Bout),.D(subtractor_out));
  logic [DATA_WIDTH-1:0] adder_1_out;
  logic adder_1_Cout;
  Full_Adder_by8 increase_1(.A(in_a),.B(1),.Cin(input_carry),.Cout(adder_1_Cout),.S(adder_1_out));
  logic [DATA_WIDTH-1:0] subtractor_1_out;
  logic subtractor_1_Bout;
  Full_Subtractor_by8 subtractor_1(.a(in_a),.b(1),.Bin(input_carry),.B(subtractor_1_Bout),.D(subtractor_1_out));
  logic [DATA_WIDTH-1:0] multiple_out;
  Multiple_4bit multiple(.X(in_a[3:0]),.Y(in_b[3:0]),.s(multiple_out));
  
always_comb	 begin: arith_proc
  		arith_out=0;
  		arith_out_flag='{default:0};
		case(alu_opcode)
		ALU_OP_ADD: begin
          {arith_out_flag,arith_out}={adder_Cout,adder_out};
		end
		ALU_OP_SUB: begin
          {arith_out_flag,arith_out}={subtractor_Bout,subtractor_out};
		end
        ALU_OP_DIV: begin
          {arith_out_flag,arith_out}=in_a/in_b;
        end
        ALU_OP_MUL: begin
          {arith_out_flag,arith_out}={multiple_out};
        end
        ALU_OP_INC: begin
          {arith_out_flag,arith_out}={adder_1_Cout,adder_1_out};
        end
        ALU_OP_DEC: begin
          {arith_out_flag,arith_out}={subtractor_1_Bout,subtractor_1_out};
        end
        ALU_OP_SHL: begin
          {arith_out_flag,arith_out} = {in_a[DATA_WIDTH-2:0], input_carry};
		end
        ALU_OP_SHR: begin
          {arith_out_flag,arith_out} = {input_carry, in_a[DATA_WIDTH-1:1]};
        end
          default:	begin
            arith_out=0;
  			arith_out_flag='{default:0};
          end
        endcase
	end: arith_proc
endmodule: Arith
