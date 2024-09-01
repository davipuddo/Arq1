// 853355 Davi Puddo

module F2 (output r, input x,y);

	wire not_x;
	nand NAND1 (not_x, x,x);
	nand NAND2 (r, y,not_x);

endmodule // F2

module F2N (output r, input x,y);

	assign r = (x|~y);

endmodule // F2N

module G0502;

	// Define data
	reg x = 1'b0;
	reg y = 1'b0; 
	wire r1;
	wire r2;

	F2  f2  (r1, x,y);
	F2N	f2n (r2, x,y);
	
	// Actions
	initial
		begin : main

			$display ("\nG0502 -\n");

			$monitor ("%b %b | %b %b", x,y, r1,r2);
			#1 y = 1'b1;
			#1 x = 1'b1; y = 1'b0;
			#1 x = 1'b1; y = 1'b1;

		end	// main

endmodule // G0502
