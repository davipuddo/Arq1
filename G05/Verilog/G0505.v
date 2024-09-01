// 853355 Davi Puddo

module F5 (output r, input x,y);

	wire buff1;
	wire buff2;
	wire buff5;
	nor NOR1 (buff1, x,y);
	nor NOR2 (buff2, x,buff1);
	nor NOR3 (buff3, y,buff1);
	nor NOR4 (r, buff2,buff3);

endmodule // F5

module F5N (output r, input x,y);
	
	assign r = ~(x^y);	// XNOR

endmodule // F5N

module G0505;

	// Define data
	reg x = 1'b0;
	reg y = 1'b0;
	wire r1;
	wire r2;

	F5  f5  (r1, x,y);
	F5N f5n (r2, x,y);

	// Actions
	initial 
		begin : main

			$display ("\nG0505 -\n");
			
			$monitor ("%b %b | %b %b", x,y, r1,r2);
			#1 y = 1'b1;
			#1 x = 1'b1; y = 1'b0;
			#1 x = 1'b1; y = 1'b1;

		end // main

endmodule // G0505
