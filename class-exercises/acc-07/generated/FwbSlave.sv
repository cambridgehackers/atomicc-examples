`include "wbpriarbiter.generated.vh"

`default_nettype none
module FwbSlave (input wire CLK, input wire nRST,
    output wire [(32 / 8) - 1:0]f_nreqs,
    output wire f_nreqs__RDY,
    output wire [(32 / 8) - 1:0]f_nacks,
    output wire f_nacks__RDY,
    output wire [(32 / 8) - 1:0]f_outstanding,
    output wire f_outstanding__RDY,
    input wire a$cyc__ENA,
    input wire a$cyc$stb,
    input wire a$cyc$we,
    input wire [32 - 1:0]a$cyc$addr,
    input wire [32 - 1:0]a$cyc$data,
    input wire [(32 / 8) - 1:0]a$cyc$sel,
    output wire a$cyc__RDY,
    input wire status$ack,
    input wire status$ack__RDY,
    input wire status$stall,
    input wire status$stall__RDY,
    input wire status$err,
    input wire status$err__RDY);
    reg f_past_valid;
    reg [(32 / 8) - 1:0]nacks;
    reg [(32 / 8) - 1:0]nreqs;
    wire RULE$init3__RDY;
    wire RULE$init4__RDY;
    wire stb_share;
    assign a$cyc__RDY = 1;
    assign f_nacks = nacks;
    assign f_nacks__RDY = 1;
    assign f_nreqs = nreqs;
    assign f_nreqs__RDY = 1;
    assign f_outstanding = !( ( a$cyc__ENA == 0 ) || ( !( nreqs - nacks ) ) );
    assign f_outstanding__RDY = 1;
    // Extra assigments, not to output wires
    assign RULE$init3__RDY = status$ack__RDY && ( status$ack || status$err__RDY );
    assign RULE$init4__RDY = status$stall__RDY || ( !stb_share );
    assign stb_share = a$cyc$stb;

    always @( posedge CLK) begin
      if (!nRST) begin
        f_past_valid <= 0;
        nacks <= 0;
        nreqs <= 0;
      end // nRST
      else begin
        // RULE$init2__ENA
            if (a$cyc__ENA == 0)
            nacks <= 0;
        // End of RULE$init2__ENA
        if (RULE$init3__RDY) begin // RULE$init3__ENA
            if (status$err || status$ack)
            nacks <= nacks + 1;
        end; // End of RULE$init3__ENA
        if (RULE$init4__RDY) begin // RULE$init4__ENA
            if (a$cyc__ENA == 0)
            nreqs <= 0;
            if (!( status$stall || ( !stb_share ) ))
            nreqs <= nreqs + 1;
        end; // End of RULE$init4__ENA
        // RULE$init__ENA
            f_past_valid <= 1;
        // End of RULE$init__ENA
      end
    end // always @ (posedge CLK)
`ifdef	FORMAL
    always @( posedge CLK)
        if (!( ( status$stall__RDY && f_past_valid ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid ) ) ))
            assert( !nRST );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && $past( ( nRST != 0 ) ^ 1 ) ) || ( ( !status$stall__RDY ) && ( !( $past{ stb_share } || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) ) ) ))
            assert( !cyc__ENA );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && $past( ( nRST != 0 ) ^ 1 ) ) || ( ( !status$stall__RDY ) && ( !( $past{ stb_share } || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) ) ) ))
            assert( !stb_share );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && $past( ( nRST != 0 ) ^ 1 ) ) || ( ( !status$stall__RDY ) && ( !( $past{ stb_share } || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) ) ) ))
            assert( !status$ack( ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && $past( ( nRST != 0 ) ^ 1 ) ) || ( ( !status$stall__RDY ) && ( !( $past{ stb_share } || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) ) ) ))
            assert( !status$err( ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && $past( a$cyc__ENA ) ) || ( ( !status$stall__RDY ) && ( !( $past{ stb_share } || ( !$past( a$cyc__ENA ) ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !$past( a$cyc__ENA ) ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid || ( !$past( a$cyc__ENA ) ) ) ) ) ) ))
            assert( !cyc__ENA );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && stb_share ) || ( ( !status$stall__RDY ) && ( !( $past{ stb_share } || ( !stb_share ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !stb_share ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid || ( !stb_share ) ) ) ) ) ))
            assert( cyc__ENA );
    always @( posedge CLK)
        if (!( ( status$err__RDY && ( ( status$stall__RDY && ( a$cyc__ENA == 0 ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || ( a$cyc__ENA == 0 ) ) ) ) ) || ( ( !status$err__RDY ) && ( ( status$stall__RDY && ( f_past_valid || ( a$cyc__ENA == 0 ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid || ( a$cyc__ENA == 0 ) ) ) ) ) ))
            assert( stb_share );
    always @( posedge CLK)
        if (!( ( status$err__RDY && ( ( status$stall__RDY && ( a$cyc__ENA == 0 ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || ( a$cyc__ENA == 0 ) ) ) ) ) || ( ( !status$err__RDY ) && ( ( status$stall__RDY && ( f_past_valid || ( a$cyc__ENA == 0 ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid || ( a$cyc__ENA == 0 ) ) ) ) ) ))
            assert( we_share == $past( we_share ) );
    always @( posedge CLK)
        if (!( ( status$err__RDY && ( ( status$stall__RDY && ( a$cyc__ENA == 0 ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || ( a$cyc__ENA == 0 ) ) ) ) ) || ( ( !status$err__RDY ) && ( ( status$stall__RDY && ( f_past_valid || ( a$cyc__ENA == 0 ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid || ( a$cyc__ENA == 0 ) ) ) ) ) ))
            assert( addr_share == $past( addr_share ) );
    always @( posedge CLK)
        if (!( ( status$err__RDY && ( ( status$stall__RDY && ( a$cyc__ENA == 0 ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || ( a$cyc__ENA == 0 ) ) ) ) ) || ( ( !status$err__RDY ) && ( ( status$stall__RDY && ( f_past_valid || ( a$cyc__ENA == 0 ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid || ( a$cyc__ENA == 0 ) ) ) ) ) ))
            assert( sel_share == $past( sel_share ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && we_share ) || ( ( !status$stall__RDY ) && ( !( $past{ stb_share } || ( !we_share ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !we_share ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid || ( !we_share ) ) ) ) ) ))
            assert( data_share == $past( data_share ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && stb_share ) || ( ( !status$stall__RDY ) && ( !( $past{ stb_share } || ( !stb_share ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !stb_share ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid || ( !stb_share ) ) ) ) ) ))
            assert( we_share == $past( we_share ) );
    always @( posedge CLK)
        if (status$err__RDY && ( ( status$stall__RDY && f_past_valid && a$cyc__ENA && ( nreqs - nacks ) ) || ( ( !status$stall__RDY ) && ( !( $past{ stb_share } || ( !( f_past_valid && a$cyc__ENA && ( nreqs - nacks ) ) ) ) ) ) ))
            assert( we_share == $past( we_share ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && ( a$cyc__ENA == 0 ) ) || ( ( !status$stall__RDY ) && ( !( $past{ stb_share } || ( !( a$cyc__ENA == 0 ) ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !( a$cyc__ENA == 0 ) ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid || ( !( a$cyc__ENA == 0 ) ) ) ) ) ) ))
            assert( !status$ack( ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && ( a$cyc__ENA == 0 ) ) || ( ( !status$stall__RDY ) && ( !( $past{ stb_share } || ( !( a$cyc__ENA == 0 ) ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !( a$cyc__ENA == 0 ) ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid || ( !( a$cyc__ENA == 0 ) ) ) ) ) ) ))
            assert( !status$err( ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( status$stall__RDY || ( !$past{ stb_share } ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && f_past_valid ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid ) ) ) ) ))
            assert( ( !status$ack( ) ) || ( !status$err( ) ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( status$stall__RDY || ( !$past{ stb_share } ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && f_past_valid ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid ) ) ) ) ))
            assert( f_outstanding( ) < ( ( 1 << 4 ) - 1 ) );
    always @( posedge CLK)
        if (!( ( status$err__RDY && ( ( status$stall__RDY && ( ( a$cyc__ENA && ( ( a$cyc__ENA == 0 ) || ( nreqs - nacks ) ) ) || ( ( !a$cyc__ENA ) && ( a$cyc__ENA == 0 ) ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || ( a$cyc__ENA && ( ( a$cyc__ENA == 0 ) || ( nreqs - nacks ) ) ) || ( ( !a$cyc__ENA ) && ( a$cyc__ENA == 0 ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( ( status$stall__RDY && ( f_past_valid || ( a$cyc__ENA && ( ( a$cyc__ENA == 0 ) || ( nreqs - nacks ) ) ) || ( ( !a$cyc__ENA ) && ( a$cyc__ENA == 0 ) ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid || ( a$cyc__ENA && ( ( a$cyc__ENA == 0 ) || ( nreqs - nacks ) ) ) || ( ( !a$cyc__ENA ) && ( a$cyc__ENA == 0 ) ) ) ) ) ) ))
            assert( ( !status$ack( ) ) || ( stb_share && ( !status$stall( ) ) ) );
    always @( posedge CLK)
        if (!( ( status$err__RDY && ( ( status$stall__RDY && ( ( a$cyc__ENA && ( ( a$cyc__ENA == 0 ) || ( nreqs - nacks ) ) ) || ( ( !a$cyc__ENA ) && ( a$cyc__ENA == 0 ) ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || ( a$cyc__ENA && ( ( a$cyc__ENA == 0 ) || ( nreqs - nacks ) ) ) || ( ( !a$cyc__ENA ) && ( a$cyc__ENA == 0 ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( ( status$stall__RDY && ( f_past_valid || ( a$cyc__ENA && ( ( a$cyc__ENA == 0 ) || ( nreqs - nacks ) ) ) || ( ( !a$cyc__ENA ) && ( a$cyc__ENA == 0 ) ) ) ) || ( ( !status$stall__RDY ) && ( $past{ stb_share } || f_past_valid || ( a$cyc__ENA && ( ( a$cyc__ENA == 0 ) || ( nreqs - nacks ) ) ) || ( ( !a$cyc__ENA ) && ( a$cyc__ENA == 0 ) ) ) ) ) ) ))
            assert( ( !status$err( ) ) || ( stb_share && ( !status$stall( ) ) ) );
`endif
endmodule

`default_nettype wire    // set back to default value
