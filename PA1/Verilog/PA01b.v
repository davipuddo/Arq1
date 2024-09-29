// 853355 Davi Puddo

module PoS (output r, input a,b,c,d);

	assign r = (a|b|c|d)&(a|b|c|~d)&(a|b|~c|~d)&(a|~b|c|~d)&(a|~b|~c|d)&(~a|b|c|d)&(~a|b|c|~d)&(~a|b|~c|d)&(~a|~b|c|~d)&(~a|~b|~c|d)&(~a|~b|~c|~d);
endmodule // SoP

module PA01a;

	// Variables
	reg a = 1'b0;
	reg b = 1'b0;
	reg c = 1'b0;
	reg d = 1'b0;
	wire r;

	// Call module
	PoS POS (r, a,b,c,d);

	// Actions
	initial begin : main

		$display ("\nPA01b -\n");

		$monitor ("%b %b %b %b | %b", a,b,c,d, r);
		#1 a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1;
		#1 a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0;
		#1 a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b1;
		#1 a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0;
		#1 a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1;
		#1 a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b0;
		#1 a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1;
		#1 a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0;
		#1 a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1;
		#1 a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b0;
		#1 a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1;
		#1 a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b0;
		#1 a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1;
		#1 a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b0;
		#1 a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1;

	end // main

endmodule // PA01b
