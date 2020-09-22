`include "wbpriarbiter.generated.vh"

`default_nettype none
module FwbSlave (
    output wire [(32 / 8) - 1:0]f_nreqs,
    output wire f_nreqs__RDY,
    output wire [(32 / 8) - 1:0]f_nacks,
    output wire f_nacks__RDY,
    output wire [(32 / 8) - 1:0]f_outstanding,
    output wire f_outstanding__RDY,
    input wire acyc,
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
    input wire status$err__RDY);
    reg f_past_valid;
    reg [(32 / 8) - 1:0]nacks;
    reg [(32 / 8) - 1:0]nreqs;
    wire CLK;
    wire [32 - 1:0]addr_share;
    wire [32 - 1:0]data_share;
    wire nRST;
    wire [(32 / 8) - 1:0]sel_share;
    wire we_share;
    assign a$stb__RDY = 1;
    assign f_nacks = nacks;
    assign f_nacks__RDY = 1;
    assign f_nreqs = nreqs;
    assign f_nreqs__RDY = 1;
    assign f_outstanding = acyc ? ( nreqs - nacks ) : 0;
    assign f_outstanding__RDY = 1;
    // Extra assigments, not to output wires
    assign addr_share = a$stb$addr;
    assign data_share = a$stb$data;
    assign sel_share = a$stb$sel;
    assign we_share = a$stb$we;

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
        if (status$ack__RDY && ( status$ack || status$err__RDY )) begin // RULE$init3__ENA
            if (status$ack || status$err)
            nacks <= nacks + 1;
        end; // End of RULE$init3__ENA
        if (( a$stb__ENA == 0 ) || status$stall__RDY) begin // RULE$init4__ENA
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
    always @(*)
        if (!( ( status$err__RDY && ( ( status$stall__RDY && f_past_valid ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && f_past_valid ) || ( ( !( a$stb__ENA == 0 ) ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || f_past_valid ) ) || ( ( !( nreqs - nacks ) ) && f_past_valid ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && f_past_valid ) ) ) ) ) || ( !status$ack__RDY ) ) ) || ( ( !status$err__RDY ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( nreqs - nacks ) || status$ack || f_past_valid ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( status$ack || f_past_valid ) ) || ( !status$ack__RDY ) ) ) ))
            assert( ( nRST != 0 ) ^ 1 );
    always @( posedge CLK)
        if (!( ( ( $past( a$stb__ENA ) == 0 ) && ( ( status$stall__RDY && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !( nreqs - nacks ) ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) ) ) ) ) || ( !status$ack__RDY ) ) ) || ( ( !( $past( a$stb__ENA ) == 0 ) ) && ( ( status$stall__RDY && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) || ( ( !( nreqs - nacks ) ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) ) ) ) ) || ( !status$ack__RDY ) ) ) || ( !status$err__RDY ) ))
            assert( acyc ^ 1 );
    always @( posedge CLK)
        if (!( ( ( $past( a$stb__ENA ) == 0 ) && ( ( status$stall__RDY && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !( nreqs - nacks ) ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) ) ) ) ) || ( !status$ack__RDY ) ) ) || ( ( !( $past( a$stb__ENA ) == 0 ) ) && ( ( status$stall__RDY && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) || ( ( !( nreqs - nacks ) ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) ) ) ) ) || ( !status$ack__RDY ) ) ) || ( !status$err__RDY ) ))
            assert( ( a$stb__ENA != 0 ) ^ 1 );
    always @( posedge CLK)
        if (!( ( ( $past( a$stb__ENA ) == 0 ) && ( ( status$stall__RDY && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !( nreqs - nacks ) ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) ) ) ) ) || ( !status$ack__RDY ) ) ) || ( ( !( $past( a$stb__ENA ) == 0 ) ) && ( ( status$stall__RDY && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) || ( ( !( nreqs - nacks ) ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) ) ) ) ) || ( !status$ack__RDY ) ) ) || ( !status$err__RDY ) ))
            assert( status$ack ^ 1 );
    always @( posedge CLK)
        if (!( ( ( $past( a$stb__ENA ) == 0 ) && ( ( status$stall__RDY && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !( nreqs - nacks ) ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) ) ) ) ) || ( !status$ack__RDY ) ) ) || ( ( !( $past( a$stb__ENA ) == 0 ) ) && ( ( status$stall__RDY && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) || ( ( !( nreqs - nacks ) ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( ( $past( ( nRST != 0 ) ^ 1 ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) ) ) ) ) || ( !status$ack__RDY ) ) ) || ( !status$err__RDY ) ))
            assert( status$err ^ 1 );
    always @( posedge CLK)
        if (!( ( ( $past( a$stb__ENA ) == 0 ) && ( ( status$stall__RDY && ( ( $past( acyc ) == 0 ) || ( $past( status$err ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && ( ( $past( acyc ) == 0 ) || ( $past( status$err ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || ( $past( acyc ) == 0 ) || ( $past( status$err ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !( nreqs - nacks ) ) && ( ( $past( acyc ) == 0 ) || ( $past( status$err ) == 0 ) || ( !f_past_valid ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( ( $past( acyc ) == 0 ) || ( $past( status$err ) == 0 ) || ( !f_past_valid ) ) ) ) ) ) ) || ( !status$ack__RDY ) ) ) || ( ( !( $past( a$stb__ENA ) == 0 ) ) && ( ( status$stall__RDY && ( ( $past( acyc ) == 0 ) || ( $past( status$err ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && ( ( $past( acyc ) == 0 ) || ( $past( status$err ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || ( $past( acyc ) == 0 ) || ( $past( status$err ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) || ( ( !( nreqs - nacks ) ) && ( ( $past( acyc ) == 0 ) || ( $past( status$err ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( ( $past( acyc ) == 0 ) || ( $past( status$err ) == 0 ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) ) ) ) ) || ( !status$ack__RDY ) ) ) || ( !status$err__RDY ) ))
            assert( acyc ^ 1 );
    always @( posedge CLK)
        if (!( ( status$err__RDY && ( ( ( $past( a$stb__ENA ) == 0 ) && ( ( status$stall__RDY && ( a$stb__ENA == 0 ) ) || ( ( !status$stall__RDY ) && ( ( a$stb__ENA == 0 ) || ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( nreqs - nacks ) && ( status$ack || status$err ) ) ) ) || ( !status$ack__RDY ) ) ) || ( ( !( $past( a$stb__ENA ) == 0 ) ) && ( ( status$stall__RDY && ( a$stb__ENA == 0 ) ) || ( ( !status$stall__RDY ) && ( ( a$stb__ENA == 0 ) || ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || ( !( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) ) ) || ( ( !( nreqs - nacks ) ) && ( !( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( !( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) ) ) ) || ( !status$ack__RDY ) ) ) ) ) || ( ( !status$err__RDY ) && ( ( a$stb__ENA == 0 ) || ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( nreqs - nacks ) || status$ack || f_past_valid ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( status$ack || f_past_valid ) ) || ( !status$ack__RDY ) ) ) ))
            assert( acyc );
    always @( posedge CLK)
        if (!( ( $past( a$stb__ENA ) == 0 ) || ( $past( nRST ) == 0 ) || ( $past( status$stall ) == 0 ) || ( !acyc ) || ( !f_past_valid ) || ( !status$stall__RDY ) || ( !status$ack__RDY ) || ( !status$err__RDY ) ))
            assert( a$stb__ENA );
    always @( posedge CLK)
        if (!( ( $past( a$stb__ENA ) == 0 ) || ( $past( nRST ) == 0 ) || ( $past( status$stall ) == 0 ) || ( !acyc ) || ( !f_past_valid ) || ( !status$stall__RDY ) || ( !status$ack__RDY ) || ( !status$err__RDY ) ))
            assert( we_share == $past( we_share ) );
    always @( posedge CLK)
        if (!( ( $past( a$stb__ENA ) == 0 ) || ( $past( nRST ) == 0 ) || ( $past( status$stall ) == 0 ) || ( !acyc ) || ( !f_past_valid ) || ( !status$stall__RDY ) || ( !status$ack__RDY ) || ( !status$err__RDY ) ))
            assert( addr_share == $past( addr_share ) );
    always @( posedge CLK)
        if (!( ( $past( a$stb__ENA ) == 0 ) || ( $past( nRST ) == 0 ) || ( $past( status$stall ) == 0 ) || ( !acyc ) || ( !f_past_valid ) || ( !status$stall__RDY ) || ( !status$ack__RDY ) || ( !status$err__RDY ) ))
            assert( sel_share == $past( sel_share ) );
    always @( posedge CLK)
        if (!( ( $past( a$stb__ENA ) == 0 ) || ( $past( nRST ) == 0 ) || ( $past( status$stall ) == 0 ) || ( !( acyc && we_share ) ) || ( !f_past_valid ) || ( !status$stall__RDY ) || ( !status$ack__RDY ) || ( !status$err__RDY ) ))
            assert( data_share == $past( data_share ) );
    always @( posedge CLK)
        if (!( ( $past( a$stb__ENA ) == 0 ) || ( status$stall__RDY && ( ( a$stb__ENA == 0 ) || ( !f_past_valid ) ) ) || ( ( !status$stall__RDY ) && ( ( a$stb__ENA == 0 ) || ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || ( !( ( $past( nRST ) == 0 ) && f_past_valid ) ) ) ) || ( ( !( nreqs - nacks ) ) && ( !( ( $past( nRST ) == 0 ) && f_past_valid ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( !( ( $past( nRST ) == 0 ) && f_past_valid ) ) ) ) ) || ( !status$ack__RDY ) || ( !status$err__RDY ) ))
            assert( we_share == $past( we_share ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( ( $past( a$stb__ENA ) == 0 ) && status$ack__RDY && ( ( status$stall__RDY && ( nreqs - nacks ) && BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && ( nreqs - nacks ) && BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i ) || ( ( !( a$stb__ENA == 0 ) ) && ( !( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( status$ack || status$err || ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i ) || ( !( nreqs - nacks ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( !( ( nreqs - nacks ) && BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i ) ) ) ) ) ) ) ) ) ) || ( ( !( $past( a$stb__ENA ) == 0 ) ) && status$ack__RDY && ( ( status$stall__RDY && ( nreqs - nacks ) && BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && ( nreqs - nacks ) && ( ( ( $past( nRST ) == 0 ) && BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i ) || ( ( !( $past( nRST ) == 0 ) ) && ( !( f_past_valid || ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i ) ) ) ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( !( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( status$ack || status$err || ( !( ( ( $past( nRST ) == 0 ) && BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i ) || ( ( !( $past( nRST ) == 0 ) ) && ( !( f_past_valid || ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i ) ) ) ) ) ) || ( !( nreqs - nacks ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( !( ( nreqs - nacks ) && ( ( ( $past( nRST ) == 0 ) && BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i ) || ( ( !( $past( nRST ) == 0 ) ) && ( !( f_past_valid || ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 || status$ack || f_past_valid || ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i ) || ( !( nreqs - nacks ) ) || ( !status$ack__RDY ) ) ) ))
            assert( we_share == $past( we_share ) );
    always @( posedge CLK)
        if (!( ( ( $past( a$stb__ENA ) == 0 ) && ( ( status$stall__RDY && ( acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && ( acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) ) ) || ( ( !( nreqs - nacks ) ) && ( acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) ) ) ) ) ) ) || ( !status$ack__RDY ) ) ) || ( ( !( $past( a$stb__ENA ) == 0 ) ) && ( ( status$stall__RDY && ( acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && ( acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) || ( ( !( nreqs - nacks ) ) && ( acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) ) ) ) ) || ( !status$ack__RDY ) ) ) || ( !status$err__RDY ) ))
            assert( status$ack ^ 1 );
    always @( posedge CLK)
        if (!( ( ( $past( a$stb__ENA ) == 0 ) && ( ( status$stall__RDY && ( acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && ( acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) ) ) || ( ( !( nreqs - nacks ) ) && ( acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) ) ) ) ) ) ) || ( !status$ack__RDY ) ) ) || ( ( !( $past( a$stb__ENA ) == 0 ) ) && ( ( status$stall__RDY && ( acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && ( acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) || ( ( !( nreqs - nacks ) ) && ( acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( acyc || ( !( $past( acyc ) == 0 ) ) || ( !f_past_valid ) || ( !( $past( nRST ) == 0 ) ) ) ) ) ) ) ) || ( !status$ack__RDY ) ) ) || ( !status$err__RDY ) ))
            assert( status$err ^ 1 );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( ( $past( a$stb__ENA ) == 0 ) && status$ack__RDY && ( status$stall__RDY || ( a$stb__ENA == 0 ) || ( !( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( nreqs - nacks ) && ( status$ack || status$err ) ) ) ) ) || ( ( !( $past( a$stb__ENA ) == 0 ) ) && status$ack__RDY && ( status$stall__RDY || ( ( a$stb__ENA == 0 ) && ( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( !( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || ( !( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) ) ) || ( ( !( nreqs - nacks ) ) && ( !( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( !( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) ) ) ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( nreqs - nacks ) || status$ack || f_past_valid ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( status$ack || f_past_valid ) ) || ( !status$ack__RDY ) ) ) ))
            assert( status$ack && ( status$err ^ 1 ) );
    always @( posedge CLK)
        if (( status$err__RDY && ( ( ( $past( a$stb__ENA ) == 0 ) && status$ack__RDY && ( status$stall__RDY || ( a$stb__ENA == 0 ) || ( !( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( nreqs - nacks ) && ( status$ack || status$err ) ) ) ) ) || ( ( !( $past( a$stb__ENA ) == 0 ) ) && status$ack__RDY && ( status$stall__RDY || ( ( a$stb__ENA == 0 ) && ( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( !( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( ( nreqs - nacks ) && ( status$ack || status$err || ( !( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) ) ) || ( ( !( nreqs - nacks ) ) && ( !( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) ) ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( !( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) ) ) ) ) ) ) ) ) || ( ( !status$err__RDY ) && ( !( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( ( nreqs - nacks ) || status$ack || f_past_valid ) ) || ( ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) && ( status$ack || f_past_valid ) ) || ( !status$ack__RDY ) ) ) ))
            assert( ( acyc ? ( nreqs - nacks ) : 0 ) < ( ( 1 << 4 ) - 1 ) );
    always @( posedge CLK)
        if (status$err__RDY && ( ( ( $past( a$stb__ENA ) == 0 ) && status$ack__RDY && ( ( status$stall__RDY && BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( nreqs - nacks ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( nreqs - nacks ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( !( status$ack || status$err || ( !( nreqs - nacks ) ) || ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) ) ) ) ) ) ) ) || ( ( !( $past( a$stb__ENA ) == 0 ) ) && status$ack__RDY && ( ( status$stall__RDY && BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( nreqs - nacks ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( nreqs - nacks ) && ( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( !( status$ack || status$err || ( !( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) || ( !( nreqs - nacks ) ) || ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) ) ) ) ) ) ) ) ))
            assert( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 & ( nreqs - nacks ) & 1 ) | ( ( status$ack && ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 & ( nreqs - nacks ) ) ) & ( ( a$stb__ENA != 0 ) && ( status$stall ^ 1 ) ) ) );
    always @( posedge CLK)
        if (status$err__RDY && ( ( ( $past( a$stb__ENA ) == 0 ) && status$ack__RDY && ( ( status$stall__RDY && BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( nreqs - nacks ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( nreqs - nacks ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( !( status$ack || status$err || ( !( nreqs - nacks ) ) || ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) ) ) ) ) ) ) ) || ( ( !( $past( a$stb__ENA ) == 0 ) ) && status$ack__RDY && ( ( status$stall__RDY && BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( nreqs - nacks ) ) || ( ( !status$stall__RDY ) && ( ( ( a$stb__ENA == 0 ) && BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 && ( nreqs - nacks ) && ( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) || ( ( !( a$stb__ENA == 0 ) ) && ( !( status$ack || status$err || ( !( ( $past( nRST ) == 0 ) || ( !f_past_valid ) ) ) || ( !( nreqs - nacks ) ) || ( !BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 ) ) ) ) ) ) ) ) ))
            assert( ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 & ( nreqs - nacks ) & 1 ) | ( ( status$err && ( BasicBlockCond__ZN8FwbSlave11RULE$verifyEv_cond_OC_true_OC_i179 & ( nreqs - nacks ) ) ) & ( ( a$stb__ENA != 0 ) && ( status$stall ^ 1 ) ) ) );
`endif
endmodule

`default_nettype wire    // set back to default value
