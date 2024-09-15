
module riscv_output (input logic[9:0] pixelRow,
							input logic[9:0] pixelColumn,
							output logic[5:0] characterAddress,
							input logic[31:0] PC_IN,
							input logic[31:0] INST_IN);	

// Nro da linha na tela: bits 5-8 de pixelRow (4bits)
// Nro da coluna na tela: bits 4-9 de pixelCol (6bits)

logic[4:0] row_address;
logic[5:0] col_address;

//row_address = pixelRow[9:4];
//assign row_address = pixelRow[8:5];
assign row_address = pixelRow[8:4];
assign col_address = pixelColumn[9:4];

//assign characterAddress= 6'b000001;   // Letra A
	

 always @(*)
	case(row_address)
		4'd1: 
			case(col_address)
				8'd5: characterAddress=  6'o15;   // Letra M
				8'd6: characterAddress=  6'o15;   // Letra M
				8'd7: characterAddress=  6'o06;   // Letra F
				8'd8: characterAddress=  6'o40;   // Espaço branco
				8'd9: characterAddress=  6'o55;   // TRAÇO
				8'd10: characterAddress= 6'o40;   // Espaço branco
				8'd11: characterAddress= 6'o01;   // Letra A
				8'd12: characterAddress= 6'o22;   // Letra R
				8'd13: characterAddress= 6'o21;   // Letra Q
				8'd14: characterAddress= 6'o61;   // NRO 1
				8'd15: characterAddress= 6'o40;   // Espaço branco
				8'd16: characterAddress= 6'o55;   // TRAÇO
				8'd17: characterAddress= 6'o40;  // Espaço branco
				8'd18: characterAddress= 6'o22;   // Letra R
				8'd19: characterAddress= 6'o11;   // Letra I
				8'd20: characterAddress= 6'o23;   // Letra S
				8'd21: characterAddress= 6'o03;   // Letra C
				8'd22: characterAddress= 6'o55;   // TRAÇO
				8'd23: characterAddress= 6'o26;   // Letra V
				default: characterAddress= 6'b100000;   // Espaço branco
			endcase
		
		4'd4: 
			case(col_address)
				8'd5: characterAddress= 6'b010000;   // Letra P
				8'd6: characterAddress= 6'b000011;   // Letra C
				8'd7: characterAddress= 6'b100000;   // Espaço branco
				8'd8: characterAddress= 6'b100000;   // Espaço branco
				8'd11: characterAddress=   {2'b11, PC_IN[15:12]};   // Digito Hexadecimal, mapeando p/ chars 0..9, A..F da Tabela 10.2 - Livro Hamblen, pg 203
				8'd12: characterAddress=  {2'b11, PC_IN[11:8]};   
				8'd13: characterAddress=  {2'b11, PC_IN[7:4]};   
				8'd14: characterAddress=  {2'b11, PC_IN[3:0]};   
				default: characterAddress= 6'b100000;   // Espaço branco
			endcase
			
			4'd6: 
			case(col_address)
				8'd5: characterAddress= 6'o11;   // Letra I
				8'd6: characterAddress= 6'o16;   // Letra N
				8'd7: characterAddress= 6'o23;   // Letra S
				8'd8: characterAddress= 6'o24;   // Letra T
				8'd9: characterAddress= 6'b100000;   // Espaço branco
				8'd10: characterAddress= 6'b100000;   // Espaço branco
				8'd11: characterAddress=   {2'b11, INST_IN[31:28]};   // Digito Hexadecimal, mapeando p/ chars 0..9, A..F da Tabela 10.2 - Livro Hamblen, pg 203
				8'd12: characterAddress=   {2'b11, INST_IN[27:24]};
				8'd13: characterAddress=   {2'b11, INST_IN[23:20]};
				8'd14: characterAddress=   {2'b11, INST_IN[19:16]};
				8'd15: characterAddress=   {2'b11, INST_IN[15:12]};
				8'd16: characterAddress=   {2'b11, INST_IN[11:8]};
				8'd17: characterAddress=   {2'b11, INST_IN[7:4]};
				8'd18: characterAddress=   {2'b11, INST_IN[3:0]};
				default: characterAddress= 6'b100000;   // Espaço branco
			endcase
			
			4'd8: 
			case(col_address)
			  8'd5: characterAddress = 6'o11;   // Letra I
			  8'd6: characterAddress = 6'o23;   // Letra S
			  8'd7: characterAddress = 6'o01;   // Letra A
			  8'd8: characterAddress = 6'o02;   // Letra B
			  8'd9: characterAddress = 6'o05;   // Letra E
			  8'd10: characterAddress = 6'o14;  // Letra L
			  8'd11: characterAddress = 6'o01;  // Letra A
        default: characterAddress = 6'b100000;  // Espaço branco
    endcase
	 
	 4'd10: 
    case(col_address)
        8'd5: characterAddress = 6'o12;   // Letra J
        8'd6: characterAddress = 6'o25;   // Letra U
        8'd7: characterAddress = 6'o14;   // Letra L
        8'd8: characterAddress = 6'o11;   // Letra I
        8'd9: characterAddress = 6'o01;   // Letra A
        default: characterAddress = 6'b100000;  // Espaço branco
    endcase
	 
	 4'd12: 
    case(col_address)
        8'd5: characterAddress = 6'o31;   // Letra Y
        8'd6: characterAddress = 6'o01;   // Letra A
        8'd7: characterAddress = 6'o22;   // Letra R
        8'd8: characterAddress = 6'o01;   // Letra A
        default: characterAddress = 6'b100000;  // Espaço branco
    endcase

	 
	 4'd15: 
    case(col_address)
        // "Merino"
        8'd5: characterAddress = 6'o15;   // Letra M
        8'd6: characterAddress = 6'o05;   // Letra E
        8'd7: characterAddress = 6'o22;   // Letra R
        8'd8: characterAddress = 6'o11;   // Letra I
        8'd9: characterAddress = 6'o16;   // Letra N
        8'd10: characterAddress = 6'o17;  // Letra O
        8'd11: characterAddress = 6'o40;  // Espaço branco

        // "merecemos"
        8'd12: characterAddress = 6'o15;   // Letra M
        8'd13: characterAddress = 6'o05;   // Letra E
        8'd14: characterAddress = 6'o22;   // Letra R
        8'd15: characterAddress = 6'o05;   // Letra E
        8'd16: characterAddress = 6'o03;   // Letra C
        8'd17: characterAddress = 6'o05;   // Letra E
        8'd18: characterAddress = 6'o15;   // Letra M
        8'd19: characterAddress = 6'o17;   // Letra O
        8'd20: characterAddress = 6'o23;   // Letra S
        8'd21: characterAddress = 6'o40;   // Espaço branco

        // "10"
        8'd22: characterAddress = 6'o61;   // Número 1
        8'd23: characterAddress = 6'o60;   // Número 0
		  8'd21: characterAddress = 6'o40;   // Espaço branco

        // "S2"
        8'd24: characterAddress = 6'o23;   // Letra S
        8'd25: characterAddress = 6'o62;   // Número 2
		  8'd21: characterAddress = 6'o40;   // Espaço branco

		
		default: characterAddress= 6'b100000;   // Espaço branco
	endcase
			
	
	endcase
endmodule

//if ((row_address == 4'b0001) && (col_address = 6'b001111 ))
 //  	characterAddress= 6'b000001;   // Letra A
	//else 
		//characterAddress= 6'b100000;   // Espaço branco