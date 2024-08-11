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

module G0203;

	// Definir dados
	reg [7:0] b_i = 8'b00000000;
	reg [7:0] b_f = 8'b01111000;

	initial
		begin : main
		
			$display ("\nG0203 -\n");

			$display ("%0b.%0b (2) = %d.%d%d%d%d (4)", b_i[7:7], b_f, b_i, b_f[7:6], b_f[5:4], b_f[3:2], b_f[1:0]);

			b_f = 8'b101001;
			$display ("%0b.%0b (2) = %d.%d%d (8)", b_i[7:7], b_f, b_i, b_f[5:3], b_f[2:0]);
		
			b_f = 8'b10011000;
			$display ("%0b.%0b (2) = %h.%h%h (16)", b_i[7:7], b_f, b_i, b_f[7:4], b_f[3:0]);

			b_i = 8'b1;
			b_f = 8'b11101100;
			$display ("%0b.%0b (2) = %d.%d%d%d (8)", b_i, b_f, b_i, b_f[7:5], b_f[4:2], b_f[1:0]);
		
			b_i = 8'b1101;
			b_f = 8'b1001;
			$display ("%0b.%0b (2) = %h.%h (16)", b_i, b_f, b_i[3:0], b_f[3:0]);

		end // main
	

endmodule // G0203

module G0204;

	// Definir dados
	reg [3:0] t = 4'b0000;
	reg [7:0] b = 8'b00000000;
	reg [11:0] o = 12'o751;
	reg [15:0] h = 16'h3D2;
	integer x [7:0];
	
	// Acoes
	initial
		begin : main
			
			// Apresentacao
			$display ("\nG0204 -\n");

			b[7:6] = 0;
			b[5:4] = 3;
			b[3:2] = 2;
			b[1:0] = 1;

			$display ("0.321 (4) = 0.%0b (2)", b);
			
			t = h[11:8];	// Converter para binario
			x[5] = t[3:2];	// Converter para base 4
			x[4] = t[1:0];	//			==

			t = h[7:4];
			x[3] = t[3:2];
			x[2] = t[1:0];

			t = h[3:0];
			x[1] = t[3:2];
			x[0] = t[1:0];

			$display ("0.%h (16) = 0.%0d%0d%0d%0d%0d%0d (4)", h, x[5], x[4], x[3], x[2], x[1], x[0]);
			
			$display ("0.%0o (8) = 0.%0b%b%b (2)", o, o[8:6], o[5:3], o[2:0]);
			
			o = 12'o7_345;
			t = o[11:9];	// Conerter para binario
			x[7] = t[3:2];	// Converter para base 4
			x[6] = t[1:0];	//			==

			t = o[8:6];
			x[5] = t[3:2];
			x[4] = t[1:0];

			t = o[5:3];
			x[3] = t[3:2];
			x[2] = t[1:0];

			t = o[2:0];
			x[1] = t[3:2];
			x[0] = t[1:0];
			$display ("%0o.%0o (8) = %0d%0d.%0d%0d%0d%0d%0d%0d (4)", o[11:9], o[8:0], x[7], x[6], x[5], x[4], x[3], x[2], x[1], x[0]);
			
			h = 16'hFA5E;
			t = h[15:12];
			x[7] = t[3:2];
			x[6] = t[1:0];

			t = h[11:8];	// Converter para binario
			x[5] = t[3:2];	// Converter para base 4
			x[4] = t[1:0];	//			==

			t = h[7:4];
			x[3] = t[3:2];
			x[2] = t[1:0];

			t = h[3:0];
			x[1] = t[3:2];
			x[0] = t[1:0];

			$display ("%h.%h (16) = %0d%0d.%0d%0d%0d%0d%0d%0d (4)", h[15:12], h[11:0], x[7], x[6], x[5], x[4], x[3], x[2], x[1], x[0]);
		end // main

endmodule // G0204

module G0205;
	
	// Definir dados
	reg [7:0] a = 8'b00101110;
	reg [7:0] b = 8'b00010011;
	reg [7:0] r = 8'b00000000;
	reg [9:0] r2 = 10'b0000000000;
	reg [0:9] r3 = 10'b0000000000;

	// Acoes
	initial
		begin : main

			// Apresentacao
			$display ("\nG0205 -\n");
			
			r = a + b;
			$display ("%0b.%0b + %0b.%b = %0b.%b", a[5:3], a[2:0], b[4:3], b[2:0], r[6:3], r[2:0]);

			a = 8'b01000101;
			b = 8'b00010010;
			r = a - b;
			$display ("%0b.%0b - %0b.%b = %0b.%b", a[6:3], a[2:0], b[4:3], b[2:0], r[5:3],r[2:0]);

			a = 8'b00101101;
			b = 8'b00010101;
			r2 = a * b;
			$display ("%0b.%0b * %0b.%0b = %0b.%b", a[5:3], a[2:0], b[4:3], b[2:0], r2[9:6], r2[5:0]);
		
			a = 8'b01011101;
			b = 8'b00011011;
			r3 = a / b;
			$display ("%0b.%b / %0b.%b = %8b", a[7:3], a[2:0], b[4:3], b[2:0], r3);  // Sem casas decimais

			a = 8'b01101011;
			b = 8'b00001101;
			r = a % b;
			$display ("%0b %% %0b = %0b", a[6:0], b[3:0], r);

		end // main

endmodule // G0205
