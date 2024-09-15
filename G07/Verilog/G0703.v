// 853355 Davi Puddo

module f1 (output r, input x,y, key1, key2);

	wire and_o;		// and operation
	wire nand_o;	// nand operation
	wire or_o;		// or operation
	wire nor_o;		// nor operation

	wire not_key1;
	wire not_key2;

	wire and1k1; 	// and buffer_1 first key
	wire and2k1;	//			==    2
	wire and3k1; 	//      ==    3
	wire and4k1;	//      ==    4

	wire and1k2;	// and buffer_1 seccond key
	wire and2k2;	//			==    2
	wire and3k3;	//			==    3
	wire and4k4;	//			==    4

	not NOT1 (not_key1, key1);
	not NOT2 (not_key2, key2);
	
	// Operation results
	and  ANDO  (and_o, x,y);
	nand NANDO (nand_o, x,y);
	or   ORO   (or_o, x,y);
	nor  NORO  (nor_o, x,y);

	// Check key 1
	and AND1K1 (and1k1, and_o,  not_key1);
	and AND2K1 (and2k1, nand_o, not_key1);
	and AND3K1 (and3k1, or_o,   key1);
	and AND4K1 (and4k1, nor_o,  key1);

	// Check key 2
	and AND1K2 (and1k2, and1k1, not_key2);	// and
	and AND2K2 (and2k2, and2k1, key2);			// nand
	and AND3K2 (and3k2, and3k1, not_key2);  // or
	and AND4K2 (and4k2, and4k1, key2);  		// nor

	// Result
	or (r, and1k2, and2k2, and3k2, and4k2);

endmodule // f1

module G0703;

	// Variables
	reg x = 1'b0;
	reg y = 1'b0;
	reg key1 = 1'b0;
	reg key2 = 1'b0;
	wire r;

	f1 F1 (r, x,y, key1, key2);

	// Actions
	initial
		begin : main

			$display ("\nG0703 -\n");

			$display ("k1 = 0 k2 = 0 | and");
			$monitor ("%b %b | %b %b | %b",key1,key2, x,y, r);

			// key 1 & 2 = 0	
      #1 y = 1'b1;
      #1 x = 1'b1; y = 1'b0;
			#1 x = 1'b1; y = 1'b1;

			// key 1 = 0 // key 2 = 1 
			#1 $display ("\nk1 = 0 k2 = 1 | nand"); 
			#1 key1 = 1'b0; key2 = 1'b1; x = 1'b0; y = 1'b0;
      #1 key1 = 1'b0; key2 = 1'b1; x = 1'b0; y = 1'b1;
			#1 key1 = 1'b0; key2 = 1'b1; x = 1'b1; y = 1'b0;
			#1 key1 = 1'b0; key2 = 1'b1; x = 1'b1; y = 1'b1;

			// key 1 = 1 // key 2 = 0
			#1 $display ("\nk1 = 1 k2 = 0 | or"); 
      #1 key1 = 1'b1; key2 = 1'b0; x = 1'b0; y = 1'b0;
			#1 key1 = 1'b1; key2 = 1'b0; x = 1'b0; y = 1'b1;
			#1 key1 = 1'b1; key2 = 1'b0; x = 1'b1; y = 1'b0;
			#1 key1 = 1'b1; key2 = 1'b0; x = 1'b1; y = 1'b1;

			// key 1 & 2 = 1
			#1 $display ("\nk1 = 1 k2 = 1 | nor"); 
			#1 key1 = 1'b1; key2 = 1'b1; x = 1'b0; y = 1'b0;
      #1 key1 = 1'b1; key2 = 1'b1; x = 1'b0; y = 1'b1;
			#1 key1 = 1'b1; key2 = 1'b1; x = 1'b1; y = 1'b0;
			#1 key1 = 1'b1; key2 = 1'b1; x = 1'b1; y = 1'b1;

		end // main

endmodule // G0703
