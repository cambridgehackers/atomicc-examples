`include "lpm.generated.vh"

`default_nettype none
module LpmTest (input wire CLK, input wire nRST,
    LpmRequest.server request,
    LpmIndication.client indication);
    PipeIn#(.width(32)) response();
    PipeIn#(.width(32)) test$outQ();
    Lpm test (.CLK(CLK), .nRST(nRST),
        .enter__ENA(request.enter__ENA),
        .enter$x(request.enter__ENA ? request.enter$data : 32'd0),
        .enter__RDY(request.enter__RDY),
        .write__ENA(request.write__ENA),
        .write$addr(request.write__ENA ? request.write$addr : 32'd0),
        .write$data(request.write__ENA ? request.write$data : 32'd0),
        .write__RDY(request.write__RDY),
        .outQ(response));
    // Extra assigments, not to output wires
    assign indication.out$data = response.enq__ENA ? response.enq$v : 0;
    assign indication.out__ENA = response.enq__ENA;
    assign response.enq__RDY = indication.out__RDY;
endmodule

`default_nettype wire    // set back to default value
