`include "printf.generated.vh"

module EchoRequest___P2M (input CLK, input nRST,
    output method$say__ENA,
    output [31:0]method$say$v,
    output method$say2__ENA,
    output [15:0]method$say2$a,
    output [15:0]method$say2$b,
    input method$say2__RDY,
    input method$say__RDY,
    output method$setLeds__ENA,
    output [7:0]method$setLeds$v,
    input method$setLeds__RDY,
    output method$zsay4__ENA,
    input method$zsay4__RDY,
    input pipe$enq__ENA,
    input [127:0]pipe$enq$v,
    output pipe$enq__RDY);
    assign method$say$v = pipe$enq$v[63:32] ;
    assign method$say2$a = pipe$enq$v[47:32] ;
    assign method$say2$b = pipe$enq$v[63:48] ;
    assign method$say2__ENA = ( pipe$enq$v[31:16]  == 16'd1 ) & pipe$enq__ENA  & method$say__RDY  & method$setLeds__RDY  & method$zsay4__RDY ;
    assign method$say__ENA = ( pipe$enq$v[31:16]  == 16'd0 ) & pipe$enq__ENA  & method$say2__RDY  & method$setLeds__RDY  & method$zsay4__RDY ;
    assign method$setLeds$v = pipe$enq$v[39:32] ;
    assign method$setLeds__ENA = ( pipe$enq$v[31:16]  == 16'd2 ) & pipe$enq__ENA  & method$say__RDY  & method$say2__RDY  & method$zsay4__RDY ;
    assign method$zsay4__ENA = ( pipe$enq$v[31:16]  == 16'd3 ) & pipe$enq__ENA  & method$say__RDY  & method$say2__RDY  & method$setLeds__RDY ;
    assign pipe$enq__RDY = method$say__RDY  & method$say2__RDY  & method$setLeds__RDY  & method$zsay4__RDY ;
endmodule 

