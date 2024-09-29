// 853355 Davi Puddo

module clock (clk);

	output reg clk;

	initial
		begin
			clk = 1'b0;
		end

	always
		begin
			#12 clk = ~clk;
		end

endmodule // clk

module pulse (signal, clk);

	input clk;
	output reg signal;

	always @ (negedge clk)
		begin
			signal = 1'b1;
			#5 signal = 1'b0;
		end

endmodule // pulse

module G0906;

	wire clk;
	wire p1;

	clock CLK (clk);
	pulse PULSE1 (p1, clk);

	initial
		begin
			$dumpfile ("G0906.vcd");
			$dumpvars (1, clk, p1);

			#240 $finish;
		end

endmodule // G0906
