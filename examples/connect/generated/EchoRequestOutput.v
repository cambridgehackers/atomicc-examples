`include "connect.generated.vh"

module EchoRequestOutput (input CLK, input nRST,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY,
    output pipe$enq__ENA,
    output [95:0]pipe$enq$v,
    input pipe$enq__RDY);
    wire CLK, nRST;
    wire [31:0]request$say__ENA$ind$data$say$meth;
    wire [31:0]request$say__ENA$ind$data$say$v;
    assign pipe$enq$v = { request$say__ENA$ind$data$say$v  , request$say__ENA$ind$data$say$meth  , 32'd1 };
    assign pipe$enq__ENA = request$say__ENA ;
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
      end
    end // always @ (posedge CLK)
endmodule 

