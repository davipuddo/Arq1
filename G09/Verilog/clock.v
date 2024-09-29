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
