// 853355 Davi Puddo

module f1 (output r, input [0:2] x, y, input key);

	// Operations buffer
	wire [0:2] xor_o;
	wire [0:2] xnor_o;

	// Not key buffer
	wire not_key;

	// AND buffers
	wire [0:5] andk;

	// Result buffers
	wire or_r;
	wire and_r;

	// Circuit

		// Not key
	not (not_key, key);

		// Operations
	xor (xor_o[0], x[0], y[0]);
	xor (xor_o[1], x[1], y[1]);
	xor (xor_o[2], x[2], y[2]);

	xnor (xnor_o[0], x[0], y[0]);
	xnor (xnor_o[1], x[1], y[1]);
	xnor (xnor_o[2], x[2], y[2]);

		// AND Key
	and (andk[0], xor_o[0], not_key);
	and (andk[1], xor_o[1], not_key);
	and (andk[2], xor_o[2], not_key);

	and (andk[3], xnor_o[0], key);
	and (andk[4], xnor_o[1], key);
	and (andk[5], xnor_o[2], key);

		// Join
	or  (or_r, andk[0], andk[1], andk[2]);
	and (and_r, andk[3], andk[4], andk[5]);

	// Result
	or (r, or_r, and_r);

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

			$display ("Diff");
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
			
			#1 $display ("\nEqual");
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
