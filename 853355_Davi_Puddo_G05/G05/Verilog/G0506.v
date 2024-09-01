// 853355 Davi Puddo

module F6 (output r, input x,y);

	wire buff1;
	wire buff2;
	wire buff3;
	nand NAND1 (buff1, x,y);
	nand NAND2 (buff2, x,buff1);
	nand NAND3 (buff3, y,buff1);
	nand NAND4 (r, buff2,buff3);

endmodule // F6

module F6N (output r, input x,y);
	
	assign r = (x^y);	// XOR

endmodule // F6N

module G0506;

	// Define data
	reg x = 1'b0;
	reg y = 1'b0;
	wire r1;
	wire r2;

	F6  f6  (r1, x,y);
	F6N f6n (r2, x,y);

	// Actions
	initial 
		begin : main

			$display ("\nG0506 -\n");
			
			$monitor ("%b %b | %b %b", x,y, r1,r2);
			#1 y = 1'b1;
			#1 x = 1'b1; y = 1'b0;
			#1 x = 1'b1; y = 1'b1;

		end // main

endmodule // G0506
