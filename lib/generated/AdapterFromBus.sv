`include "adapter.generated.vh"

`default_nettype none
module AdapterFromBus #(
    parameter integer width = 32)(
    input wire CLK, input wire nRST,
    input wire in$enq__ENA,
    input wire [width - 1:0]in$enq$v,
    input wire in$enq$last,
    output wire in$enq__RDY,
    output wire out$enq__ENA,
    output wire [(16 + 128) - 1:0]out$enq$v,
    input wire out$enq__RDY);
    reg [144 - 1:0]buffer;
    reg [16 - 1:0]length;
    reg waitForEnq;
    wire [(16 + 128) - 1:0]RULE$pushValue$agg_2e_tmp;
    wire RULE$pushValue__RDY;
    wire [16 - 1:0]in$enq$newLength;
    assign in$enq__RDY = !( 0 == ( waitForEnq ^ 1 ) );
    assign out$enq$v = RULE$pushValue$agg_2e_tmp;
    assign out$enq__ENA = RULE$pushValue__RDY;
    // Extra assigments, not to output wires
    assign RULE$pushValue$agg_2e_tmp = buffer;
    assign RULE$pushValue__RDY = !( ( 0 == waitForEnq ) || ( !out$enq__RDY ) );
    assign in$enq$newLength = length + 16'd1;

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
        if (in$enq__ENA && in$enq__RDY) begin // in$enq__ENA
            buffer <= { in$enq$v , buffer[ ( 144 - 1 ) : ( 16 + width ) ] , in$enq$newLength };
            length <= in$enq$newLength;
            if (in$enq$last)
            waitForEnq <= 1;
            if (!( 0 == 0 ))
            $display( "adapterFROMin %x last %x buffer %x" , in$enq$v , in$enq$last , buffer );
        end; // End of in$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
