/*
  Guia_0101.v
  853355 - Davi Ferreira Puddo
*/

module Guia_0103;

 // Definir dados
 integer x = 61;
 reg [9:0] b = 0;

 // Acoes
 initial
  begin : main
   b = x;
   $display ( "%d (10) = %8b (4)", x, b);

   x = 53;   
   b = x;
   $display ( "%d (10) = %o (8)", x, b);

   x = 77;
   b = x;
   $display ( "%d (10) = %h (16)", x, b);

   x = 153;
   b = x;
   $display ( "%d (10) = %h (16)", x, b);

   x = 753;
   b = x;
   $display ( "%d (10) = %X (16)", x, b);

   end // main

endmodule // Guia_0101