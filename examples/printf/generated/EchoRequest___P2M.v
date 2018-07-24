`include "printf.generated.vh"

`default_nettype none
module EchoRequest___P2M (input wire CLK, input wire nRST,
    output wire method$say__ENA,
    output wire [31:0]method$say$v,
    output wire method$say2__ENA,
    output wire [15:0]method$say2$a,
    output wire [15:0]method$say2$b,
    input wire method$say2__RDY,
    input wire method$say__RDY,
    output wire method$setLeds__ENA,
    output wire [7:0]method$setLeds$v,
    input wire method$setLeds__RDY,
    output wire method$zsay4__ENA,
    input wire method$zsay4__RDY,
    input wire pipe$enq__ENA,
    input wire [127:0]pipe$enq$v,
    output wire pipe$enq__RDY);
    assign method$say$v = pipe$enq$v[ 63 : 32 ];
    assign method$say2$a = pipe$enq$v[ 47 : 32 ];
    assign method$say2$b = pipe$enq$v[ 63 : 48 ];
    assign method$say2__ENA = ( pipe$enq$v[ 31 : 16 ] == 16'd1 ) & pipe$enq__ENA & pipe$enq__RDY;
    assign method$say__ENA = ( pipe$enq$v[ 31 : 16 ] == 16'd0 ) & pipe$enq__ENA & pipe$enq__RDY;
    assign method$setLeds$v = pipe$enq$v[ 39 : 32 ];
    assign method$setLeds__ENA = ( pipe$enq$v[ 31 : 16 ] == 16'd2 ) & pipe$enq__ENA & pipe$enq__RDY;
    assign method$zsay4__ENA = ( pipe$enq$v[ 31 : 16 ] == 16'd3 ) & pipe$enq__ENA & pipe$enq__RDY;
    assign pipe$enq__RDY = method$say__RDY & method$say2__RDY & method$setLeds__RDY & method$zsay4__RDY;
endmodule 

`default_nettype wire    // set back to default value
