`include "wbpriarbiter.generated.vh"

`default_nettype none
module WbPriArbiter #(
    parameter integer OPT_ZERO_ON_IDLE = 0,
    parameter integer F_OPT_CLK2FFLOGIC = 1)(
    input wire CLK, input wire nRST,
    WishboneType.server a,
    WishboneType.server b,
    WishboneType.client o);
    reg r_a_owner;
    // Extra assigments, not to output wires
    assign a.ack = o.ack && r_a_owner;
    assign a.ack__RDY = o.ack__RDY;
    assign a.err = o.err && r_a_owner;
    assign a.err__RDY = o.err__RDY;
    assign a.stall = o.stall || ( !r_a_owner );
    assign a.stall__RDY = o.stall__RDY;
    assign a.stb__RDY = !( ( 0 == acyc ) || ( !o.stb__RDY ) );
    assign b.ack = !( r_a_owner || ( !o.ack ) );
    assign b.ack__RDY = o.ack__RDY;
    assign b.err = !( r_a_owner || ( !o.err ) );
    assign b.err__RDY = o.err__RDY;
    assign b.stall = o.stall || r_a_owner;
    assign b.stall__RDY = o.stall__RDY;
    assign b.stb__RDY = !( ( 0 == ( acyc ^ 1 ) ) || ( !o.stb__RDY ) );
    assign o.stb$addr = ( ( a.stb__ENA && a.stb__RDY ) ? a.stb$addr : 0 ) | ( ( b.stb__ENA && b.stb__RDY ) ? b.stb$addr : 0 );
    assign o.stb$data = ( ( a.stb__ENA && a.stb__RDY ) ? a.stb$data : 0 ) | ( ( b.stb__ENA && b.stb__RDY ) ? b.stb$data : 0 );
    assign o.stb$sel = ( ( a.stb__ENA && a.stb__RDY ) ? a.stb$sel : 0 ) | ( ( b.stb__ENA && b.stb__RDY ) ? b.stb$sel : 0 );
    assign o.stb$we = ( ( a.stb__ENA && a.stb__RDY ) ? a.stb$we : 0 ) | ( ( b.stb__ENA && b.stb__RDY ) ? b.stb$we : 0 );
    assign o.stb__ENA = ( a.stb__ENA && ( a.stb__RDY || ( b.stb__ENA && b.stb__RDY ) ) ) || ( ( !a.stb__ENA ) && b.stb__ENA && b.stb__RDY );

    always @( posedge CLK) begin
      if (!nRST) begin
        r_a_owner <= 0;
      end // nRST
      else begin
        if (a.stb__ENA && a.stb__RDY) begin // a.stb__ENA
            r_a_owner <= 1;
        end; // End of a.stb__ENA
        if (b.stb__ENA && b.stb__RDY) begin // b.stb__ENA
            r_a_owner <= 0;
        end; // End of b.stb__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
