`include "before1.generated.vh"

module EchoIndicationOutput (input CLK, input nRST,
    input indication$heard__ENA,
    input [31:0]indication$heard$meth,
    input [31:0]indication$heard$v,
    output indication$heard__RDY,
    output pipe$enq__ENA,
    output [95:0]pipe$enq$v,
    input pipe$enq__RDY);
    wire CLK, nRST;
    reg even;
    reg [31:0]ind0$data$heard$meth;
    reg [31:0]ind0$data$heard$v;
    reg [31:0]ind0$tag;
    reg [31:0]ind1$data$heard$meth;
    reg [31:0]ind1$data$heard$v;
    reg [31:0]ind1$tag;
    reg ind_busy;
    wire output_rulee__ENA;
    wire output_ruleo__ENA;
    assign output_rulee__ENA = ( ( ind_busy  & even  ) != 0 ) & pipe$enq__RDY ;
    assign output_ruleo__ENA = ( ( ind_busy  & ( !even  ) ) != 0 ) & pipe$enq__RDY ;
    assign indication$heard__RDY = !ind_busy ;
    assign pipe$enq$v = ( output_rulee__ENA  & ( ( ind_busy  & even  ) != 0 ) & pipe$enq__RDY  ) ? { ind0$data$heard$v  , ind0$data$heard$meth  , ind0$tag  } : { ind1$data$heard$v  , ind1$data$heard$meth  , ind1$tag  };
    assign pipe$enq__ENA = ( ( ( ind_busy  & even  ) != 0 ) & ( ( ind_busy  & even  ) != 0 ) ) || ( ( ( ind_busy  & ( !even  ) ) != 0 ) & ( ( ind_busy  & ( !even  ) ) != 0 ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        even <= 0;
        ind0$data$heard$meth <= 0;
        ind0$data$heard$v <= 0;
        ind0$tag <= 0;
        ind1$data$heard$meth <= 0;
        ind1$data$heard$v <= 0;
        ind1$tag <= 0;
        ind_busy <= 0;
      end // nRST
      else begin
        if (indication$heard__ENA & indication$heard__RDY) begin
            ind_busy  <= 1;
            even  <= even ^ 1;
            $display( "[%s:%d]EchoIndicationOutput even %d" , "indication$heard" , 114 , even );
            if (even ^ 1) begin
            ind0$tag  <= 1;
            ind0$data$heard$meth  <= indication$heard$meth;
            ind0$data$heard$v  <= indication$heard$v;
            end;
            if (even) begin
            ind1$tag  <= 1;
            ind1$data$heard$meth  <= indication$heard$meth;
            ind1$data$heard$v  <= indication$heard$v;
            end;
        end; // End of indication$heard__ENA
        if (output_rulee__ENA & ( ( ind_busy & even ) != 0 ) & pipe$enq__RDY) begin
            ind_busy  <= 0;
        end; // End of output_rulee__ENA
        if (output_ruleo__ENA & ( ( ind_busy & ( !even ) ) != 0 ) & pipe$enq__RDY) begin
            ind_busy  <= 0;
        end; // End of output_ruleo__ENA
      end
    end // always @ (posedge CLK)
endmodule 

