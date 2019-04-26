`include "fifo.generated.vh"

`default_nettype none
module FifoB1Base #(
    parameter integer width = 0)(
    input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [width- 1:0]in$enq$v,
    output wire in$enq__RDY,
    input wire out$deq__ENA,
    output wire out$deq__RDY,
    output wire [width- 1:0]out$first,
    output wire out$first__RDY);
    reg [width- 1:0]element;
    reg full;
    assign in$enq__RDY = ( ( full ^ 1 ) | out$deq__ENA ) != 0;
    assign out$deq__RDY = full | in$enq__ENA;
    assign out$first = full ? element : in$enq$v;
    assign out$first__RDY = full | in$enq__ENA;

    always @( posedge CLK) begin
      if (!nRST) begin
        element <= 0;
        full <= 0;
      end // nRST
      else begin
        if (in$enq__ENA & in$enq__RDY) begin // in$enq__ENA
            element <= in$enq$v;
            if (out$deq__ENA == 0)
            full <= 1;
        end; // End of in$enq__ENA
        if (out$deq__ENA & ( full | in$enq__ENA )) begin // out$deq__ENA
            full <= 0;
        end; // End of out$deq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
