module Guia_0104;
// define data
integer x = 20;
reg [7:0] b = 0;

// actions
initial
 begin : main
 b = x;
 $display ( "b = %8b", b );
 $display ( "b = %d%d%d%d (4)",b[7:6], b[5:4], b[3:2], b[1:0]);
end // main
endmodule // Guia_0104