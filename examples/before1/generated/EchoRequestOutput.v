`include "before1.generated.vh"

module EchoRequestOutput (input CLK, input nRST,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    input request$say2__ENA,
    input [31:0]request$say2$meth,
    input [31:0]request$say2$v,
    output request$say2__RDY,
    output request$say__RDY,
    output pipe$enq__ENA,
    output [191:0]pipe$enq$v,
    input pipe$enq__RDY);
    wire [31:0]request$say2__ENA$ind$data$say$meth;
    wire [31:0]request$say2__ENA$ind$data$say$v;
    wire [31:0]request$say2__ENA$ind$data$say2$meth;
    wire [31:0]request$say2__ENA$ind$data$say2$v;
    wire [31:0]request$say2__ENA$ind$data$say2$v2;
    wire [31:0]request$say__ENA$ind$data$say$meth;
    wire [31:0]request$say__ENA$ind$data$say$v;
    wire [31:0]request$say__ENA$ind$data$say2$meth;
    wire [31:0]request$say__ENA$ind$data$say2$v;
    wire [31:0]request$say__ENA$ind$data$say2$v2;
    assign pipe$enq$v = ( request$say__ENA  & request$say__RDY  ) ? { request$say__ENA$ind$data$say2$v2  , request$say__ENA$ind$data$say2$v  , request$say__ENA$ind$data$say2$meth  , request$say__ENA$ind$data$say$v  , request$say__ENA$ind$data$say$meth  , 32'd1 } : { request$say2__ENA$ind$data$say2$v2  , request$say2__ENA$ind$data$say2$v  , request$say2__ENA$ind$data$say2$meth  , request$say2__ENA$ind$data$say$v  , request$say2__ENA$ind$data$say$meth  , 32'd2 };
    assign pipe$enq__ENA = request$say__ENA  || request$say2__ENA ;
    assign request$say2__RDY = pipe$enq__RDY ;
    assign request$say__RDY = pipe$enq__RDY ;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (request$say__ENA & request$say__RDY) begin
            request$say__ENA$ind$data$say$meth  <= request$say$meth;
            request$say__ENA$ind$data$say$v  <= request$say$v;
            $display( "entered EchoRequestOutput::say" );
        end; // End of request$say__ENA
        if (request$say2__ENA & request$say2__RDY) begin
            request$say2__ENA$ind$data$say2$meth  <= request$say2$meth;
            request$say2__ENA$ind$data$say2$v  <= request$say2$v;
            $display( "entered EchoRequestOutput::say2" );
        end; // End of request$say2__ENA
      end
    end // always @ (posedge CLK)
endmodule 

