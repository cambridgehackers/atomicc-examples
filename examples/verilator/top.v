`timescale 1 ns/ 1ns

module top (/*AUTOARG*/ output passed, output [1:0]out_small, output [39:0]out_quad, output [69:0]out_wide,
   input clk, input fastclk, input reset_l, input [1:0]in_small, input [39:0]in_quad, input [69:0]in_wide);
   wire [1:0]out_small = in_small | {2{reset_l}};
   wire [39:0]out_quad = in_quad | {40{reset_l}};
   wire [69:0]out_wide = in_wide | {70{reset_l}};

   initial begin
      $write("Hello World!\n");
   end
   t t (/*AUTOINST*/ .passed(passed), .clk(clk), .fastclk(fastclk), .reset_l(reset_l));
endmodule
