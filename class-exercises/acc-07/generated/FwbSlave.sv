`include "wbpriarbiter.generated.vh"

`default_nettype none
module FwbSlave (
    output wire [(32 / 8) - 1:0]f_nreqs,
    output wire f_nreqs__RDY,
    output wire [(32 / 8) - 1:0]f_nacks,
    output wire f_nacks__RDY,
    output wire [(32 / 8) - 1:0]f_outstanding,
    output wire f_outstanding__RDY,
    input wire a$stb__ENA,
    input wire a$stb$we,
    input wire [32 - 1:0]a$stb$addr,
    input wire [32 - 1:0]a$stb$data,
    input wire [(32 / 8) - 1:0]a$stb$sel,
    output wire a$stb__RDY,
    input wire status$ack,
    input wire status$ack__RDY,
    input wire status$stall,
    input wire status$stall__RDY,
    input wire status$err,
    input wire status$err__RDY,
    input wire acyc);
    reg f_past_valid;
    reg [(32 / 8) - 1:0]nacks;
    reg [(32 / 8) - 1:0]nreqs;
    wire CLK;
    wire RULE$init3__RDY;
    wire RULE$init4__RDY;
    wire nRST;
    assign a$stb__RDY = 1;
    assign f_nacks = nacks;
    assign f_nacks__RDY = 1;
    assign f_nreqs = nreqs;
    assign f_nreqs__RDY = 1;
    assign f_outstanding = acyc && ( nreqs - nacks );
    assign f_outstanding__RDY = 1;
    // Extra assigments, not to output wires
    assign RULE$init3__RDY = status$ack__RDY && ( status$ack || status$err__RDY );
    assign RULE$init4__RDY = ( a$stb__ENA == 0 ) || status$stall__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        f_past_valid <= 0;
        nacks <= 0;
        nreqs <= 0;
      end // nRST
      else begin
        // RULE$init2__ENA
            if (!acyc)
            nacks <= 0;
        // End of RULE$init2__ENA
        if (RULE$init3__RDY) begin // RULE$init3__ENA
            if (status$err || status$ack)
            nacks <= nacks + 1;
        end; // End of RULE$init3__ENA
        if (RULE$init4__RDY) begin // RULE$init4__ENA
            if (!( status$stall || ( a$stb__ENA == 0 ) ))
            nreqs <= nreqs + 1;
            if (!acyc)
            nreqs <= 0;
        end; // End of RULE$init4__ENA
        // RULE$init__ENA
            f_past_valid <= 1;
        // End of RULE$init__ENA
      end
    end // always @ (posedge CLK)
`ifdef	FORMAL
    always @( posedge CLK)
        if (!( ( status$stall__RDY && f_past_valid ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid ) ) ))
            assert( !nRST );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && $past( ( nRST != 0 ) ^ 1 ) ) || ( ( !status$stall__RDY ) && ( !( $past{ a$stb__ENA } || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) ) ) ))
            assert( !a$cyc );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && $past( ( nRST != 0 ) ^ 1 ) ) || ( ( !status$stall__RDY ) && ( !( $past{ a$stb__ENA } || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) ) ) ))
            assert( !stb__ENA );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && $past( ( nRST != 0 ) ^ 1 ) ) || ( ( !status$stall__RDY ) && ( !( $past{ a$stb__ENA } || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) ) ) ))
            assert( !status$ack( ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && $past( ( nRST != 0 ) ^ 1 ) ) || ( ( !status$stall__RDY ) && ( !( $past{ a$stb__ENA } || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid || ( !$past( ( nRST != 0 ) ^ 1 ) ) ) ) ) ) ))
            assert( !status$err( ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && $past( acyc ) ) || ( ( !status$stall__RDY ) && ( !( $past{ a$stb__ENA } || ( !$past( acyc ) ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !$past( acyc ) ) ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid || ( !$past( acyc ) ) ) ) ) ) ))
            assert( !a$cyc );
    always @( posedge CLK)
        if (!( ( status$err__RDY && ( ( status$stall__RDY && ( a$stb__ENA == 0 ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || ( a$stb__ENA == 0 ) ) ) ) ) || ( ( !status$err__RDY ) && ( ( status$stall__RDY && ( f_past_valid || ( a$stb__ENA == 0 ) ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid || ( a$stb__ENA == 0 ) ) ) ) ) ))
            assert( a$cyc );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && acyc ) || ( ( !status$stall__RDY ) && ( !( $past{ a$stb__ENA } || ( !acyc ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !acyc ) ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid || ( !acyc ) ) ) ) ) ))
            assert( stb__ENA );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && acyc ) || ( ( !status$stall__RDY ) && ( !( $past{ a$stb__ENA } || ( !acyc ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !acyc ) ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid || ( !acyc ) ) ) ) ) ))
            assert( we_share == $past( we_share ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && acyc ) || ( ( !status$stall__RDY ) && ( !( $past{ a$stb__ENA } || ( !acyc ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !acyc ) ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid || ( !acyc ) ) ) ) ) ))
            assert( addr_share == $past( addr_share ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && acyc ) || ( ( !status$stall__RDY ) && ( !( $past{ a$stb__ENA } || ( !acyc ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !acyc ) ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid || ( !acyc ) ) ) ) ) ))
            assert( sel_share == $past( sel_share ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( status$stall__RDY && we_share ) || ( ( !status$stall__RDY ) && ( !( $past{ a$stb__ENA } || ( !we_share ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && ( f_past_valid || ( !we_share ) ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid || ( !we_share ) ) ) ) ) ))
            assert( data_share == $past( data_share ) );
    always @( posedge CLK)
        if (!( ( status$err__RDY && ( ( status$stall__RDY && ( a$stb__ENA == 0 ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || ( a$stb__ENA == 0 ) ) ) ) ) || ( ( !status$err__RDY ) && ( ( status$stall__RDY && ( f_past_valid || ( a$stb__ENA == 0 ) ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid || ( a$stb__ENA == 0 ) ) ) ) ) ))
            assert( we_share == $past( we_share ) );
    always @( posedge CLK)
        if (status$err__RDY && ( ( status$stall__RDY && f_past_valid && acyc && ( nreqs - nacks ) ) || ( ( !status$stall__RDY ) && ( !( $past{ a$stb__ENA } || ( !( f_past_valid && acyc && ( nreqs - nacks ) ) ) ) ) ) ))
            assert( we_share == $past( we_share ) );
    always @( posedge CLK)
        if (!( ( status$err__RDY && ( ( status$stall__RDY && acyc ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || acyc ) ) ) ) || ( ( !status$err__RDY ) && ( ( status$stall__RDY && ( f_past_valid || acyc ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid || acyc ) ) ) ) ))
            assert( !status$ack( ) );
    always @( posedge CLK)
        if (!( ( status$err__RDY && ( ( status$stall__RDY && acyc ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || acyc ) ) ) ) || ( ( !status$err__RDY ) && ( ( status$stall__RDY && ( f_past_valid || acyc ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid || acyc ) ) ) ) ))
            assert( !status$err( ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( status$stall__RDY || ( !$past{ a$stb__ENA } ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && f_past_valid ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid ) ) ) ) ))
            assert( ( !status$ack( ) ) || ( !status$err( ) ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( status$stall__RDY || ( !$past{ a$stb__ENA } ) ) ) || ( ( !status$err__RDY ) && ( !( ( status$stall__RDY && f_past_valid ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid ) ) ) ) ))
            assert( f_outstanding( ) < ( ( 1 << 4 ) - 1 ) );
    always @( posedge CLK)
        if (!( ( status$err__RDY && ( ( status$stall__RDY && ( ( nreqs - nacks ) || ( !acyc ) ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || ( nreqs - nacks ) || ( !acyc ) ) ) ) ) || ( ( !status$err__RDY ) && ( ( status$stall__RDY && ( f_past_valid || ( nreqs - nacks ) || ( !acyc ) ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid || ( nreqs - nacks ) || ( !acyc ) ) ) ) ) ))
            assert( ( !status$ack( ) ) || ( stb__ENA && ( !status$stall( ) ) ) );
    always @( posedge CLK)
        if (!( ( status$err__RDY && ( ( status$stall__RDY && ( ( nreqs - nacks ) || ( !acyc ) ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || ( nreqs - nacks ) || ( !acyc ) ) ) ) ) || ( ( !status$err__RDY ) && ( ( status$stall__RDY && ( f_past_valid || ( nreqs - nacks ) || ( !acyc ) ) ) || ( ( !status$stall__RDY ) && ( $past{ a$stb__ENA } || f_past_valid || ( nreqs - nacks ) || ( !acyc ) ) ) ) ) ))
            assert( ( !status$err( ) ) || ( stb__ENA && ( !status$stall( ) ) ) );
`endif
endmodule

`default_nettype wire    // set back to default value
