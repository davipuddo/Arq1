// 853355 Davi Puddo

module F8 (output r, input x,y);

	wire buff;
	nand NAND1 (buff, x,y);
	nand NAND2 (r, buff,buff);

endmodule // F8

module F8N (output r, input x,y);
	
	assign r = ~(~x|~y);	// == (x & y)

endmodule // F8N

module G0508;

	// Define data
	reg x = 1'b0;
	reg y = 1'b0;
	wire r1;
	wire r2;

	F8  f8  (r1, x,y);
	F8N f8n (r2, x,y);

	// Actions
	initial 
		begin : main

			$display ("\nG0508 -\n");
			
			$monitor ("%b %b | %b %b", x,y, r1,r2);
			#1 y = 1'b1;
			#1 x = 1'b1; y = 1'b0;
			#1 x = 1'b1; y = 1'b1;

		end // main

endmodule // G0508
