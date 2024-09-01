// 853355 Davi Puddo

module F1 (output r, input x,y);

	wire nor_y;
	nor NOR1 (nor_y, y, y);
	nor NOR2 (r, x, nor_y);

endmodule // F1

module F1N (output r, input x,y);

	assign r = (~x&y);

endmodule // F1N

module G0501;
	
	// Define data
	reg x = 1'b0;
	reg y = 1'b0;
	wire r1;
	wire r2;
	
	// Calls modules
	F1  F01 (r1, x, y);
	F1N F02 (r2, x, y);
	
	// Actions
	initial
		begin : main

			$display ("\nG0501 -\n");

			$monitor ("%b %b | %b %b", x,y, r1,r2);
			#1 x = 1'b0; y = 1'b1;
			#1 x = 1'b1; y = 1'b0;
			#1 x = 1'b1; y = 1'b1;

		end // main

endmodule // G0501

