// 853355

module f01 (output x, input a, input b, input c);

assign x = a & (b | c);

endmodule // f01

module G0401;
	
	// Define data
	reg x, y, z;
	wire w;

	initial 
		begin

			x = 1'b0;
			y = 1'b0;
			z = 1'b0;

		end

	f01 f01_01 (w, x,y,z);

	initial
		begin
		
			$monitor ("%b %b %b = %b", x, y, z, w);
			#1 z = 1'b1;
			#1 z = 1'b0; y = 1'b1;b1
			#1 z = 1'b1; y = 1'b1;
			#1 z = 1'b0; y = 1'b0; x = 1'b1;
			#1 z = 1'b1; y = 1'b0; x = 1'b1;
			#1 z = 1'b0; y = 1'b1; x = 1'b1;
			#1 z = 1'b1; y = 1'b1; x = 1'b1;

		end


endmodule // G0401
