
module t (/*AUTOARG*/ output passed, input clk, input fastclk, input reset_l);
   reg [31:0]count_c;
   reg [31:0]count_f;
   always @ (posedge clk) begin
   if (!reset_l) begin
      /*AUTORESET*/
      count_c <= 0;
   end else begin
      count_c <= count_c + 1;
      end
   end
   always @ (posedge fastclk) begin
      if (!reset_l) begin
        /*AUTORESET*/
        count_f <= 0;
        passed <= 0;
      end else begin
        count_f <= count_f + 1;
        if (count_f == 5) passed <= 1'b1;
      end
   end
endmodule
