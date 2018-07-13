`include "connect.generated.vh"

module Echo (input CLK, input nRST,
    input request$say__ENA,
    input [31:0]request$say$meth,
    input [31:0]request$say$v,
    output request$say__RDY,
    output indication$heard__ENA,
    output [31:0]indication$heard$meth,
    output [31:0]indication$heard$v,
    input indication$heard__RDY);
    assign indication$heard$meth = request$say$meth ;
    assign indication$heard$v = request$say$v ;
    assign indication$heard__ENA = request$say__ENA ;
    assign request$say__RDY = indication$heard__RDY ;
endmodule 

