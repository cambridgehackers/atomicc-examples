`include "wbpriarbiter.generated.vh"

`default_nettype none
module WbPriArbiter #(
    parameter integer OPT_ZERO_ON_IDLE = 0,
    parameter integer F_OPT_CLK2FFLOGIC = 1)(
    input wire CLK, input wire nRST,
    input wire a$cyc__ENA,
    input wire a$cyc$stb,
    input wire a$cyc$we,
    input wire [32 - 1:0]a$cyc$adr,
    input wire [32 - 1:0]a$cyc$dat,
    input wire [32/8 - 1:0]a$cyc$sel,
    output wire a$cyc__RDY,
    output wire a$ack,
    output wire a$ack__RDY,
    output wire a$stall,
    output wire a$stall__RDY,
    output wire a$err,
    output wire a$err__RDY,
    input wire b$cyc__ENA,
    input wire b$cyc$stb,
    input wire b$cyc$we,
    input wire [32 - 1:0]b$cyc$adr,
    input wire [32 - 1:0]b$cyc$dat,
    input wire [32/8 - 1:0]b$cyc$sel,
    output wire b$cyc__RDY,
    output wire b$ack,
    output wire b$ack__RDY,
    output wire b$stall,
    output wire b$stall__RDY,
    output wire b$err,
    output wire b$err__RDY,
    output wire o$cyc__ENA,
    output wire o$cyc$stb,
    output wire o$cyc$we,
    output wire [32 - 1:0]o$cyc$adr,
    output wire [32 - 1:0]o$cyc$dat,
    output wire [32/8 - 1:0]o$cyc$sel,
    input wire o$cyc__RDY,
    input wire o$ack,
    input wire o$ack__RDY,
    input wire o$stall,
    input wire o$stall__RDY,
    input wire o$err,
    input wire o$err__RDY);
    reg r_a_owner;
    assign a$ack = o$ack && r_a_owner;
    assign a$ack__RDY = o$ack__RDY;
    assign a$cyc__RDY = o$cyc__RDY;
    assign a$err = o$err && r_a_owner;
    assign a$err__RDY = o$err__RDY;
    assign a$stall = o$stall || ( !r_a_owner );
    assign a$stall__RDY = o$stall__RDY;
    assign b$ack = !( r_a_owner || ( !o$ack ) );
    assign b$ack__RDY = o$ack__RDY;
    assign b$cyc__RDY = ( a$cyc__ENA == 0 ) && o$cyc__RDY;
    assign b$err = !( r_a_owner || ( !o$err ) );
    assign b$err__RDY = o$err__RDY;
    assign b$stall = o$stall || r_a_owner;
    assign b$stall__RDY = o$stall__RDY;
    assign o$cyc$adr = ( ( a$cyc__ENA && o$cyc__RDY ) ? a$cyc$adr : 32'd0 ) | ( ( b$cyc__ENA && b$cyc__RDY ) ? b$cyc$adr : 32'd0 );
    assign o$cyc$dat = ( ( a$cyc__ENA && o$cyc__RDY ) ? a$cyc$dat : 32'd0 ) | ( ( b$cyc__ENA && b$cyc__RDY ) ? b$cyc$dat : 32'd0 );
    assign o$cyc$sel = ( ( a$cyc__ENA && o$cyc__RDY ) ? a$cyc$sel : 32 / 8'd0 ) | ( ( b$cyc__ENA && b$cyc__RDY ) ? b$cyc$sel : 32 / 8'd0 );
    assign o$cyc$stb = ( a$cyc__ENA && ( ( o$cyc__RDY && ( a$cyc$stb || ( b$cyc__ENA && b$cyc__RDY && b$cyc$stb ) ) ) || ( ( !o$cyc__RDY ) && b$cyc__ENA && b$cyc__RDY && b$cyc$stb ) ) ) || ( ( !a$cyc__ENA ) && b$cyc__ENA && b$cyc__RDY && b$cyc$stb );
    assign o$cyc$we = ( a$cyc__ENA && ( ( o$cyc__RDY && ( a$cyc$we || ( b$cyc__ENA && b$cyc__RDY && b$cyc$we ) ) ) || ( ( !o$cyc__RDY ) && b$cyc__ENA && b$cyc__RDY && b$cyc$we ) ) ) || ( ( !a$cyc__ENA ) && b$cyc__ENA && b$cyc__RDY && b$cyc$we );
    assign o$cyc__ENA = a$cyc__ENA || ( b$cyc__ENA && ( a$cyc__ENA == 0 ) );

    always @( posedge CLK) begin
      if (!nRST) begin
        r_a_owner <= 0;
      end // nRST
      else begin
        if (a$cyc__ENA && o$cyc__RDY) begin // a$cyc__ENA
            r_a_owner <= 1;
        end; // End of a$cyc__ENA
        if (b$cyc__ENA && b$cyc__RDY) begin // b$cyc__ENA
            r_a_owner <= 0;
        end; // End of b$cyc__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
