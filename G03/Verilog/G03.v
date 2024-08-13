// 853355 Davi Puddo

module G0301;
	
	// Definir dados
	reg [6:0] b = 8'b0000_1010;
	reg [7:0] r = 0;
	integer i = 0;

	// Acoes
	initial
		begin : main
			
			$display ("\nG0301 -\n");
			
			r = ~b;	// Iverter valores
			$display ("C[1,6] %8b = %8b", b[3:0], r[5:0]);

			b = 8'b0000_1101;
			r = ~b;
			$display ("C[1,8] %8b = %8b", b[3:0], r[7:0]);

			b = 8'b0010_1001;
			r = ~b+1;
			$display ("C[2,6] %8b = %8b", b[5:0], r[5:0]);
				
			b = 8'b0010_1111;
			r = ~b+1;
			$display ("C[2,7] %8b = %8b", b[5:0], r[6:0]);

			b = 8'b0011_0100;
			r = ~b+1;
			$display ("C[2,8] %8b = %8b", b[5:0], r[7:0]);

		end // main

endmodule // G0301

module G0302;
	
	// Definir dados
	integer    q[3:0];			// Quad
	reg [11:0] o = 12'o0;		// Octa
	reg [15:0] h = 16'h0;		// Hexa
	reg [15:0] r = 8'b0;		// Result - Binary

	// Acoes
	initial
		begin : main

			$display ("\nG0302 -\n");

			r[5:4] = 3;
			r[3:2] = 2;
			r[1:0] = 1;
			$display ("C[1,6] %d%d%d = %8b", r[5:4], r[3:2], r[1:0], ~r[5:0]);

			h = 16'hB2;
			r =  ~h;
			$display ("C[1,8] %h = %8b", h[7:0], r[7:0]);

			r[5:4] = 2;
			r[3:2] = 3;
			r[1:0] = 1;
			r = ~r+1;
			$display ("C[2,6] %d%d%d = %8b", ~r[5:4], ~r[3:2], ~r[1:0], r[5:0]);

			o = 12'o146;
			r = ~o+1;
			$display ("C[2,10] %o = %8b", o[8:0], r[9:0]);

			h = 16'h6F;
			r = ~h+1;
			$display ("C[2,8] %h = %8b", h[7:0], r[7:0]);

		end	// main

endmodule // G0302

module G0303;
	
	// Definir dados
	reg [7:0] b = 0;
	reg [7:0] r = 0;

	// Acoes
	initial
		begin : main
			
			$display ("\nG0303 -\n");
		
			b = 8'b0001_0110;
			r[4:0] = ~(b-1);
			$display ("%8b = %d", b, r);
			
			b = 8'b0011_0011;
			r[5:0] = ~(b-1);
			$display ("%8b = %d", b, r);
			
			b = 8'b0010_0100;
			r[5:0] = ~(b-1);
			$display ("%8b = %0b", b, r);

			b = 8'b0101_1011;
			r[6:0] = ~(b-1);
			$display ("%8b = %0b", b, r);

			b = 8'b0111_0011;
			r[6:0] = ~(b-1);
			$display ("%8b = %0h", b, r);

		end // main

endmodule // G0303

module G0304;

	// Definir dados
	reg [15:0]  b = 0;
	reg [15:0]  s = 0;
	reg [15:0] r = 0;
	reg [7:0] buffer = 0;

	// Acoes
	initial
		begin : main
			
			$display ("\nG0304 -\n");

			b = 8'b0001_1001;
			s = 8'b0000_1101;
			r[4:0] = b[4:0] + (~s[4:0] + 1);
			$display ("%0b - %0b = %8b", b[4:0], s[3:0], r[4:0]);

			b = 8'b0101_1101;				// Set data
			s = 8'b0000_1001;

			buffer[6:4] = s[3:2];		// Match sizes
			buffer[3:2] = s[1:0];

			r[6:0] = b[6:0] + (~buffer[6:0] + 1);
			$display ("%0b.%0b - %0b.%8b = %0b.%8b", b[7:4], b[3:0], s[3:2], s[1:0], r[6:4], r[3:0]);
					
			b[5:4] = 3;		// Base 4 number
			b[3:2] = 2;		// 	   321
			b[1:0] = 1;

			s[5:4] = 2;		//		 231
			s[3:2] = 3;
			s[1:0] = 1;

			r[5:0] = b + (~s[5:0]+1);
			$display ("%d%d%d (4) - %d%d%d (4) = %d%d%d (4)", b[5:4], b[3:2], b[1:0], s[5:4], s[3:2], s[1:0], r[5:4], r[3:2], r[1:0]);

			b = 12'o376;
			s = 12'o267;
			
			r[8:0] = b[8:0] + (~s[8:0]+1);
			$display ("%o (8) - %o (8) = %o (8)", b[8:0], s[8:0], r[8:0]);

			b = 15'h7D2;
			s = 15'hA51;

			r[11:0] = b[11:0] + (~s[11:0]+1);
			$display ("%h (16) - %h (16) = %h (16)", b[11:0], s[11:0], r[8:0]);


		end // main

endmodule // G0304

module G0305;

	// Definir dados


	// Acoes
	initial
		begin : main

			$display ("\nG0305 -\n");

		end // main

endmodule // G0305
