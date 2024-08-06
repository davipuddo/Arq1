// 853355 - Davi Ferreira Puddo

module G0101;

	// Definir dados
	integer x = 13;
	reg [9:0] b = 0;

	// Acoes
	initial
		begin : main

			// Identificacao
			$display ("\nG0101 -\n");

			// a)
			x = 26;
			b = x;
			$display ("%0d (10) = %8b (2)", x, b);

			// b)
			x = 53;   
			b = x;
			$display ("%0d (10) = %8b (2)", x, b);

			// c)
			x = 713;
			b = x;
			$display ("%0d (10) = %8b (2)", x, b);

			// d)
			x = 213;
			b = x;
			$display ("%0d (10) = %8b (2)", x, b);

			// e)
			x = 365;
			b = x;
			$display ("%0d (10) = %8b (2)", x, b);

		end // main

endmodule // G0101

module G0102;

	// Definir dados
	integer x = 0;
	reg [7:0] b = 8'b10101;

	// Acoes
	initial
		begin : main

			// Identificacao
			$display ("\nG0102 -\n");

			// a)
			x = b;
			$display ("%8b (2) = %0d", b, x);

			// b)
			b = 8'b11011;
			x = b;
			$display ("%8b (2) = %0d", b, x);

			// c)
			b = 8'b10010;
			x = b;
			$display ("%8b (2) = %0d", b, x);

			// d)
			b = 8'b101011;
			x = b;
			$display ("%8b (2) = %0d", b, x);

			// e)
			b = 8'b110111;
			x = b;
			$display ("%8b (2) = %0d", b, x);

		end // main

endmodule // G0102

module G0103;

	// Definir dados
	integer x = 61;
	reg [9:0] b = 0;

	// Acoes
	initial
		begin : main

			// Identificacao
			$display ("\nG0103 -\n");

			// a)
			b = x;
			$display ("%0d (10) = %0d%0d%0d%0d%0d (4)", x, b[9:8], b[7:6], b[5:4], b[3:2], b[1:0]);

			// b)
			x = 53;
			b = x;
			$display ("%0d (10) = %o (8)", x, b);

			// c)
			x = 77;
			b = x;
			$display ("%0d (10) = %h (16)", x, b);

			// d)
			x = 153;
			b = x;
			$display ("%0d (10) = %h (16)", x, b);

			// e)
			x = 753;
			b = x;
			$display ("%0d (10) = %X (16)", x, b);

		end // main

endmodule // G0103

module G0104;

	// Definir dados
	reg [7:0] b = 0;

	// Acoes
	initial
		begin : main

			// Identificacao
			$display ("\nG0104 -\n");

			// a)
			b = 8'b10100;
			$display ("%8b (2) = %0d%0d%0d%0d (4)", b[7:0], b[7:6], b[5:4], b[3:2], b[1:0]);

			// b)
			b = 8'b11010;
			$display ("%8b (2) = %o (8)", b[7:0], b[7:0]);

			// c)
			b = 8'b100111;
			$display ("%8b (2) = %h (16)", b[7:0], b[7:0]);

			// d)
			b = 8'b100101;
			$display ("%8b (2) = %o (8)", b[7:0], b[7:0]);

			// e)
			b = 8'b101101;
			$display ("%8b (2) = %0d%0d%0d%0d (4)", b[7:0], b[7:6], b[5:4], b[3:2], b[1:0]);

		end // main

endmodule // G0104

module G0105;

	// Definir dados
	reg [0:7][7:0] s = "PUC-M.G.";
	reg [0:13][7:0] b = "Belo Horizonte";
	reg [0:4][7:0] o = {8'o156, 8'o157, 8'o151, 8'o164, 8'o145};
	reg [0:4][7:0] h = {8'h4D, 8'h61, 8'h6E, 8'h68, 8'h61};
	
	// Acoes
	initial
		begin: main
		
		$display ("%s (ASCII) = %h (ASCII_16)", s, s);
			
		s = "2024-02";
		$display ("%s (ASCII) = %h (ASCII_16)", s, s);
				
		$display ("%s (ASCII) = %8b (ASCII_2)", b, b);

		$display ("%o (ASCII_8) = %s", o, o);

		$display ("%h (ASCII_16) = %s", h, h);

		end // main
		
endmodule // G0105
