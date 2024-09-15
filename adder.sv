//
// adder.sv : somador de 32 bits
//
// Simulação: Waverform1.vwf
//

module adder(input [31:0] a, b,
				output [31:0] y);

	assign y = a + b;
	
endmodule