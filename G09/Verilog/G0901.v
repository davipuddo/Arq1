module clock ( output reg clk );

	initial
		begin
			clk = 1'b0;
		end

	always
		begin
			#12 clk = ~clk;
		end

endmodule

module pulse ( signal, clock );

	input clock;
	output signal;
	reg signal;

	always @ ( clock )
		begin
			signal = 1'b1;
			#3 signal = 1'b0;
			#3 signal = 1'b1;
			#3 signal = 1'b0;
		end

endmodule // pulse

module trigger ( signal, on, clock );

	input on, clock;
	output signal;
	reg signal;

	always @ ( negedge clock & on )
		begin
			#60 signal = 1'b1;
			#60 signal = 1'b0;
		end

endmodule // trigger

module G0901;

	wire ps;
	wire tg;
	wire clk;

	reg x = 1'b0;

	clock CL (clk);

	pulse PS (ps, clk);
	trigger TG (tg, x, clk);

	initial
		begin
		
			$dumpfile ("G0901.vcd");
			$dumpvars (1,clk,tg,x,ps);
			
			#060 x = 1'b1;
			#120 x = 1'b0;
			#180 x = 1'b1;
			#240 x = 1'b0;
		  $finish;

		end

endmodule // tb
