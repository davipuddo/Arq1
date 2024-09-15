// 853355 Davi Puddo

module f1 (output r, input x,y, key);

	wire o1b;		  //  or buffer 1
	wire o2b;   	//      ==    2
	wire a1b;			//      ==    3
	wire nob;     // nor buffer
	wire not_key;
	not  NOT1  (not_key, key);
	or    OR1  (a1b, x,y);
	nor  NOR1  (nab, x,y);
	and  AND2  (a2b, a1b, not_key);
	and  AND3  (a3b, nab, key);
	or   OR2   (r, a2b, a3b);

endmodule // f1

module G0702;

// Define data
	reg x = 1'b0;
	reg y = 1'b0;
	reg key = 1'b0;
	wire r;

	f1 F1 (r, x,y,key);

	initial
		begin : main

			$display ("\nG0701 -\n");
			
			$display ("key = 0 | or");
			$monitor ("%b | %b %b | %b",key, x,y, r);
			#1 y = 1'b1;
			#1 x = 1'b1; y = 1'b0;
			#1 x = 1'b1; y = 1'b1;
			#1 $display ("\nkey = 1 | nor");
			#1 key = 1'b1; x = 1'b0; y = 1'b0;
		  #1 key = 1'b1; x = 1'b0; y = 1'b1;
			#1 key = 1'b1; x = 1'b1; y = 1'b0;
			#1 key = 1'b1; x = 1'b1; y = 1'b1;

		end // main

endmodule // G0702
