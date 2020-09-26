`include "adapter.generated.vh"

`default_nettype none
module AdapterFromBus #(
    parameter integer width = 32)(
    input wire CLK, input wire nRST,
    PipeInB.server in,
    PipeIn.client out);
    reg [128 - 1:0]buffer;
    reg [16 - 1:0]length;
    reg waitForEnq;
    logic RULE$pushValue__RDY;
    NOCDataH _RULE$pushValue$agg_2e_tmp;
    // Extra assigments, not to output wires
    assign RULE$pushValue__RDY = !( ( 0 == waitForEnq ) || ( !out.enq__RDY ) );
    assign _RULE$pushValue$agg_2e_tmp.data = buffer;
    assign _RULE$pushValue$agg_2e_tmp.length = length;
    assign in.enq__RDY = !( 0 == ( waitForEnq ^ 1 ) );
    assign out.enq$v = _RULE$pushValue$agg_2e_tmp;
    assign out.enq__ENA = RULE$pushValue__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        buffer <= 0;
        length <= 0;
        waitForEnq <= 0;
      end // nRST
      else begin
        if (RULE$pushValue__RDY) begin // RULE$pushValue__ENA
            length <= 0;
            waitForEnq <= 0;
            if (!( 0 == 0 ))
            $display( "adapterFROMout %x" , buffer );
        end; // End of RULE$pushValue__ENA
        if (in.enq__ENA && in.enq__RDY) begin // in.enq__ENA
            buffer <= { in.enq$v , buffer[ ( 128 - 1 ) : width ] };
            length <= length + 1;
            if (!( 0 == 0 ))
            $display( "adapterFROMin %x last %x buffer %x" , in.enq$v , in.enq$last , buffer );
            if (in.enq$last)
            waitForEnq <= 1;
        end; // End of in.enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
