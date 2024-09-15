// 853355 Davi Puddo

// Key operation
module f1 (output r, input x,y, key);

	wire a1b;		  // and buffer 1
	wire a2b;   	//      ==    2
	wire a3b;			//      ==    3
	wire nab;     // nand buffer
	wire not_key;
	not  NOT1  (not_key, key);
	and  AND1  (a1b, x,y);
	nand NAND1 (nab, x,y);
	and  AND2  (a2b, a1b, not_key);
	and  AND3  (a3b, nab, key);
	or   OR1   (r, a2b, a3b);

endmodule // f1

// Normal operation
module f2 (output r1, r2, input x,y);

	and AND1 (r1, x,y);
	nand NAND1 (r2,x,y);

endmodule // f2

module G0701;

	// Define data
	reg x = 1'b0;
	reg y = 1'b0;
	reg key = 1'b0;
	wire r;
	wire r1;
	wire r2;

	f1 F1 (r, x,y,key);
	f2 F2 (r1,r2, x,y);

	initial
		begin : main

			$display ("\nkey = 0 | and");
		
			$monitor ("%b | %b %b | %b",key, x,y, r);
			#1 x = 1'b0; y = 1'b0;
			#1 x = 1'b0; y = 1'b1;
			#1 x = 1'b1; y = 1'b0;
			#1 x = 1'b1; y = 1'b1;
			#1 $display ("\nkey = 1 | nand\n");
			#1 key = 1'b1; x = 1'b0; y = 1'b0;
		  #1 key = 1'b1; x = 1'b0; y = 1'b1;
			#1 key = 1'b1; x = 1'b1; y = 1'b0;
			#1 key = 1'b1; x = 1'b1; y = 1'b1;

		end // main

endmodule // G0701

module G0701b;

	// Define data
	reg x = 1'b0;
	reg y = 1'b0;
	wire r1;
	wire r2;

	f2 F2 (r1,r2, x,y);

	initial
		begin : main
	
			#25 $display ("\n    |and/nand");
			$monitor ("%b %b | %b %b", x,y, r1,r2);
			#1 y = 1'b1;
			#1 x = 1'b1; y = 1'b0;
			#1 x = 1'b1; y = 1'b1;

		end // main

endmodule // G0701b
