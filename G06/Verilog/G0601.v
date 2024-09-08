// 853355 Davi Puddo

module f1 (output r, input x,y,z);

	assign r = (x&y)|(~x&~y&z);

endmodule // f1

module f2 (output r, input x,y,z);

	assign r = ~z&(x|y);	// (x&~z)|(~x&y&~z)

endmodule // f2

module f3 (output r, input x,y,z);

	assign r = (y^z); // (y&~z)|(~y&z)

endmodule // f3

module f4 (output r, input x,y,z);

	assign r = (x&~y)|(~x&(y^z)); // (x&~y)|(~x&~y&z)|(~x&y&~z);

endmodule

module f5 (output r, input x,y,z);

	assign r = (x&y)|(~x&(~y^z)); // (x&~y)|(~x&~y&z)|(~x&y&~z);

endmodule // f5

module G0601a;

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

			$display ("\nG0601a -\n");

			$display ("f(x,y,z) = m (1,6,7)\n");

			$monitor ("#%0d | %b %b %b | %b", i, x,y,z, r);
			#1 z = 1'b1; i++;
			#1 y = 1'b1; z = 1'b0; i++;
			#1 y = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b1; i++;

		end // main

endmodule // G0601a

module G0601b;

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

			#15 $display ("\nG0601b -\n");

			$display ("f(x,y,z) = m (2,4,6)\n");

			$monitor ("#%0d | %b %b %b | %b", i, x,y,z, r);
			#1 z = 1'b1; i++;
			#1 y = 1'b1; z = 1'b0; i++;
			#1 y = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b1; i++;

		end // main

endmodule // G0601b

module G0601c;

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

			#25 $display ("\nG0601c -\n");

			$display ("f(x,y,z) = m (1,2,5,6)\n");

			$monitor ("#%0d | %b %b %b | %b", i, x,y,z, r);
			#1 z = 1'b1; i++;
			#1 y = 1'b1; z = 1'b0; i++;
			#1 y = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b1; i++;

		end // main

endmodule // G0601c

module G0601d;

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

			#35 $display ("\nG0601d -\n");

			$display ("f(x,y,z) = m (1,2,4,5)\n");

			$monitor ("#%0d | %b %b %b | %b", i, x,y,z, r);
			#1 z = 1'b1; i++;
			#1 y = 1'b1; z = 1'b0; i++;
			#1 y = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b1; i++;

		end // main

endmodule // G0601d

module G0601e;

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

			#45 $display ("\nG0601e -\n");

			$display ("f(x,y,z) = m (0,3,6,7)\n");

			$monitor ("#%0d | %b %b %b | %b", i, x,y,z, r);
			#1 z = 1'b1; i++;
			#1 y = 1'b1; z = 1'b0; i++;
			#1 y = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; z = 1'b1; i++;

		end // main

endmodule // G0601e
