//entrada: somente o endereço da instrução
//immsrc: endereço da instrução (ex: 0, 4, 8)  cada instrução já esta em seu devido endereço
//instr : a partir do endereço dado, será lida uma determinada instrução contida no riscvtest.tx
//immext: saida da operação que a instrução representa
//
// imem.sv : memoria de instrucoes
//
// Simulacao: Waverform7.vwf
//
// Funciona como memora ROM (read-only), 
//  sendo inicializado com as instrucoes contidas 
//  no arquivo riscvtes.txt (apenas p/ simulacao)
//
// Capacidade de armazenamento: 64 posicoes de 32 bits.)
//

module imem(input logic [31:0] a,
				output logic [31:0] rd);
	
	logic [31:0] RAM[63:0];
	
	//initial
	//	$readmemh("riscvtest.txt",RAM);
	

  initial
  begin
	 RAM[0]  = 32'h00500113;		// addi x2, x0, 5  		 # x2 = 5 (main:)
	 RAM[1]  = 32'h00C00193;		// addi x3, x0, 12  		 # x3 = 12
	 RAM[2]  = 32'hFF718393;      // addi x7, x3, -9  		 # x7 = (12 - 9) = 3
	 RAM[3]  = 32'h0023E233;		// or x4, x7, x2    		 # x4 = (3 OR 5) = 7 
	 RAM[4]  = 32'h0041F2B3;		// and x5, x3, x4   		 # x5 = (12 AND 7) = 4
	 RAM[5]  = 32'h004282B3;		// add x5, x5, x4   		 # x5 = 4 + 7 = 11
	 RAM[6]  = 32'h02728863;		// beq x5, x7, end  		 # desvio nao deve ser tomado
	 RAM[7]  = 32'h0041A233;		// slt x4, x3, x4   		 # x4 = (12 < 7) = 0
	 RAM[8]  = 32'h00020463;		// beq x4, x0, around 	 # desvio deve ser tomado
	 RAM[9]  = 32'h00000293;		// addi x5, x0, 0  		 # nao deve ser executada
	 RAM[10] = 32'h0023A233;		// slt x4, x7, x2 		 # x4 = (3 < 5) = 1  (around:)
	 RAM[11] = 32'h005203B3;		// add x7, x4, x5 		 # x7 = (1 + 11) = 12
	 RAM[12] = 32'h402383B3;		// sub x7, x7, x2 		 # x7 = (12 - 5) = 7
	 RAM[13] = 32'h0471AA23;		// sw x7, 84(x3) 			 # mem[96] = 7
	 RAM[14] = 32'h06002103;		// lw x2, 96(x0) 			 # x2 = mem[96] = 7
	 RAM[15] = 32'h005104B3;		// add x9, x2, x5 		 # x9 = (7 + 11) = 18
	 RAM[16] = 32'h008001EF;		// jal x3, end 			 # jump p/ end, x3 = 0x44
	 RAM[17] = 32'h00100113;		// addi x2, x0, 1 		 # nao deve ser executada
	 RAM[18] = 32'h00910133;		// add x2, x2, x9 		 # x2 = (7 + 18) = 25 (end:)
	 RAM[19] = 32'h0221A023;		// sw x2, 0x20(x3) 		 # mem[100] = 25
	 RAM[20] = 32'h00210063;		// beq x2, x2, 			 # loop infinito  (done:)
  end
  
    
	
	assign rd = RAM[a[31:2]]; // word aligned

endmodule
//