`include "packing.generated.vh"

`default_nettype none
module Pack (input wire CLK, input wire nRST,
    PackRequest.server request,
    PackIndication.client indication);
    reg [32 - 1:0]counter;
    reg [8 - 1:0]readCount;
    reg [8 - 1:0]seqval;
    reg [8 - 1:0]writeCount;
    // Extra assigments, not to output wires
    assign indication.heard$readCount = readCount + 64;
    assign indication.heard$seqno = seqval;
    assign indication.heard$v = request.say$v;
    assign indication.heard$writeCount = writeCount + 32;
    assign indication.heard__ENA = request.say__ENA;
    assign request.say__RDY = indication.heard__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        counter <= 0;
        readCount <= 0;
        seqval <= 0;
        writeCount <= 0;
      end // nRST
      else begin
        if (request.say__ENA && request.say__RDY) begin // request.say__ENA
            seqval <= request.say$seqno;
            writeCount <= writeCount + 1;
            counter <= counter + ( -1 );
            readCount <= readCount + 16;
            $display( "REQUESTSAY v %x write %x read %x seqno %x" , request.say$v , writeCount + 32 , readCount + 64 , request.say$seqno );
        end; // End of request.say__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
