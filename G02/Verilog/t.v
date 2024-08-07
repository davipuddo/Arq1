module ExampleModule;

  // Define a function to compute the maximum of two numbers
  function [7:0] max;
    input [7:0] a;
    input [7:0] b;
    begin
      if (a > b)
        max = a;
      else
        max = b;
    end
  endfunction

  // Test the function
  reg [7:0] num1, num2;
  reg [7:0] result;

  initial begin
    num1 = 8'd15;
    num2 = 8'd10;
    result = max(num1, num2); // Call the function
    $display("The maximum value is %d", result);
  end

endmodule

