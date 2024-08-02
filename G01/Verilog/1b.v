/*
  Guia_0101.v
  853355 - Davi Ferreira Puddo
*/

module Guia_0101;
// define data
  integer x = 13; // decimal
  reg [9:0] b = 0; // binary (bits - little endian)

// actions

  initial
   begin : main
    x = 26;
    b = x;
    $display ( "%d (10) = %8b (2)", x, b);

    x = 53;   
    b = x;
    $display ( "%d (10) = %8b (2)", x, b);

    x = 713;
    b = x;
    $display ( "%d (10) = %8b (2)", x, b);

    x = 213;
    b = x;
    $display ( "%d (10) = %8b (2)", x, b);

    x = 365;
    b = x;
    $display ( "%d (10) = %8b (2)", x, b);

   end // main

endmodule // Guia_0101