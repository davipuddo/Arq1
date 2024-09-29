module Clock (clk);

	output clk;
	reg clk;

	initial
		begin
			
			clk = 1'b1;

		end

	always
	 begin

			#10 clk = ~clk;

		end

endmodule // Clock

module testClock;

	wire clk;
	Clock CLK1 (clk);

	initial
		begin
	
			$dumpfile ("tclock.vcd");
			$dumpvars;

		#120 $finish;
		end

endmodule // testClock
