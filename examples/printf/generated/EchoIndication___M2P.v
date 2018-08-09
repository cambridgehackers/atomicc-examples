`include "printf.generated.vh"

`default_nettype none
module EchoIndication___M2P (input wire CLK, input wire nRST,
    input wire method$heard__ENA,
    input wire [31:0]method$heard$v,
    input wire method$heard2__ENA,
    input wire [15:0]method$heard2$a,
    input wire [15:0]method$heard2$b,
    output wire method$heard2__RDY,
    input wire method$heard3__ENA,
    input wire [15:0]method$heard3$a,
    input wire [31:0]method$heard3$b,
    input wire [31:0]method$heard3$c,
    input wire [15:0]method$heard3$d,
    output wire method$heard3__RDY,
    output wire method$heard__RDY,
    output wire pipe$enq__ENA,
    output wire [127:0]pipe$enq$v,
    input wire pipe$enq__RDY);
    assign method$heard2__RDY = pipe$enq__RDY;
    assign method$heard3__RDY = pipe$enq__RDY;
    assign method$heard__RDY = pipe$enq__RDY;
    assign pipe$enq$v = ( method$heard__ENA ? ( { 64'd0, method$heard$v, 16'd0, 16'd2} ) : 0 ) | ( method$heard2__ENA ? ( { 64'd0, method$heard2$b, method$heard2$a, 16'd1, 16'd2} ) : 0 ) | ( method$heard3__ENA ? ( { method$heard3$d, method$heard3$c, method$heard3$b, method$heard3$a, 16'd2, 16'd4} ) : 0 );
    assign pipe$enq__ENA = method$heard__ENA | method$heard2__ENA | method$heard3__ENA;
endmodule 

`default_nettype wire    // set back to default value
