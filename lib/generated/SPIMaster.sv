`include "atomicc.generated.vh"
`default_nettype none
module SPIMaster #(
    parameter integer width = 26)(
    input wire CLK,
    input wire nRST,
    output wire clock,
    output wire mosi,
    input wire miso,
    PipeIn.server request,
    PipeIn.client response);
    logic clockDivider$CLK_OUT;
    PipeIn#(.width(width)) spi$request();
    PipeIn#(.width(width)) spi$response();
    PipeIn#(.width(width)) spiresponse();
    ClockDiv#(.lower(10)) clockDivider (
        .CLK(CLK),
        .CLK_OUT(clockDivider$CLK_OUT),
        .nRST(nRST));
    SPIMasterInternal#(.width(width)) spi (
        .CLK(clockDivider$CLK_OUT),
        .nRST(nRST),
        .clock(clock),
        .mosi(mosi),
        .miso(miso),
        .request(spi$request),
        .response(spiresponse));
    // Extra assigments, not to output wires
    assign request.enq__RDY = 1'd1;
    assign spiresponse.enq__RDY = 1'd1;
endmodule

`default_nettype wire    // set back to default value
