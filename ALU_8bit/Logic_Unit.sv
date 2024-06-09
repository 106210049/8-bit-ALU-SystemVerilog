// `include "CPU_package.sv"
`ifndef SYNTHESIS
    timeunit 1ps;
    timeprecision 1ps;
`include "Comparator.sv"
import CPU_package::*;
module Logic( 
    input logic [DATA_WIDTH-1:0] 	in_a,
	input logic [DATA_WIDTH-1:0] 	in_b,
	input  enum_alu_opcode_t 		alu_opcode,
  	output logic [DATA_WIDTH-1:0] 	logic_out,
  	output logic [2:0]				logic_out_flag 
);
  logic equal,lower,greater;
  Comparator_8bit comparator(.a(in_a),.b(in_b),.equal(equal),.lower(lower),.greater(greater));
  
  always_comb	begin
    
  		logic_out='0;
  		logic_out_flag='{default:0};
  
		case(alu_opcode)
            ALU_OP_CPR: begin
              logic_out_flag={greater,equal,lower};
            end
            ALU_OP_AND: begin
              logic_out=in_a&in_b;
            end
            ALU_OP_OR: begin
              logic_out=in_a|in_b;
            end
            ALU_OP_XOR: begin
             logic_out=in_a^in_b;
            end
            ALU_OP_NOTA: begin
              logic_out=~in_a;
            end
          	ALU_OP_NOTB: begin
              logic_out=~in_b;
            end
          default:	begin
            logic_out='0;
  			logic_out_flag='{default:0};
          end
        endcase
	end
endmodule: Logic