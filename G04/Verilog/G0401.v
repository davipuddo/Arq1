// 853355 Davi Puddo

// Operacoes
module f1a (output a, input x,y,z);

	assign a = (~x & ~(~y|z));	 // == (x | (y&~z))

endmodule // f1a

module f1b (output b, input x,y,z);

	assign b = (~(~x|~y) & z);	 // == (x & y & z)

endmodule // f1b

module f1c (output c, input x,y,z);

	assign c = (~(x&~y) & ~z);  // == ( (~x | y) & ~z)

endmodule // f1c

module f1d (output d, input x,y,z);

	assign d = (~(~x&y ) & z);	// == ( (x | ~y) & z)

endmodule // f1d

module f1e (output e, input x,y,z);

	assign e = ( (~x|y) & ~(~y | z) );  // == (y & ~z)

endmodule // f1e

// Exercicios
module G0401;

	// Definir dados
	reg x,y,z;
	wire a, b, c, d, e;		// Resultados
	
	// Operacoes
	f1a F1a (a, x,y,z);
	f1b F1b (b, x,y,z);
	f1c F1c (c, x,y,z);
	f1d F1d (d, x,y,z);
	f1e F1e (e, x,y,z);

	initial
		begin // Definir valores iniciais

			x = 1'b0;
			y = 1'b0;
			z = 1'b0;

		end

	initial
		begin : main
			
			// G0104a
			$display ("\nG0104a -\n");

			$monitor ("%b %b %b = %b", x, y, z, a);
			#1 z = 1'b1;
			#1 z = 1'b0; y = 1'b1;
			#1 z = 1'b1; y = 1'b1;
			#1 z = 1'b0; y = 1'b0; x = 1'b1;
			#1 z = 1'b1; y = 1'b0; x = 1'b1;
			#1 z = 1'b0; y = 1'b1; x = 1'b1;
			#1 z = 1'b1; y = 1'b1; x = 1'b1;
			
			// G0104b 
			#15 $display ("\nG0104b -\n");
			
			// Definir valores iniciais
			#1 z = 1'b0; y = 1'b0; x = 1'b0;

			$monitor ("%b %b %b = %b", x, y, z, b);
			#1 z = 1'b1;
			#1 z = 1'b0; y = 1'b1;
			#1 z = 1'b1; y = 1'b1;
			#1 z = 1'b0; y = 1'b0; x = 1'b1;
			#1 z = 1'b1; y = 1'b0; x = 1'b1;
			#1 z = 1'b0; y = 1'b1; x = 1'b1;
			#1 z = 1'b1; y = 1'b1; x = 1'b1;
			
			// G0104c
			#15 $display ("\nG0104c -\n");
			
			// Definir valores iniciais
			#1 z = 1'b0; y = 1'b0; x = 1'b0;

			$monitor ("%b %b %b = %b", x, y, z, c);
			#1 z = 1'b1;
			#1 z = 1'b0; y = 1'b1;
			#1 z = 1'b1; y = 1'b1;
			#1 z = 1'b0; y = 1'b0; x = 1'b1;
			#1 z = 1'b1; y = 1'b0; x = 1'b1;
			#1 z = 1'b0; y = 1'b1; x = 1'b1;
			#1 z = 1'b1; y = 1'b1; x = 1'b1;

			// G0104d
			#15 $display ("\nG0104d -\n");
			
			// Definir valores iniciais
			#1 z = 1'b0; y = 1'b0; x = 1'b0;

			$monitor ("%b %b %b = %b", x, y, z, d);
			#1 z = 1'b1;
			#1 z = 1'b0; y = 1'b1;
			#1 z = 1'b1; y = 1'b1;
			#1 z = 1'b0; y = 1'b0; x = 1'b1;
			#1 z = 1'b1; y = 1'b0; x = 1'b1;
			#1 z = 1'b0; y = 1'b1; x = 1'b1;
			#1 z = 1'b1; y = 1'b1; x = 1'b1;
		
			// G0104e
			#15 $display ("\nG0104e -\n");
			
			// Definir valores iniciais
			#1 z = 1'b0; y = 1'b0; x = 1'b0;

			$monitor ("%b %b %b = %b", x, y, z, e);
			#1 z = 1'b1;
			#1 z = 1'b0; y = 1'b1;
			#1 z = 1'b1; y = 1'b1;
			#1 z = 1'b0; y = 1'b0; x = 1'b1;
			#1 z = 1'b1; y = 1'b0; x = 1'b1;
			#1 z = 1'b0; y = 1'b1; x = 1'b1;
			#1 z = 1'b1; y = 1'b1; x = 1'b1;

		end	// main

endmodule // G0401
