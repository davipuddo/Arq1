module f ( output s, input x, input y );

	wire w1, w2, w3, w4, w5;
	not NOT_1 (w1, x);
	not NOT_2 (w2, y);
	and OR__1 (w3, y, w1);
	or OR__2 (w4, w2, x);
	not NOT_3 (w5, w4);
	and AND_1 (s, w3, w5);

endmodule // s = f (x,y)

module PA0102;

	reg x = 1'b0;
	reg y = 1'b0;
	wire s;

	f F01 (s, x,y);

	initial
		begin : main

			$display ("\nPA0102 -\n");

			$monitor ("%b %b | %b", x,y, s);
			#1 y = 1'b1;
			#1 x = 1'b1; y = 1'b0;
			#1 x = 1'b1; y = 1'b1;

		end // main

endmodule // PA0102
