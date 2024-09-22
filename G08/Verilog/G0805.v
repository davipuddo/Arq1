// 853355 Davi Puddo

module half (output s0, s1, input a, b);

	xor (s0, a, b);
	and (s1, a, b);

endmodule // half

module c2 (output [6:0] r, input [5:0] x);

	wire [5:0] not_x;
	wire [5:0][1:0] buffer;

	not (not_x[0], x[0]);
	not (not_x[1], x[1]);
	not (not_x[2], x[2]);
	not (not_x[3], x[3]);
	not (not_x[4], x[4]);	
	not (not_x[5], x[5]);

	half H0 (buffer[0][0], buffer[0][1], not_x[0], 1'b1);
	half H1 (buffer[1][0], buffer[1][1], not_x[1], buffer[0][1]);
	half H2 (buffer[2][0], buffer[2][1], not_x[2], buffer[1][1]);
	half H3 (buffer[3][0], buffer[3][1], not_x[3], buffer[2][1]);
	half H4 (buffer[4][0], buffer[4][1], not_x[4], buffer[3][1]);
	half H5 (buffer[5][0], buffer[5][1], not_x[5], buffer[4][1]);

	// Assign values
	buf (r[0], buffer[0][0]);
	buf (r[1], buffer[1][0]);
	buf (r[2], buffer[2][0]);
	buf (r[3], buffer[3][0]);
	buf (r[4], buffer[4][0]);
	buf (r[5], buffer[5][0]);
	buf (r[6], buffer[5][1]);

endmodule // C2

module G0805;

	// Variables
	reg [5:0] x = 6'b00_0000;
	wire [6:0] r;

	// Call module
	c2 C02 (r, x);

	// Display
	initial
		begin : main

			$display ("\nG0805 -\n");

			$monitor ("%b | %b", x, r);
			#1 x = 6'b00_1100;
			#1 x = 6'b11_0000;
			#1 x = 6'b00_0111;
			#1 x = 6'b10_1100;
			#1 x = 6'b11_0110;
			#1 x = 6'b01_0011;
			#1 x = 6'b10_1001;
			#1 x = 6'b00_1101;
			#1 x = 6'b01_1110;
			#1 x = 6'b10_1111;

		end // main

endmodule // G0805
