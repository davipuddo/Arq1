/*
  Guia_0102.v
  853355 - Davi Ferreira Puddo
*/

module Guia_0102;

 // Definir dados
 integer x = 0;
 reg [7:0] b = 8'b10101;

 // Acoes
 initial
  begin : main
   x = b;
   $display ( "%8b (2) = %d", b, x );

   b = 8'b11011;
   x = b;
   $display ( "%8b (2) = %d", b, x );

   b = 8'b10010;
   x = b;
   $display ( "%8b (2) = %d", b, x );

   b = 8'b101011;
   x = b;
   $display ( "%8b (2) = %d", b, x );

   b = 8'b110111;
   x = b;
   $display ( "%8b (2) = %d", b, x );

  end // main

endmodule