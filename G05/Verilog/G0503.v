// 853355 Davi Puddo

module F3 (output r, input x,y);

	wire not_x;
	nor NOR1 (not_x, x,x);
	nor NOR2 (r, not_x,y);
	
endmodule // F3

module F3N (output r, input x,y);

	assign r = ~(~x|y);	// == (x & ~y)

endmodule // F3N

module G0503;

	// Define data
	reg x = 1'b0;
	reg y = 1'b0;
	wire r1;
	wire r2;

	F3  f3  (r1, x,y);
	F3N f3n (r2, x,y);

	// Actions
	initial 
		begin : main

			$display ("\nG0503 -\n");
			
			$monitor ("%b %b | %b %b", x,y, r1,r2);
			#1 y = 1'b1;
			#1 x = 1'b1; y = 1'b0;
			#1 x = 1'b1; y = 1'b1;

		end // main

endmodule // G0503
