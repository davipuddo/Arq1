// 853355 Davi Puddo

module equal (output r, input [3:0] a, input [3:0] b);

	wire [3:0] buffer;

	xnor (buffer[0], a[0], b[0]);
	xnor (buffer[1], a[1], b[1]);
	xnor (buffer[2], a[2], b[2]);
	xnor (buffer[3], a[3], b[3]);

	and (r, buffer[0], buffer[1], buffer[2], buffer[3]);

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

			$display ("\nG0803 -\n");

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
