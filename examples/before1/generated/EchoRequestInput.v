`include "before1.generated.vh"

module EchoRequestInput (input CLK, input nRST,
    input pipe$enq__ENA,
    input [191:0]pipe$enq$v,
    output pipe$enq__RDY,
    output request$say__ENA,
    output [31:0]request$say$meth,
    output [31:0]request$say$v,
    output request$say2__ENA,
    output [31:0]request$say2$meth,
    output [31:0]request$say2$v,
    input request$say2__RDY,
    input request$say__RDY);
    wire CLK, nRST;
    assign pipe$enq__RDY = request$say__RDY  & request$say2__RDY ;
    assign request$say$meth = pipe$enq$v[63:32] ;
    assign request$say$v = pipe$enq$v[95:64] ;
    assign request$say2$meth = pipe$enq$v[127:96] ;
    assign request$say2$v = pipe$enq$v[159:128] ;
    assign request$say2__ENA = ( pipe$enq$v[31:0]  == 32'd2 ) & pipe$enq__ENA ;
    assign request$say__ENA = ( pipe$enq$v[31:0]  == 32'd1 ) & pipe$enq__ENA ;

    always @( posedge CLK) begin
      if (!nRST) begin
      end // nRST
      else begin
        if (pipe$enq__ENA) begin
            $display( "entered EchoRequestInput::enq tag %d" , pipe$enq$v[31:0] );
        end; // End of pipe$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

