// 853355 Davi Puddo

module f1 (output r, input x,y,w,z);

	assign r = (x|~w|(y^z))&(~y|~w|z);
	
endmodule // f1

module f2 (output r, input x,y,w,z);

  assign r = (x|~y|w)&(~x|w|~z)&(~x|~y|~w|z);
	
endmodule // f2

module f3 (output r, input x,y,w,z);

	assign r = (~y|w|(x^z))&(~y|~w|~z)&(~x|y|w|z);
	
endmodule // f3

module f4 (output r, input x,y,w,z);

	assign r = (x|w|~z)&(~x|~y|~w)&(~x|y|~z);
	
endmodule // f4

module f5 (output r, input x,y,w,z);

	assign r = (x|~w|z)&(x|~y|~z)&(~x|~y|~z)&(~x|y|~w|~z);
	
endmodule // f5

module G0604a;

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

			$display ("\nG0604a -\n");

			$display ("f(x,y,z,w) = M (2,6,7,14)\n");

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

endmodule // G0604a


module G0604b;

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

			#20$display ("\nG0604b -\n");

			$display ("f(x,y,z,w) = M (4,5,9,13,14)\n");

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

endmodule // G0604b

module G0604c;

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

			#40$display ("\nG0604c -\n");

			$display ("f(x,y,z,w) = M (4,7,8,13,15)\n");

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

endmodule // G0604c

module G0604d;

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

			#60$display ("\nG0604d -\n");

			$display ("f(x,y,z,w) = M (1,5,9,11,14,15)\n");

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

endmodule // G0604d

module G0604e;

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

			#80$display ("\nG0604e -\n");

			$display ("f(x,y,z,w) = M (2,5,6,7,11,13,15)\n");

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

endmodule // G0604e

