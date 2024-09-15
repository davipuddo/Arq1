// 853355 Davi Puddo

module f1 (output r, input x,y, input [0:2] key);

		// Operations
		wire not_x;
		wire not_y;
		wire and_o;
		wire nand_o;
		wire or_o;
		wire nor_o;
		wire xor_o;
		wire xnor_o;

		// Key buffers
		wire [0:2] not_key;

		// AND buffers
		wire [0:7] andk1;			// Could be a matrix
		wire [0:7] andk2;			//				 ==
		wire [0:7] andk3;			//         ==

		// Circuit

			// Not key buffer
		not (not_key[0], key[0]);
		not (not_key[1], key[1]);
		not (not_key[2], key[2]);

			// Operations
		not  (not_x,  x);
		not  (not_y,    y);
		and  (and_o,  x,y);
		nand (nand_o, x,y);
		or   (or_o,   x,y);
		nor  (nor_o,  x,y);
		xor  (xor_o,  x,y);
		xnor (xnor_o, x,y);
			
			// Key 1
		and (andk1[0], not_x,  not_key[0]);
		and (andk1[1], not_y,  not_key[0]);
		and (andk1[2], and_o,  not_key[0]);
		and (andk1[3], nand_o, not_key[0]);
		and (andk1[4], or_o,   key[0]);
		and (andk1[5], nor_o,  key[0]);
		and (andk1[6], xor_o,  key[0]);
		and (andk1[7], xnor_o, key[0]);
			
			// Key 2
		and (andk2[0], andk1[0], not_key[1]); // not_x
		and (andk2[1], andk1[1], not_key[1]); // not_y
		and (andk2[2], andk1[2], key[1]);			// and
		and (andk2[3], andk1[3], key[1]);			// nand
		and (andk2[4], andk1[4], not_key[1]); // or
		and (andk2[5], andk1[5], not_key[1]); // nor
		and (andk2[6], andk1[6], key[1]);			// xor
		and (andk2[7], andk1[7], key[1]);			// xnor

			// Key 3
		and (andk3[0], andk2[0], not_key[2]);	// not_x
		and (andk3[1], andk2[1], key[2]);			// not_y
		and (andk3[2], andk2[2], not_key[2]);	// and
		and (andk3[3], andk2[3], key[2]);			// nand
		and (andk3[4], andk2[4], not_key[2]);	// or
		and (andk3[5], andk2[5], key[2]);			// nor
		and (andk3[6], andk2[6], not_key[2]);	// xor
		and (andk3[7], andk2[7], key[2]);			// xnor
			
		// Result
		or (r, andk3[0],andk3[1],andk3[2],andk3[3],andk3[4],andk3[5],andk3[6],andk3[7]);

endmodule // f1

module G0705;

	// Variables
	reg x = 1'b0;
	reg y = 1'b0;
	reg [0:2] key = 3'b000;
	wire r;
	
	// Call module
	f1 F1 (r, x,y, key[0:2]);

	// Actions
	initial
		begin : main

			$display ("\nG0705 -\n");

			$monitor ("%b | %b %b | %b", key, x,y, r);
		
			// Key = 0
			#1 x = 1'b0; y = 1'b1; key = 3'b000;
			#1 x = 1'b1; y = 1'b0; key = 3'b000;
			#1 x = 1'b1; y = 1'b1; key = 3'b000;
	
			// Key = 1
			#1$display ("");	// Padding
			#1 x = 1'b0; y = 1'b0; key = 3'b001;
			#1 x = 1'b0; y = 1'b1; key = 3'b001;
			#1 x = 1'b1; y = 1'b0; key = 3'b001;
			#1 x = 1'b1; y = 1'b1; key = 3'b001;

			// Key = 2
			#1$display ("");
			#1 x = 1'b0; y = 1'b0; key = 3'b010;
			#1 x = 1'b0; y = 1'b1; key = 3'b010;
			#1 x = 1'b1; y = 1'b0; key = 3'b010;
			#1 x = 1'b1; y = 1'b1; key = 3'b010;

			// Key = 3
			#1$display ("");
			#1 x = 1'b0; y = 1'b0; key = 3'b011;
			#1 x = 1'b0; y = 1'b1; key = 3'b011;
			#1 x = 1'b1; y = 1'b0; key = 3'b011;
			#1 x = 1'b1; y = 1'b1; key = 3'b011;

			// Key = 4
			#1$display ("");
			#1 x = 1'b0; y = 1'b0; key = 3'b100;
			#1 x = 1'b0; y = 1'b1; key = 3'b100;
			#1 x = 1'b1; y = 1'b0; key = 3'b100;
			#1 x = 1'b1; y = 1'b1; key = 3'b100;

			// Key = 5
			#1$display ("");
			#1 x = 1'b0; y = 1'b0; key = 3'b101;
			#1 x = 1'b0; y = 1'b1; key = 3'b101;
			#1 x = 1'b1; y = 1'b0; key = 3'b101;
			#1 x = 1'b1; y = 1'b1; key = 3'b101;

			// Key = 6
			#1$display ("");
			#1 x = 1'b0; y = 1'b0; key = 3'b110;
			#1 x = 1'b0; y = 1'b1; key = 3'b110;
			#1 x = 1'b1; y = 1'b0; key = 3'b110;
			#1 x = 1'b1; y = 1'b1; key = 3'b110;

			// Key = 7
			#1$display ("");
			#1 x = 1'b0; y = 1'b0; key = 3'b111;
			#1 x = 1'b0; y = 1'b1; key = 3'b111;
			#1 x = 1'b1; y = 1'b0; key = 3'b111;
			#1 x = 1'b1; y = 1'b1; key = 3'b111;

		end // main

endmodule // G0705
