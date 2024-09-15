//
// controller.sv : Controlador RISC-V Monociclo 
//

module controller(input  logic [6:0] op,
                  input  logic [2:0] funct3,
                  input  logic       funct7b5,
                  input  logic       Zero,
                  output logic [1:0] ResultSrc,
                  output logic       MemWrite,
                  output logic       PCSrc, ALUSrc,
                  output logic       RegWrite, Jump,
                  output logic [1:0] ImmSrc,
                  output logic [2:0] ALUControl,
						input logic emaior
						);

  logic [1:0] ALUOp; //Branch 3 bits
  logic [2:0] Branch;
  
  logic sinalbge = 0;
  logic sinalblt = 0;
  logic sinalbne = 0;
  logic sinalbeq = 0;

  //assign PCSrc = Branch & Zero | Jump;
  
  maindec md(op, ResultSrc, MemWrite, Branch,
             ALUSrc, RegWrite, Jump, ImmSrc, ALUOp);
  aludec  ad(op[5], funct3, funct7b5, ALUOp, ALUControl);
  
always @(*) begin
    // Reset the signals
    sinalbeq = 0;
    sinalbne = 0;
    sinalbge = 0;
    sinalblt = 0;

    case (Branch)
      3'b001: 
        if (Zero)
          sinalbeq = 1;
		  3'b010:
          sinalbne = 1;
      3'b011:
        if (emaior)
          sinalbge = 1;
        3'b100:
          sinalblt = 1;
      default: begin
        sinalbeq = 0;
        sinalbge = 0;
        sinalblt = 0;
        sinalbne = 0;
      end
    endcase
 end


  
 assign PCSrc = sinalbeq | sinalbge | sinalblt | sinalbne | Jump;
 

 
endmodule

