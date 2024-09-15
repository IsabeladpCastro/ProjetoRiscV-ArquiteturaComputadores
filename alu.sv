//
// alu.sv : unidade logica-aritmetica p/ algumas instrucoes
//
// Simulação: Waveform8


module alu(input  logic [31:0] a, b,
           input  logic [2:0]  alucontrol,
           output logic [31:0] result,
           output logic        zero,
			  output logic emaior 
			  );

  logic [31:0] condinvb, sum;
  logic        v;              // overflow
  logic        isAddSub;       // true when is add or subtract operation
  

  assign condinvb = alucontrol[0] ? ~b : b;
  assign sum = a + condinvb + alucontrol[0];
  assign isAddSub = ~alucontrol[2] & ~alucontrol[1] |
                    ~alucontrol[1] & alucontrol[0];
				  	

  always_comb
    case (alucontrol)
      3'b000:  result = sum;         // add
      3'b001:  result = sum;         // subtract
      3'b010:  result = a & b;       // and
      3'b011:  result = a | b;       // or
		3'b100:  result = a << b; //sll, slli
      3'b101:  result = sum[31] ^ v; // slt
		3'b110:  result = a >> b; //srl, srli
		3'b111:  result = a ^ b; //xor, xori
		
		//4'b1000: result = ~zero; (bne)
		//4'b1001: result = sum[31]; //bit mais significativo, bit de sinal (blt) 
		//4'b1010: result = ~sum[31] & (|sum); //bit de sinal positivo e garante que nem todos os bits estão zerados (bge)
		
		
		
      default: result = 32'bx;
    endcase

  assign emaior = ~sum[31] & (|sum);
  assign zero = (result == 32'b0);
  assign v = ~(alucontrol[0] ^ a[31] ^ b[31]) & (a[31] ^ sum[31]) & isAddSub;
  
endmodule
