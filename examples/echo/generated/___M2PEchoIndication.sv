`include "echo.generated.vh"

`default_nettype none
module ___M2PEchoIndication (input wire CLK, input wire nRST,
    EchoIndication.server method,
    PipeIn.client pipe);
    // Extra assigments, not to output wires
    assign method.heard__RDY = pipe.enq__RDY;
    assign method.heards__RDY = pipe.enq__RDY;
    assign pipe.enq__ENA = method.heard__ENA | method.heards__ENA;
    always_comb begin
    pipe.enq$v = 0;
    unique case(1'b1)
    method.heard__ENA: pipe.enq$v = { 16'd0 , 16'd5 , method.heard$v , 64'd0 , 16'd64 };
    method.heards__ENA: pipe.enq$v = { 16'd1 , 16'd5 , method.heards$ahEnd , method.heards$ahFrontEnd , method.heards$ahBackSync , method.heards$ahSyncWidth , method.heards$avEnd , method.heards$avFrontEnd , method.heards$avBackSync , method.heards$avSyncWidth , 16'd128 };
    endcase
    end
endmodule

`default_nettype wire    // set back to default value
