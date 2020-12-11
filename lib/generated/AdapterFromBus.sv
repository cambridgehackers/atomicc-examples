`include "adapter.generated.vh"

`default_nettype none
module AdapterFromBus #(
    parameter integer owidth = 32,
    parameter integer width = 144)(
    input wire CLK, input wire nRST,
    PipeInLast.server in,
    PipeIn.client out);
    reg [128 - 1:0]buffer;
    reg [16 - 1:0]length;
    reg waitForEnq;
    logic RULE$pushValue__ENA;
    NOCDataH _RULE$pushValue$agg_2e_tmp;
    // Extra assigments, not to output wires
    assign RULE$pushValue__ENA = waitForEnq && out.enq__RDY;
    assign _RULE$pushValue$agg_2e_tmp.data = buffer;
    assign _RULE$pushValue$agg_2e_tmp.length = length;
    assign in.enq__RDY = !waitForEnq;
    assign out.enq$v = _RULE$pushValue$agg_2e_tmp;
    assign out.enq__ENA = waitForEnq;

    always @( posedge CLK) begin
      if (!nRST) begin
        buffer <= 0;
        length <= 0;
        waitForEnq <= 0;
      end // nRST
      else begin
        if (waitForEnq && out.enq__RDY && RULE$pushValue__ENA) begin // RULE$pushValue__ENA
            length <= 16'd0;
            waitForEnq <= 1'd0;
            if (0 != 0)
            $display( "adapterFROMout %x" , buffer );
        end; // End of RULE$pushValue__ENA
        if (( !waitForEnq ) && in.enq__ENA) begin // in.enq__ENA
            buffer <= { in.enq$v , buffer[ ( 128 - 1 ) : owidth ] };
            length <= length + ( (16'(owidth)) );
            if (0 != 0)
            $display( "adapterFROMin %x last %x buffer %x" , in.enq$v , in.enq$last , buffer );
            if (in.enq$last)
            waitForEnq <= 1'd1;
        end; // End of in.enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
