// 853355 Davi Puddo

module f1 (output r, input x,y, input [0:1] key);

	wire or_o;		// or operation
	wire nor_o;		// nor operation
	wire xor_o;		// xor operation
	wire xnor_o;	// xnor operation

	wire not_key[0:1];

	wire and1k1; 	// and buffer_1 first key
	wire and2k1;	//			==    2
	wire and3k1; 	//      ==    3
	wire and4k1;	//      ==    4

	wire and1k2;	// and buffer_1 seccond key
	wire and2k2;	//			==    2
	wire and3k3;	//			==    3
	wire and4k4;	//			==    4

	not  NOT1  (not_key[0], key[0]);
	not  NOT2  (not_key[1], key[1]);
	
	// Operation results
	or   ORO   (or_o,   x,y);
	nor  NORO  (nor_o,  x,y);
	xor  XORO  (xor_o,  x,y);
	xnor XNORO (xnor_o, x,y);

	// Check key 1
	and AND1K1 (and1k1, or_o,   not_key[0]);
	and AND2K1 (and2k1, nor_o,  not_key[0]);
	and AND3K1 (and3k1, xor_o,  key[0]);
	and AND4K1 (and4k1, xnor_o, key[0]);

	// Check key 2
	and AND1K2 (and1k2, and1k1, not_key[1]);	// or
	and AND2K2 (and2k2, and2k1, key[1]);			// nor
	and AND3K2 (and3k2, and3k1, not_key[1]);  // xor
	and AND4K2 (and4k2, and4k1, key[1]);  		// xnor

	// Result
	or (r, and1k2, and2k2, and3k2, and4k2);

endmodule // f1

module G0704;

	// Variables
	reg x = 1'b0;
	reg y = 1'b0;
	reg [0:1] key = 2'b00;
	wire r;

	f1 F1 (r, x,y, key[0:1]);

	// Actions
	initial
		begin : main

			$display ("\nG0704 -\n");

			$display ("or");
			$monitor ("%b | %b %b | %b",key, x,y, r);

			// key = 00	
      #1 y = 1'b1;
      #1 x = 1'b1; y = 1'b0;
			#1 x = 1'b1; y = 1'b1;

			// key = 01
			#1 $display ("\nnor"); 
			#1 key = 2'b01; x = 1'b0; y = 1'b0;
      #1 key = 2'b01; x = 1'b0; y = 1'b1;
			#1 key = 2'b01; x = 1'b1; y = 1'b0;
			#1 key = 2'b01; x = 1'b1; y = 1'b1;

			// key = 10
			#1 $display ("\nxor"); 
      #1 key = 2'b10; x = 1'b0; y = 1'b0;
			#1 key = 2'b10; x = 1'b0; y = 1'b1;
			#1 key = 2'b10; x = 1'b1; y = 1'b0;
			#1 key = 2'b10; x = 1'b1; y = 1'b1;

			// key = 11
			#1 $display ("\nxnor"); 
			#1 key = 2'b11; x = 1'b0; y = 1'b0;
      #1 key = 2'b11; x = 1'b0; y = 1'b1;
			#1 key = 2'b11; x = 1'b1; y = 1'b0;
			#1 key = 2'b11; x = 1'b1; y = 1'b1;

		end // main

endmodule // G0704
