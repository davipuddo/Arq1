// 853355 Davi Puddo

module clock (clk);

	output reg clk;

	initial 
		begin
			clk = 1'b0;
		end

	always
		begin
			#1 clk = ~clk;
		end

endmodule // clock

module pulse1 (signal, clk);

	input clk;
	output reg signal;

	always @ (clk)
		begin
			signal = 1'b1;
			#3 signal = 1'b0;
			#3 signal = 1'b1;
			#3 signal = 1'b0;
		end

endmodule // pulse1

module pulse2 (signal, clk);

	input clk;
	output reg signal;

	always @ (posedge clk)
		begin
			signal = 1'b1;
			#5 signal = 1'b0;
		end

endmodule // pulse2

module pulse3 (signal, clk);

	input clk;
	output reg signal;

	always @ (negedge clk)
		begin
			signal = 1'b1;
			#15 signal = 1'b0;
		end

endmodule // pulse2

module G0902;

	wire clk;
	wire p1;
	wire p2;
	wire p3;

	clock CLOCK (clk);
	pulse1 PULSE1 (p1, clk);
	pulse2 PULSE2 (p2, clk);
	pulse3 PULSE3 (p3, clk);

	initial
		begin
			$dumpfile ("G0902.vcd");
			$dumpvars (1, clk, p1, p2, p3);

			#120 $finish;
		end

endmodule
