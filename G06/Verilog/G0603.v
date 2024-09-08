// 853355 Davi Puddo

module f1 (output r, input x,y,w,z);

	assign r = (~x&~w&z)|(~x&~y&w&~z)|(x&y&~w)|(x&~w&~z);

endmodule // f1

module f2 (output r, input x,y,w,z);

	assign r = (~x&~y&~w)|(y&~w&z)|(~x&w&z)|(x&y&w&z);

endmodule // f2

module f3 (output r, input x,y,w,z);

	assign r = (~x&~y&~w)|(y&w&z)|(w&~z);

endmodule // f3

module f4 (output r, input x,y,w,z);

	assign r = (~x&~w&~z)|(y&z&(x^w))|(w&~z);

endmodule // f4

module f5 (output r, input x,y,w,z);

	assign r = (~y&~w)|(~x&w&z)|(x&z&(y^w));

endmodule // f5

module G0603a;

	// Define data
	integer i = 0;
	reg x = 1'b0;
	reg y = 1'b0;
	reg z = 1'b0;
	reg w = 1'b0;
	wire r;

	f1 F1 (r, x,y,w,z);

	// Actions
	initial
		begin : main

			$display ("\nG0603a -\n");

			$display ("f(x,y,z,w) = m (1,2,5,8,12,13)\n");

			$monitor ("#%0d\t | %b %b %b %b | %b", i, x,y,w,z, r);
			#1 z = 1'b1; i++;
			#1 w = 1'b1; z = 1'b0; i++;
			#1 w = 1'b1; z = 1'b1; i++;
			#1 y = 1'b1; w = 1'b0; z = 1'b0; i++;
			#1 y = 1'b1; w = 1'b0; z = 1'b1; i++;
			#1 y = 1'b1; w = 1'b1; z = 1'b0; i++;
			#1 y = 1'b1; w = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b1; i++;

		end // main

endmodule // G0603a

module G0603b;

	// Define data
	integer i = 0;
	reg x = 1'b0;
	reg y = 1'b0;
	reg z = 1'b0;
	reg w = 1'b0;
	wire r;

	f2 F2 (r, x,y,w,z);

	// Actions
	initial
		begin : main

			#20$display ("\nG0603b -\n");

			$display ("f(x,y,z,w) = m (0,1,3,5,7,13,15)\n");

			$monitor ("#%0d\t | %b %b %b %b | %b", i, x,y,w,z, r);
			#1 z = 1'b1; i++;
			#1 w = 1'b1; z = 1'b0; i++;
			#1 w = 1'b1; z = 1'b1; i++;
			#1 y = 1'b1; w = 1'b0; z = 1'b0; i++;
			#1 y = 1'b1; w = 1'b0; z = 1'b1; i++;
			#1 y = 1'b1; w = 1'b1; z = 1'b0; i++;
			#1 y = 1'b1; w = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b1; i++;

		end // main

endmodule // G0603b

module G0603c;

	// Define data
	integer i = 0;
	reg x = 1'b0;
	reg y = 1'b0;
	reg z = 1'b0;
	reg w = 1'b0;
	wire r;

	f3 F3 (r, x,y,w,z);

	// Actions
	initial
		begin : main

			#40$display ("\nG0603c -\n");

			$display ("f(x,y,z,w) = m (0,1,2,6,7,10,14,15)\n");

			$monitor ("#%0d\t | %b %b %b %b | %b", i, x,y,w,z, r);
			#1 z = 1'b1; i++;
			#1 w = 1'b1; z = 1'b0; i++;
			#1 w = 1'b1; z = 1'b1; i++;
			#1 y = 1'b1; w = 1'b0; z = 1'b0; i++;
			#1 y = 1'b1; w = 1'b0; z = 1'b1; i++;
			#1 y = 1'b1; w = 1'b1; z = 1'b0; i++;
			#1 y = 1'b1; w = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b1; i++;

		end // main

endmodule // G0603c

module G0603d;

	// Define data
	integer i = 0;
	reg x = 1'b0;
	reg y = 1'b0;
	reg z = 1'b0;
	reg w = 1'b0;
	wire r;

	f4 F4 (r, x,y,w,z);

	// Actions
	initial
		begin : main

			#60$display ("\nG0603d -\n");

			$display ("f(x,y,z,w) = m (0,2,4,6,7,10,13,14)\n");

			$monitor ("#%0d\t | %b %b %b %b | %b", i, x,y,w,z, r);
			#1 z = 1'b1; i++;
			#1 w = 1'b1; z = 1'b0; i++;
			#1 w = 1'b1; z = 1'b1; i++;
			#1 y = 1'b1; w = 1'b0; z = 1'b0; i++;
			#1 y = 1'b1; w = 1'b0; z = 1'b1; i++;
			#1 y = 1'b1; w = 1'b1; z = 1'b0; i++;
			#1 y = 1'b1; w = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b1; i++;

		end // main

endmodule // G0603d

module G0603e;

	// Define data
	integer i = 0;
	reg x = 1'b0;
	reg y = 1'b0;
	reg z = 1'b0;
	reg w = 1'b0;
	wire r;

	f5 F5 (r, x,y,w,z);

	// Actions
	initial
		begin : main

			#80$display ("\nG0603e -\n");

			$display ("f(x,y,z,w) = m (0,1,3,7,8,9,11,13)\n");

			$monitor ("#%0d\t | %b %b %b %b | %b", i, x,y,w,z, r);
			#1 z = 1'b1; i++;
			#1 w = 1'b1; z = 1'b0; i++;
			#1 w = 1'b1; z = 1'b1; i++;
			#1 y = 1'b1; w = 1'b0; z = 1'b0; i++;
			#1 y = 1'b1; w = 1'b0; z = 1'b1; i++;
			#1 y = 1'b1; w = 1'b1; z = 1'b0; i++;
			#1 y = 1'b1; w = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b1; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b0; i++;
			#1 x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b1; i++;

		end // main

endmodule // G0603e
