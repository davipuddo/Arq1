//853355 Davi Puddo

module G0201;
	
	// Converter valores decimais em binario para um valor em base 10
	function real DecBin2Dec;

		input [7:0] b;		// Valor decimal em binario
		integer i;			// Contador
		real power;			// Potencia
		real result;

		begin
			
			// Definir valores iniciais
			i = 7;
			power = 1.0;
			result = 0.0;
			
			while (i >= 0)
			begin
			
				power = power / 2.0;
				
				if (b[i] == 1)
				begin
				
					result = result + power;
				
				end // if
				
				i = i - 1;
				
			end // while

			DecBin2Dec = result;

		end
			
	endfunction
		
	// Definir dados	
	reg [7:0] a = 8'b00011000;
	real res = 0.0;

	// Acoes
	initial
		begin
			
			$display ("G0201 -\n");

			res = DecBin2Dec(a);
			$display ("%8b (2) = %f (10)", a, res);

			a = 8'b01001000;
			res = DecBin2Dec(a);
			$display ("%8b (2) = %f (10)", a, res);

			a = 8'b10101000;
			res = DecBin2Dec(a);
			$display ("%8b (2) = %f (10)", a, res);

			a = 8'b11101000;
			res = DecBin2Dec(a) + 8'b00000001;
			$display ("1.%8b (2) = %f (10)", a, res);

			a = 8'b11001000;
			res = DecBin2Dec(a) + 8'b00000011;
			$display ("11.%8b (2) = %f (10)", a, res);

		end

endmodule // G0201

module G0202;
	
	// Converter um valor decimal para um valor em binario
	function reg [0:7] Dec2DecBin;
		
		// Parametros
		input real value;

		// Variavies locais
		real dp, buffer;
		integer i, y;
		reg [0:7] result;

		// Acoes
		begin
			
			// Definir valore iniciais
			dp = 1.0;
			buffer = value;
			i = 0;
			y = 8;
			result = 8'b00000000;

			while (y > 0)
			begin

				while (i < 8 && dp > buffer)
				begin
					
					dp = dp / 2.0;

					i = i + 1;

				end // while

				if (i < 8)
				begin
				
					buffer = buffer - dp;
					result[i-1] = 1;

				end // if

				y = y - 1;

			end // while
			
			Dec2DecBin = result;

		end
	
	
	endfunction // Dec2DecBin
	
	// Mostrar dados
	function integer print;
		
		// Parametros
		input real d_10;
		input reg [0:7] d_2;
		input integer abs;

		// Variaveis locais
		reg [0:7] abs_b;
		
		// Acoes
		begin

			abs_b = abs;
			$display ("%f (10) = %1b.%8b (2)", d_10+abs, abs_b, d_2);
			print = 0;
			
		end

	endfunction // print

	// Definir dados
	real decimal = 0.375;

	// Acoes
	initial
		begin : main
			
			$display ("\nG0202 -\n");

			decimal = print (decimal, Dec2DecBin(decimal), 0);

			decimal = 0.125;
			decimal = print (decimal, Dec2DecBin(decimal), 2);

			decimal = 0.625;
			decimal = print (decimal, Dec2DecBin(decimal), 3);

			decimal = 0.03125;
			decimal = print (decimal, Dec2DecBin(decimal), 5);

			decimal = 0.75;
			decimal = print (decimal, Dec2DecBin(decimal), 6);

		end // main

endmodule // G0202
