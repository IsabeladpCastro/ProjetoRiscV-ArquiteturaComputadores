//
// maindec.sv : Decodificador Principal
//

module maindec(input  logic [6:0] op, //opcode
               output logic [1:0] ResultSrc, 
               output logic       MemWrite,
               output logic [2:0] Branch,
               output logic       ALUSrc, RegWrite, Jump,
               output logic [1:0] ImmSrc,
               output logic [1:0] ALUOp);

  logic [12:0] controls;

  assign {RegWrite, ImmSrc, ALUSrc, MemWrite,
          ResultSrc, Branch, ALUOp, Jump} = controls;

  always_comb
    case(op)
    // RegWrite_ImmSrc_ALUSrc_MemWrite_ResultSrc_Branch_ALUOp_Jump
	                                        //b    
      7'b0000011: controls = 13'b1_00_1_0_01_000_00_0; // lw
      7'b0100011: controls = 13'b0_01_1_1_00_000_00_0; // sw
      7'b0110011: controls = 13'b1_xx_0_0_00_000_10_0; // R-type 
		
		7'b1100011: controls = 13'b0_10_0_0_00_001_01_0; // beq
		7'b1100011: controls = 13'b0_10_0_0_00_010_01_0; // bne
		7'b1100011: controls = 13'b0_10_0_0_00_011_01_0; // blt
		7'b1100011: controls = 13'b0_10_0_0_00_100_01_0; // bge
		
      7'b0010011: controls = 13'b1_00_1_0_00_000_10_0; // I-type ALU
      7'b1101111: controls = 13'b1_11_0_0_10_000_00_1; // jal
      default:    controls = 13'bx_xx_x_x_xx_xxx_xx_x; // non-implemented instruction
    endcase
endmodule

