// 853355 Davi Puddo

module f1 (output r, input x,y,z);

	assign r = ~z|(~x&y); // (~x|~z)&(x|y|~z)

endmodule // f1

module f2 (output r, input x,y,z);

	assign r = z|(~x&y); // (~x|z)&(x|y|z)

endmodule // f2

module f3 (output r, input x,y,z);

	assign r = (~z|y)&(x|~y);

endmodule // f3

module f4 (output r, input x,y,z);

	assign r = (y~^~z);

endmodule // f4

module f5 (output r, input x,y,z);

	assign r = (~y);

endmodule // f5

module G0602a;

	// Define data
	integer i = 0;
	reg x = 1'b0;
	reg y = 1'b0;
	reg z = 1'b0;
	wire r;

	f1 F1 (r, x,y,z);

	// Actions
	initial
		begin : main

			$display ("\nG0602a -\n");

			$display ("f(x,y,z) = M (1,5,7)\n");

			$monitor ("#%0d | %b %b %b | %b", i, x,y,z, r);
			#1 z = 1'b1; i++;
			#1 y = 1'b1; z = 1'b0; i++;
			#1 y = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b1; i++;

		end // main

endmodule // G0602a

module G0602b;

	// Define data
	integer i = 0;
	reg x = 1'b0;
	reg y = 1'b0;
	reg z = 1'b0;
	wire r;

	f2 F2 (r, x,y,z);

	// Actions
	initial
		begin : main

			#15$display ("\nG0602b -\n");

			$display ("f(x,y,z) = M (0,4,6)\n");

			$monitor ("#%0d | %b %b %b | %b", i, x,y,z, r);
			#1 z = 1'b1; i++;
			#1 y = 1'b1; z = 1'b0; i++;
			#1 y = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b1; i++;

		end // main

endmodule // G0602d

module G0602c;

	// Define data
	integer i = 0;
	reg x = 1'b0;
	reg y = 1'b0;
	reg z = 1'b0;
	wire r;

	f3 F3 (r, x,y,z);

	// Actions
	initial
		begin : main

			#25$display ("\nG0602c -\n");

			$display ("f(x,y,z) = M (1,2,3,5)\n");

			$monitor ("#%0d | %b %b %b | %b", i, x,y,z, r);
			#1 z = 1'b1; i++;
			#1 y = 1'b1; z = 1'b0; i++;
			#1 y = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b1; i++;

		end // main

endmodule // G0602c

module G0602d;

	// Define data
	integer i = 0;
	reg x = 1'b0;
	reg y = 1'b0;
	reg z = 1'b0;
	wire r;

	f4 F4 (r, x,y,z);

	// Actions
	initial
		begin : main

			#35$display ("\nG0602d -\n");

			$display ("f(x,y,z) = M (0,3,4,7)\n");

			$monitor ("#%0d | %b %b %b | %b", i, x,y,z, r);
			#1 z = 1'b1; i++;
			#1 y = 1'b1; z = 1'b0; i++;
			#1 y = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b1; i++;

		end // main

endmodule // G0602d

module G0602e;

	// Define data
	integer i = 0;
	reg x = 1'b0;
	reg y = 1'b0;
	reg z = 1'b0;
	wire r;

	f5 F5 (r, x,y,z);

	// Actions
	initial
		begin : main

			#45$display ("\nG0602e -\n");

			$display ("f(x,y,z) = M (2,3,6,7)\n");

			$monitor ("#%0d | %b %b %b | %b", i, x,y,z, r);
			#1 z = 1'b1; i++;
			#1 y = 1'b1; z = 1'b0; i++;
			#1 y = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b1; i++;

		end // main

endmodule // G0602e
