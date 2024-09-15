// 853355 Davi Puddo

module f1 (output r, input [0:2] x, y, input key);

	// Operations buffer
	wire [0:2] xor_o;

	// NOT buffers
	wire not_key;
	wire not_xor;

	// AND buffers
	wire [0:1] andk;

	// Result buffers
	wire or_r;

	// Circuit

		// NOT key
	not (not_key, key);

		// Operations
	xor (xor_o[0], x[0], y[0]);
	xor (xor_o[1], x[1], y[1]);
	xor (xor_o[2], x[2], y[2]);

		// Join
	or  (or_r, xor_o[0], xor_o[1], xor_o[2]);

		// Invert result
	not (not_xor, or_r);

		// Selector
	and (andk[0], or_r, key);
	and (andk[1], not_xor, not_key);

	// Result
	or (r, andk[0], andk[1]);

endmodule // f1

module G0706;

	// Variables
	reg [0:2] x = 3'b000;
	reg [0:2] y = 3'b000;
	reg key = 1'b0;
	wire r;

	// Call module
	f1 F1 (r, x, y, key);

	// Actions
	initial
		begin : main

			$display ("\nG0706 -\n");

			$display ("Equal");
			$monitor ("%b | %b %b | %b",key, x,y, r);	
			#1 x = 3'b000; y = 3'b000; key = 1'b0;
			#1 x = 3'b000; y = 3'b001; key = 1'b0;
			#1 x = 3'b001; y = 3'b000; key = 1'b0;
			#1 x = 3'b001; y = 3'b001; key = 1'b0;
			#1 x = 3'b101; y = 3'b101; key = 1'b0;
			#1 x = 3'b110; y = 3'b100; key = 1'b0;
			#1 x = 3'b111; y = 3'b001; key = 1'b0;	
			#1 x = 3'b101; y = 3'b111; key = 1'b0;
			#1 x = 3'b111; y = 3'b111; key = 1'b0;
			
			#1 $display ("\nDiff");
			#1 x = 3'b000; y = 3'b000; key = 1'b1;
			#1 x = 3'b000; y = 3'b001; key = 1'b1;
			#1 x = 3'b001; y = 3'b000; key = 1'b1;
			#1 x = 3'b001; y = 3'b001; key = 1'b1;
			#1 x = 3'b101; y = 3'b101; key = 1'b1;
			#1 x = 3'b110; y = 3'b100; key = 1'b1;
			#1 x = 3'b111; y = 3'b001; key = 1'b1;	
			#1 x = 3'b101; y = 3'b111; key = 1'b1;
			#1 x = 3'b111; y = 3'b111; key = 1'b1;	

		end // main

endmodule // G0706
