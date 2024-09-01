// 853355 Davi Puddo

module F4 (output r, input x,y);

	wire not_x;
	nand NAND1 (not_x, x,x);
	nand NAND2 (r, not_x,y);

endmodule // F4

module F4N (output r, input x,y);

	assign r = ~(~x&y);	// == (x|~y)

endmodule // F4N

module G0504;

	// Define data
	reg x = 1'b0;
	reg y = 1'b0;
	wire r1;
	wire r2;

	F4  f4  (r1, x,y);
	F4N f4n (r2, x,y);

	// Actions
	initial 
		begin : main

			$display ("\nG0504 -\n");
			
			$monitor ("%b %b | %b %b", x,y, r1,r2);
			#1 y = 1'b1;
			#1 x = 1'b1; y = 1'b0;
			#1 x = 1'b1; y = 1'b1;

		end // main

endmodule // G0504
