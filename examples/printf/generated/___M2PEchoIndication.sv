`include "printf.generated.vh"

`default_nettype none
module ___M2PEchoIndication (input wire CLK, input wire nRST,
    EchoIndication.server method,
    PipeIn.client pipe);
    // Extra assigments, not to output wires
    assign method.heard2__RDY = pipe.enq__RDY;
    assign method.heard3__RDY = pipe.enq__RDY;
    assign method.heard__RDY = pipe.enq__RDY;
    assign pipe.enq__ENA = method.heard__ENA | method.heard2__ENA | method.heard3__ENA;
    always_comb begin
    pipe.enq$v = 0;
    unique case(1'b1)
    method.heard__ENA: pipe.enq$v = { 16'd0 , 16'd5 , method.heard$v , 64'd0 , 16'd2 };
    method.heard2__ENA: pipe.enq$v = { 16'd1 , 16'd5 , method.heard2$a , method.heard2$b , 64'd0 , 16'd2 };
    method.heard3__ENA: pipe.enq$v = { 16'd2 , 16'd5 , method.heard3$a , method.heard3$b , method.heard3$c , method.heard3$d , 16'd4 };
    endcase
    end
endmodule

`default_nettype wire    // set back to default value
