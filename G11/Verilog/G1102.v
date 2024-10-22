// 853355 Davi Puddo

// Definir clock
module clock (clk);

	output reg clk;

	initial
		begin
			clk = 1'b0;
		end
	
	always
		begin
			#1 clk = ~clk;
		end

endmodule // clock

// FSM by Mealy
module moore ( y, x, clk, reset );

	output y;
	input x;
	input clk;
	input reset;
	reg y;

	parameter // state identifiers

	start = 3'b000,
	id1 = 3'b001,
	id11 = 3'b011,
	id110 = 3'b010,
	id1101 = 3'b110;

	reg [2:0] E1; // current state variables
	reg [2:0] E2; // next state logic output

	// next state logic
	always @( x or E1 )
	begin
		case ( E1 )
			start:
				if ( x )
					E2 = id1;
				else
					E2 = start;
			id1:
				if ( x )
					E2 = id11;
				else
					E2 = start;
			id11:
				if ( x )
					E2 = id11;
				else
					E2 = id110;
			id110:
				if ( x )
					E2 = id1101;		
				else
					E2 = start;
			id1101:
				if ( x )
					E2 = id11;
				else
					E2 = start;

			default: // undefined state
				E2 = 2'bxx;
		endcase
	end // always at signal or state changing

	// state variables
	always @( posedge clk or negedge reset )
	begin
		if ( reset )
			E1 = E2; // updates current state
		else
			E1 = 0; // reset
	end // always at signal changing

	// Ler indicador de Moore
	always @(E1)
	begin
		y = E1[2];
	end

endmodule // moore

module G1102;

	// Definir dados
	reg x = 1'b0;
	reg reset = 1'b0; // Zerar FSM
	wire clk;
	wire y;

	// Chamar modulos
	clock C1 (clk);
	moore M1 (y, x, clk, reset);

	always @(clk)
		#2 $display ("x: %b", x);

		initial
			begin : main

				#2 x = 1'b0; reset = 1'b1;
				#2 x = 1'b1; // 1
				#2 x = 1'b1; // 1
				#2 x = 1'b0; // 0
				#2 x = 1'b1; // 1
				#2 x = 1'b0;
				#2 x = 1'b1;
				#2 x = 1'b1; // 1
				#2 x = 1'b1; // 1
				#2 x = 1'b0; // 0
				#2 x = 1'b1; // 1

				#0 $finish; // O ultimo valor nao encontrado pois e necessario mais uma unidade de tempo
				//#1 $finish; // Valor encontrado

			end // main
	
	// Mostrar resultado
	always @(posedge y)
		$display ("encontrado");

endmodule // G1102
