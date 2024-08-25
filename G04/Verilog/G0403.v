// 853355 Davi Puddo

// Operacoes
module f1a (output a, input x,y,z);

	assign a = ( (~x&~y&z) | (x&~y&z) | (x&y&~z) | (x&y&z) );

endmodule // f1a

module f1b (output b, input x,y,z);

	assign b = ( (~x&y&~z) | (x&~y&z) | (x&y&~z) | (x&y&z) );

endmodule // f1b

module f1c (output c, input x,y,z,w);

	assign c = ( (~x&~y&~z&w) | (~x&~y&z&~w) | (~x&~y&z&w) | (~x&y&z&~w) | (~x&y&z&w) | (x&~y&z&w) | (x&y&z&w) );

endmodule	// f1c

module f1d (output d, input x,y,z,w);

	assign d = ( (~x&~y&~z&w) | (~x&~y&z&~w) | (~x&y&z&~w) | (x&~y&~z&~w) | (x&~y&z&~w) | (x&y&~z&~w) | (x&y&z&~w) );

endmodule // f1d

module f1e (output e, input x,y,z,w);

	assign e = ( (~x&~y&~z&~w) | (~x&~y&z&~w	) | (~x&y&~z&w) | (~x&y&z&w) | (x&~y&~z&~w) | (x&~y&z&w) );

endmodule // f1e

// Acoes
module G0403;

	// Definir dados
	reg x,y,z,w;
	wire a,b,c,d,e;

	// Operacoes
	f1a F1a (a, x,y,z);
	f1b F1b (b, x,y,z);
	f1c F1c (c, x,y,z,w);
	f1d F1d (d, x,y,z,w);
	f1e F1e (e, x,y,z,w);

	// Definir valores iniciais
	initial
		begin
	
			x = 1'b0;
			y = 1'b0;
			z = 1'b0;
			w = 1'b0;

		end

	initial
		begin : main

			$display ("\nG0403a -\n");

			$monitor ("%b %b %b = %b", x, y, z, a);
			#1 z = 1'b0;
			#1 z = 1'b1; 
			#1 z = 1'b0; y = 1'b1;
			#1 z = 1'b1; y = 1'b1;
			#1 z = 1'b0; y = 1'b0; x = 1'b1;
			#1 z = 1'b1; y = 1'b0; x = 1'b1;
			#1 z = 1'b0; y = 1'b1; x = 1'b1;
			#1 z = 1'b1; y = 1'b1; x = 1'b1;

			#15 $display ("\nG0403b -\n");

			#1 x = 1'b0; y = 1'b0; z = 1'b0;

			$monitor ("%b %b %b = %b", x, y, z, b);
			#1 z = 1'b0;
			#1 z = 1'b1; 
			#1 z = 1'b0; y = 1'b1;
			#1 z = 1'b1; y = 1'b1;
			#1 z = 1'b0; y = 1'b0; x = 1'b1;
			#1 z = 1'b1; y = 1'b0; x = 1'b1;
			#1 z = 1'b0; y = 1'b1; x = 1'b1;
			#1 z = 1'b1; y = 1'b1; x = 1'b1;

			#15 $display ("\nG0403c -\n");

			#1 x = 1'b0; y = 1'b0; z = 1'b0;

			$monitor ("%b %b %b %b = %b", x, y, z, w, c);
			#1 w = 1'b0;
			#1 w = 1'b1; 
			#1 w = 1'b0; z = 1'b1;
			#1 w = 1'b1; z = 1'b1;
			#1 w = 1'b0; z = 1'b0; y = 1'b1;
			#1 w = 1'b1; z = 1'b0; y = 1'b1;
			#1 w = 1'b0; z = 1'b1; y = 1'b1;
			#1 w = 1'b1; z = 1'b1; y = 1'b1;
			#1 w = 1'b0; z = 1'b0; y = 1'b0; x = 1'b1;
			#1 w = 1'b1; z = 1'b0; y = 1'b0; x = 1'b1;
			#1 w = 1'b0; z = 1'b1; y = 1'b0; x = 1'b1;
			#1 w = 1'b1; z = 1'b1; y = 1'b0; x = 1'b1;
			#1 w = 1'b0; z = 1'b0; y = 1'b1; x = 1'b1;
			#1 w = 1'b1; z = 1'b0; y = 1'b1; x = 1'b1;
			#1 w = 1'b0; z = 1'b1; y = 1'b1; x = 1'b1;
			#1 w = 1'b1; z = 1'b1; y = 1'b1; x = 1'b1;

			#15 $display ("\nG0403d -\n");

			#1 x = 1'b0; y = 1'b0; z = 1'b0; w = 1'b0;

			$monitor ("%b %b %b %b = %b", x, y, z, w, d);
			#1 w = 1'b0;
			#1 w = 1'b1; 
			#1 w = 1'b0; z = 1'b1;
			#1 w = 1'b1; z = 1'b1;
			#1 w = 1'b0; z = 1'b0; y = 1'b1;
			#1 w = 1'b1; z = 1'b0; y = 1'b1;
			#1 w = 1'b0; z = 1'b1; y = 1'b1;
			#1 w = 1'b1; z = 1'b1; y = 1'b1;
			#1 w = 1'b0; z = 1'b0; y = 1'b0; x = 1'b1;
			#1 w = 1'b1; z = 1'b0; y = 1'b0; x = 1'b1;
			#1 w = 1'b0; z = 1'b1; y = 1'b0; x = 1'b1;
			#1 w = 1'b1; z = 1'b1; y = 1'b0; x = 1'b1;
			#1 w = 1'b0; z = 1'b0; y = 1'b1; x = 1'b1;
			#1 w = 1'b1; z = 1'b0; y = 1'b1; x = 1'b1;
			#1 w = 1'b0; z = 1'b1; y = 1'b1; x = 1'b1;
			#1 w = 1'b1; z = 1'b1; y = 1'b1; x = 1'b1;

			#15 $display ("\nG0403e -\n");

			#1 x = 1'b0; y = 1'b0; z = 1'b0; w = 1'b0;

			$monitor ("%b %b %b %b = %b", x, y, z, w, e);
			#1 w = 1'b0;
			#1 w = 1'b1; 
			#1 w = 1'b0; z = 1'b1;
			#1 w = 1'b1; z = 1'b1;
			#1 w = 1'b0; z = 1'b0; y = 1'b1;
			#1 w = 1'b1; z = 1'b0; y = 1'b1;
			#1 w = 1'b0; z = 1'b1; y = 1'b1;
			#1 w = 1'b1; z = 1'b1; y = 1'b1;
			#1 w = 1'b0; z = 1'b0; y = 1'b0; x = 1'b1;
			#1 w = 1'b1; z = 1'b0; y = 1'b0; x = 1'b1;
			#1 w = 1'b0; z = 1'b1; y = 1'b0; x = 1'b1;
			#1 w = 1'b1; z = 1'b1; y = 1'b0; x = 1'b1;
			#1 w = 1'b0; z = 1'b0; y = 1'b1; x = 1'b1;
			#1 w = 1'b1; z = 1'b0; y = 1'b1; x = 1'b1;
			#1 w = 1'b0; z = 1'b1; y = 1'b1; x = 1'b1;
			#1 w = 1'b1; z = 1'b1; y = 1'b1; x = 1'b1;
		end // main

endmodule // G0403
