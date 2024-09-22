// 853355 Davi Puddo

// Half adder
module half (output s0, s1, input a,b);

	xor (s0, a,b);
	and (s1, a,b);

endmodule // half

module full (output [4:0] r, input [3:0] a,b);

	// half adders buffers
 	wire [3:0][1:0] buffer0;
	wire [2:0][1:0] buffer1;
	wire [2:0][1:0] buffer2;
	wire [1:0][1:0] buffer3;
	wire [1:0] buffer4;

	// First half adders
 	half H00 (buffer0[0][0], buffer0[0][1], a[0], b[0]);
 	half H01 (buffer0[1][0], buffer0[1][1], a[1], b[1]);
	half H02 (buffer0[2][0], buffer0[2][1], a[2], b[2]);
	half H03 (buffer0[3][0], buffer0[3][1], a[3], b[3]);

	// Seccond half adders
	half H10 (buffer1[0][0], buffer1[0][1], buffer0[0][1], buffer0[1][0]);
	half H11 (buffer1[1][0], buffer1[1][1], buffer0[1][1], buffer0[2][0]);
	half H12 (buffer1[2][0], buffer1[2][1], buffer0[2][1], buffer0[3][0]);

	// Third half adders
	half H20 (buffer2[0][0], buffer2[0][1], buffer1[0][1], buffer1[1][0]);
	half H21 (buffer2[1][0], buffer2[1][1], buffer1[1][1], buffer1[2][0]);
	half H22 (buffer2[2][0], buffer2[2][1], buffer1[2][1], buffer0[3][1]);

	// Fouth half adders
	half H30 (buffer3[0][0], buffer3[0][1], buffer2[0][1], buffer2[1][0]);
	half H31 (buffer3[1][0], buffer3[1][1], buffer2[1][1], buffer2[2][0]);

	// Fifth half adders
	half H40 (buffer4[0], buffer4[1], buffer3[0][1], buffer3[1][0]);

	// Assign values
	buf (r[0], buffer0[0][0]);
	buf (r[1], buffer1[0][0]);
	buf (r[2], buffer2[0][0]);
	buf (r[3], buffer3[0][0]);
	buf (r[4], buffer4[0]);

endmodule // full

module G0801;

	// Variables
	reg [3:0] a = 3'b000;
	reg [3:0] b = 3'b000;
	wire [4:0] r;

	// Call module
	full F01 (r, a,b);

	// Display
	initial
		begin : main

			$display ("\nG0801 -\n");
			$monitor ("%b %b | %b", a, b, r);
			#1 a = 3'b000; b = 3'b001;
			#1 a = 3'b001; b = 3'b000; 
			#1 a = 3'b001; b = 3'b001;
			#1 a = 3'b011; b = 3'b011;
			#1 a = 3'b011; b = 3'b100;
			#1 a = 3'b101; b = 3'b011;
			#1 a = 3'b110; b = 3'b010;
			#1 a = 3'b100; b = 3'b100;
			#1 a = 3'b111; b = 3'b001;
			#1 a = 3'b011; b = 3'b010;
			#1 a = 3'b101; b = 3'b110;
			#1 a = 3'b111; b = 3'b101;
			#1 a = 3'b101; b = 3'b101;
			#1 a = 3'b110; b = 3'b111;
			#1 a = 3'b111; b = 3'b111;

		end // main

endmodule // G0801
