`include "atomicc.generated.vh"
`default_nettype none
module SPIMasterInternal #(
    parameter integer width = 26)(
    input wire CLK,
    input wire nRST,
    output wire clock,
    output wire mosi,
    input wire miso,
    PipeIn.server request,
    PipeIn.client response);
    reg [$clog2(width)+1 - 1:0]countreg;
    reg [width - 1:0]shiftreg;
    logic RULE$running__ENA;
    logic RULE$running__RDY;
    logic [width - 1:0]_RULE$running$newshiftreg;
    assign clock = ( !CLK ) && 1'd1;
    assign mosi = shiftreg[ width - 1 ];
    // Extra assigments, not to output wires
    assign RULE$running__ENA = ( ( countreg > 0 ) != 0 ) && ( response.enq__RDY || ( countreg != 1 ) );
    assign RULE$running__RDY = ( ( countreg > 0 ) != 0 ) && ( response.enq__RDY || ( countreg != 1 ) );
    assign _RULE$running$newshiftreg = { shiftreg[ ( width - 2 ) : 0 ] , miso };
    assign request.enq__RDY = countreg == 0;
    assign response.enq$v = { shiftreg[ ( width - 2 ) : 0 ] , miso };
    assign response.enq__ENA = ( ( countreg > 0 ) != 0 ) && ( countreg == 1 );

    always @( posedge CLK) begin
      if (!nRST) begin
        countreg <= 0;
        shiftreg <= 0;
      end // nRST
      else begin
        if (RULE$running__RDY && RULE$running__ENA) begin // RULE$running__ENA
            countreg <= countreg - 1;
            shiftreg <= _RULE$running$newshiftreg;
        end; // End of RULE$running__ENA
        if (( countreg == 0 ) && request.enq__ENA) begin // request.enq__ENA
            shiftreg <= request.enq$v;
            countreg <= width;
        end; // End of request.enq__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
