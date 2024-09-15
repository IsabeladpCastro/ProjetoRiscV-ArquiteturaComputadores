//se o we = 1 consigo escrever o endereço do conteudo que esta wd em a (a so recebe endereço)
//se we = 0 rd recebe o que já estava em a (n consigo escrever o conteudo que vou gravar na memoria (wd))
//
//Waveform6
// dmem.sv : memoria de dados
//
// Simulacao: Waverform6.vwf
//
// Funciona como memora RAM (leitura e escrita).
// -lê uma porta combinacionalmente (a/rd)
//   ou grava essa porta na borda de subida do clock (a/wd/we)
// -word aligned - leitura em endereços múltiplos de 4

// Capacidade de armazenamento: 64 posicoes de 32 bits.)
//

module dmem(input logic clk, we,
				input logic [31:0] a, wd,
				output logic [31:0] rd);
	
	logic [31:0] RAM[63:0];
	
	assign rd = RAM[a[31:2]]; // word aligned 
	
	always_ff @(posedge clk)
		if (we) RAM[a[31:2]] <= wd;
		
endmodule