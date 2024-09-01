// 853355 Davi Puddo

module F7 (output r, input x,y);

	wire buff1;
	wire buff2;
	wire buff3;
	wire buff4;
	nor NOR1 (buff1, x,y);
	nor NOR2 (buff2, x,buff1);
	nor NOR3 (buff3, y,buff1);
	nor NOR4 (buff4, buff2,buff3);
	nor NOR5 (r, buff4, buff4);

endmodule // F7

module F7N (output r, input x,y);
	
	assign r = (~x^~y);	// XOR

endmodule // F7N

module G0507;

	// Define data
	reg x = 1'b0;
	reg y = 1'b0;
	wire r1;
	wire r2;

	F7  f7  (r1, x,y);
	F7N f7n (r2, x,y);

	// Actions
	initial 
		begin : main

			$display ("\nG0507 -\n");
			
			$monitor ("%b %b | %b %b", x,y, r1,r2);
			#1 y = 1'b1;
			#1 x = 1'b1; y = 1'b0;
			#1 x = 1'b1; y = 1'b1;

		end // main

endmodule // G0507
