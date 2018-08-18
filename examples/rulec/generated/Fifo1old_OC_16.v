`include "zynqTop.generated.vh"

`default_nettype none
module Fifo1old_OC_16 (input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [15:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [15:0]out$first,
    output wire out$first__RDY);
    reg [4:0]element$ac$addr;
    reg [3:0]element$ac$count;
    reg [5:0]element$ac$id;
    reg element$last;
    reg full;
    Fifo1Base_OC_18 fifo (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(0),
        .in$enq$v(0),
        .in$enq__RDY(),
        .out$deq__ENA(0),
        .out$deq__RDY(),
        .out$first(),
        .out$first__RDY());
    assign in$enq__RDY = !full;
    assign out$deq__RDY = full;
    assign out$first = { element$ac$addr , element$ac$count , element$ac$id , element$last };
    assign out$first__RDY = full;

    always @( posedge CLK) begin
      if (!nRST) begin
        element$ac$addr <= 0;
        element$ac$count <= 0;
        element$ac$id <= 0;
        element$last <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA & ( !full )) begin // in$enq__ENA
            { element$ac$addr , element$ac$count , element$ac$id , element$last } <= in$enq$v;
            full <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA & full) begin // out$deq__ENA
            full <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
