// 853355 Davi Puddo

module equal (output r, input [3:0] a, input [3:0] b);

	wire [3:0] buffer;

	xor (buffer[0], a[0], b[0]);
	xor (buffer[1], a[1], b[1]);
	xor (buffer[2], a[2], b[2]);
	xor (buffer[3], a[3], b[3]);

	or (r, buffer[0], buffer[1], buffer[2], buffer[3]);

endmodule // equal

module G0803;

	// Variables
	reg [3:0] a = 3'b000;
	reg [3:0] b = 3'b000;
	wire r;

	// Call module
	equal EQ0 (r, a, b);

	// Display
	initial
		begin : main

			$display ("\nG0804 -\n");

			$monitor ("%b %b | %b", a,b,r);
			#1 a = 3'b000; b = 3'b001;
			#1 a = 3'b001; b = 3'b000;
			#1 a = 3'b001; b = 3'b001;
			#1 a = 3'b101; b = 3'b100;
			#1 a = 3'b110; b = 3'b110;
			#1 a = 3'b111; b = 3'b011;
			#1 a = 3'b111; b = 3'b111;
			#1 a = 3'b100; b = 3'b001;
			#1 a = 3'b100; b = 3'b100;

		end // main

endmodule // G0803
