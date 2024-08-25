// 853355 Davi Puddo

// Operacoes
module f1a (output a1, a2, input x,y);

	assign a1 = (x & ~(~x|y));
	assign a2 = (x & ~y);			// Simplificado

endmodule // f1a

module f1b (output b1, b2, input x,y);

	assign b1 = ( (~x|y) | (~x&y) );
	assign b2 = (~x | y);			// Simplificado

endmodule // f1b

module f1c (output c1, c2, input x,y);

	assign c1 = ( ~(~x&~y) & (x & y) );
	assign c2 = (x & y);			// Simplificado

endmodule // f1c

module f1d (output d1, d2, input x,y);

	assign d1 = ( ~(~x&y) | ~(~x|y) );
	assign d2 = (x | ~y);			// Simplificado

endmodule // f1d

module f1e (output e1, e2, input x,y);
	
	assign e1 = ( (y|~x) & ~(~y|x) );
	assign e2 = (y & ~x);

endmodule // f1e

module G0402;

	// Definir dados
	reg x, y;
	wire a1, a2;			// Resultados
	wire b1, b2;			//     ==
	wire c1, c2;			//		 ==
	wire d1, d2;			//		 ==
	wire e1, e2;			//	   ==

	// Operacoes
	f1a F1a (a1,a2, x,y);
	f1b F1b (b1,b2, x,y);
	f1c F1c (c1,c2, x,y);
	f1d F1d (d1,d2, x,y);
	f1e F1e (e1,e2, x,y);

	// Definir valores inicias
	initial
		begin
			
			x = 1'b0;
			y = 1'b0;

		end
	
	// Acoes
	initial
		begin : main
			
			// G0402a
			$display ("\nG0402a -\n\n(x & ~(~x|y)) ==\t(x & ~y)\n");

			$monitor ("%b %b = %b \t\t %b %b = %b", x, y, a1, x, y, a2);
			#1 y = 1'b1;
			#1 y = 1'b0; x = 1'b1;
			#1 y = 1'b1; x = 1'b1;

			// G0402b
			#15 $display ("\nG0402b -\n\n((~x|y) | (~x&y)) ==\t(~x | y)\n");
			
			#1 y = 1'b0; x = 1'b0;

			$monitor ("%b %b = %b \t\t %b %b = %b", x, y, b1, x, y, b2);
			#1 y = 1'b1;
			#1 y = 1'b0; x = 1'b1;
			#1 y = 1'b1; x = 1'b1;
			
			// G0402c
			#15 $display ("\nG0402c -\n\n(~(~x&~y) & (x&y)) ==\t(x & y)\n");
			
			#1 y = 1'b0; x = 1'b0;

			$monitor ("%b %b = %b \t\t %b %b = %b", x, y, c1, x, y, c2);
			#1 y = 1'b1;
			#1 y = 1'b0; x = 1'b1;
			#1 y = 1'b1; x = 1'b1;
			
			// G0402d
			#15 $display ("\nG0402d -\n\n(~(~x&y) | ~(x|y)) ==\t(x | ~y)\n");
			
			#1 y = 1'b0; x = 1'b0;

			$monitor ("%b %b = %b \t\t %b %b = %b", x, y, d1, x, y, d2);
			#1 y = 1'b1;
			#1 y = 1'b0; x = 1'b1;
			#1 y = 1'b1; x = 1'b1;

			// G0402e
			#15 $display ("\nG0402e -\n\n((y|~x) & ~(~y|x)) ==\t(y&~x)\n");
			
			#1 y = 1'b0; x = 1'b0;

			$monitor ("%b %b = %b \t\t %b %b = %b", x, y, b1, x, y, b2);
			#1 y = 1'b1;
			#1 y = 1'b0; x = 1'b1;
			#1 y = 1'b1; x = 1'b1;
				
		end // main

endmodule // G0402
