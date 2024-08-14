// 853355 Davi Puddo

module G0301;
	
	// Define data
	reg [7:0] b = 0;	// Binary
	reg [7:0] r = 0;	// Result - binary

	// Actions
	initial
		begin : main
			
			$display ("\nG0301 -\n");
			
			// Set values
			b = 8'b0000_1010;

			// Operation c[1]
			r = ~b;	

			// Show result
			$display ("C[1,6] %8b = %8b", b[3:0], r[5:0]);

			// Set values
			b = 8'b0000_1101;

			// Operation c[1]
			r = ~b;

			// Show result
			$display ("C[1,8] %8b = %8b", b[3:0], r[7:0]);

			// Set values
			b = 8'b0010_1001;

			// Operation c[2]
			r = ~b+1;

			// Show result
			$display ("C[2,6] %8b = %8b", b[5:0], r[5:0]);
				
			// Set values
			b = 8'b0010_1111;

			// Operation c[2]
			r = ~b+1;

			// Show result
			$display ("C[2,7] %8b = %8b", b[5:0], r[6:0]);

			// Set values
			b = 8'b0011_0100;

			// Operation c[2]
			r = ~b+1;

			// Show result
			$display ("C[2,8] %8b = %8b", b[5:0], r[7:0]);

		end // main

endmodule // G0301

module G0302;
	
	// Define data
	reg [11:0] o = 0;		// Octa
	reg [15:0] h = 0;	  // Hexa
	reg [15:0] r = 0;		// Result - Binary

	// Actions
	initial
		begin : main

			$display ("\nG0302 -\n");
			
			// Set values in base 4
			r[5:4] = 3;
			r[3:2] = 2;
			r[1:0] = 1;

			// Show result																						v--------- invert value
			$display ("C[1,6] %d%d%d = %8b", r[5:4], r[3:2], r[1:0], ~r[5:0]);
			
			// Set values
			h = 16'hB2;

			// Operation c[1]
			r =  ~h;

			// Show result
			$display ("C[1,8] %h = %8b", h[7:0], r[7:0]);

			// Set values
			r[5:4] = 2;
			r[3:2] = 3;
			r[1:0] = 1;

			// Operation c[2]
			r = ~r+1;

			// Show result
			$display ("C[2,6] %d%d%d = %8b", ~r[5:4], ~r[3:2], ~r[1:0], r[5:0]);

			// Set values
			o = 12'o146;

			// Opertaion c[2]
			r = ~o+1;

			// Show result
			$display ("C[2,10] %o = %8b", o[8:0], r[9:0]);
			
			// Set values
			h = 16'h6F;

			// Operation c[2]
			r = ~h+1;

			// Show results
			$display ("C[2,8] %h = %8b", h[7:0], r[7:0]);

		end	// main

endmodule // G0302

module G0303;
	
	// Define data
	reg [7:0] b = 0;
	reg [7:0] r = 0;

	// Actions
	initial
		begin : main
			
			$display ("\nG0303 -\n");
			
			// Set values
			b = 8'b0001_0110;

			// Revert c[2]
			r[4:0] = ~(b-1);

			// Show result
			$display ("%8b = %d", b, r);
			
			// Set values
			b = 8'b0011_0011;

			// Revert c[2]
			r[5:0] = ~(b-1);

			// Show result
			$display ("%8b = %d", b, r);
			
			// Set values
			b = 8'b0010_0100;

			// Revert c[2]
			r[5:0] = ~(b-1);

			// Show result
			$display ("%8b = %0b", b, r);
			
			// Set values
			b = 8'b0101_1011;

			// Revert c[2]
			r[6:0] = ~(b-1);

			// Show result
			$display ("%8b = %0b", b, r);

			b = 8'b0111_0011;
			r[6:0] = ~(b-1);
			$display ("%8b = %0h", b, r);

		end // main

endmodule // G0303

module G0304;

	// Define data
	reg [15:0] b = 0;			 // Binary
	reg [15:0] s = 0;			 // Subtrahend - binary
	reg [15:0] r = 0;			 // Result - binary

	// Actions
	initial
		begin : main
			
			$display ("\nG0304 -\n");
			
			// Set values
			b = 8'b0001_1001;
			s = 8'b0000_1101;

			// Subtrac					v--- c[2]
			r[4:0] = b[4:0] + (~s[4:0] + 1);

			// Show result
			$display ("%0b - %0b = %8b", b[4:0], s[3:0], r[4:0]);

			// Set values
			b = 8'b0101_1101;
			s = 8'b0000_1001;

			// Subtract          v----------Match sizes
			r[6:0] = b[6:0] + (~(s*2) + 1);

			// Show result
			$display ("%0b.%0b - %0b.%8b = %0b.%8b", b[7:4], b[3:0], s[3:2], s[1:0], r[6:4], r[3:0]);
					
			b[5:4] = 3;		// Base 4 number
			b[3:2] = 2;		// 	   321
			b[1:0] = 1;

			s[5:4] = 2;		//		 231
			s[3:2] = 3;
			s[1:0] = 1;

			// Subract 
			r[5:0] = b + (~s[5:0]+1);

			// Show result
			$display ("%d%d%d (4) - %d%d%d (4) = %d%d%d (4)", b[5:4], b[3:2], b[1:0], s[5:4], s[3:2], s[1:0], r[5:4], r[3:2], r[1:0]);
			// Set values
			b = 12'o376;
			s = 12'o267;
			
			// Subtract
			r[8:0] = b[8:0] + (~s[8:0]+1);

			// Show result
			$display ("%o (8) - %o (8) = %o (8)", b[8:0], s[8:0], r[8:0]);
			
			// Set values
			b = 15'h7D2;
			s = 15'hA51;
			
			// Subtract
			r[11:0] = b[11:0] + (~s[11:0]+1);

			// Show result
			$display ("%h (16) - %h (16) = %h (16)", b[11:0], s[11:0], r[8:0]);

		end // main

endmodule // G0304

module G0305;

	// Define data
	reg [15:0] b = 0;		// Binary
	reg [15:0] s = 0; 	// Subtrahend - binary
	reg [15:0] r = 0;		// Result - binary

	// Actions
	initial
		begin : main

			$display ("\nG0305 -\n");
			
			// Set values
		  b = 8'b0011_0101;
			s = 8'b0000_1011;

			// Operate
			r[5:0] = b[5:0] + (~s[5:0]+1);
			
			// Show results
			$display ("%8b - %8b = %8b", b[5:0], s[5:0], r[5:0]);

			// Set values
			b = 8'b0101_1001;
			s = 12'o3_1;

			// Operate
			r[6:0] = b[6:0] + (~(s[6:0]*2)+1);		// Match decimal places by multiplying 2

			// Show results
			$display ("%0b.%0b (2) - %0o.%0o (8) = %0b.%8b (2)", b[6:4], b[3:0], s[5:3], s[2:0], r[6:4], r[3:0]);
			
			// Delete old data
			b = 0;
			
			// Set values
			b[5:4] = 2;			// Base 4 number
			b[3:2] = 1;			// 		  ==
			b[1:0] = 3;			// 	    ==
			s = 16'h3D;
			
			// Operate
			r[7:0] = b[7:0] + (~s[7:0]+1);
			
			// Show results
			$display ("%0d%0d%0d (4) - %h (16) = %8b (2)", b[5:4], b[3:2], b[1:0], s[7:0], r[7:0]);
			
			// Set values
			b = 16'hC5;
			s = 8'b0101_1001;

			// Operate
			r[7:0] = b[7:0] + (~s[7:0]+1);

			// Show results
			$display ("%h (16) - %8b (2) = %8b (2)", b[7:0], s[7:0], r[7:0]);

			// Set values
			b = 16'h7E;
			s = 16'h2D;

			// Operate
			r[7:0] = b[7:0] + (~s[7:0]+1);

			// Show results
			$display ("%h (16) - %h (16) = %8b (2)", b[7:0], s[7:0], r[7:0]);

		end // main

endmodule // G0305
