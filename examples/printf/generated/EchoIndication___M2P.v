`include "printf.generated.vh"

module EchoIndication___M2P (input CLK, input nRST,
    input method$heard__ENA,
    input [31:0]method$heard$v,
    input method$heard2__ENA,
    input [15:0]method$heard2$a,
    input [15:0]method$heard2$b,
    output method$heard2__RDY,
    input method$heard3__ENA,
    input [15:0]method$heard3$a,
    input [31:0]method$heard3$b,
    input [31:0]method$heard3$c,
    input [15:0]method$heard3$d,
    output method$heard3__RDY,
    output method$heard__RDY,
    output pipe$enq__ENA,
    output [127:0]pipe$enq$v,
    input pipe$enq__RDY);
    assign method$heard2__RDY = pipe$enq__RDY ;
    assign method$heard3__RDY = pipe$enq__RDY ;
    assign method$heard__RDY = pipe$enq__RDY ;
    assign pipe$enq$v = ( method$heard__ENA  & method$heard__RDY  ) ? ( { 64'd0, method$heard$v, 16'd0, 16'd2}  ) : ( method$heard2__ENA  & method$heard2__RDY  ) ? ( { 64'd0, method$heard2$b, method$heard2$a, 16'd1, 16'd2}  ) : ( { method$heard3$d, method$heard3$c, method$heard3$b, method$heard3$a, 16'd2, 16'd4}  );
    assign pipe$enq__ENA = method$heard__ENA  || method$heard2__ENA  || method$heard3__ENA ;
endmodule 

