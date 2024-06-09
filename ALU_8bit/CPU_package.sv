package CPU_package;
  localparam DATA_WIDTH=8;
  localparam ADDRESS_WIDTH=10;
  localparam ADDRESS_MAX_WIDTH=2<<ADDRESS_WIDTH;

// ALU
localparam ALU_OPCODE=4;
typedef enum logic [ALU_OPCODE-1:0]{
      ALU_OP_ADD	//0000
    , ALU_OP_SUB	//0001
  	, ALU_OP_DIV	//0010
  	, ALU_OP_MUL	//0011
    , ALU_OP_INC	//0100
    , ALU_OP_DEC	//0101
    , ALU_OP_SHL	//0110
    , ALU_OP_SHR	//0111
  
    , ALU_OP_CPR	//1000
    , ALU_OP_AND	//1001
    , ALU_OP_OR		//1010
    , ALU_OP_XOR	//1011
    , ALU_OP_NOTA	//1100
  	, ALU_OP_NOTB	//1101
}enum_alu_opcode_t;

localparam ALU_FLAG_WIDTH = 5;
typedef struct packed {
    logic carry ;
    logic zero  ;
    logic equal ; // a=b
    logic larger; // a>b
    logic lower; // a<b
} struct_alu_flag_t;

endpackage: CPU_package