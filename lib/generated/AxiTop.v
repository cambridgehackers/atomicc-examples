`include "axiTop.generated.vh"

`default_nettype none
module AxiTop (
    input wire MAXIGP0_O$AR__ENA,
    input wire [32 - 1:0]MAXIGP0_O$AR$addr,
    input wire [12 - 1:0]MAXIGP0_O$AR$id,
    input wire [4 - 1:0]MAXIGP0_O$AR$len,
    output wire MAXIGP0_O$AR__RDY,
    input wire MAXIGP0_O$AW__ENA,
    input wire [32 - 1:0]MAXIGP0_O$AW$addr,
    input wire [12 - 1:0]MAXIGP0_O$AW$id,
    input wire [4 - 1:0]MAXIGP0_O$AW$len,
    output wire MAXIGP0_O$AW__RDY,
    input wire MAXIGP0_O$W__ENA,
    input wire [32 - 1:0]MAXIGP0_O$W$data,
    input wire [12 - 1:0]MAXIGP0_O$W$id,
    input wire MAXIGP0_O$W$last,
    output wire MAXIGP0_O$W__RDY,
    output wire MAXIGP0_I$R__ENA,
    output wire [32 - 1:0]MAXIGP0_I$R$data,
    output wire [12 - 1:0]MAXIGP0_I$R$id,
    output wire MAXIGP0_I$R$last,
    output wire [2 - 1:0]MAXIGP0_I$R$resp,
    input wire MAXIGP0_I$R__RDY,
    output wire MAXIGP0_I$B__ENA,
    output wire [12 - 1:0]MAXIGP0_I$B$id,
    output wire [2 - 1:0]MAXIGP0_I$B$resp,
    input wire MAXIGP0_I$B__RDY,
    output wire interrupt,
    input wire CLK,
    input wire nRST);
    reg hasIndication;
    reg intEnable;
    reg portalRControl;
    reg portalWControl;
    reg [5 - 1:0]readAddr;
    reg [4 - 1:0]readCount;
    reg [32 - 1:0]requestValue;
    reg selectRIndReq;
    reg selectWIndReq;
    reg [5 - 1:0]writeAddr;
    reg [4 - 1:0]writeCount;
    reg writeReady;
    wire [32 - 1:0]RULE$lR$currentRData$data;
    wire [6 - 1:0]RULE$lR$currentRData$id;
    wire RULE$lR__RDY;
    wire [32 - 1:0]RULE$lread$agg_2e_tmp$data;
    wire [6 - 1:0]RULE$lread$agg_2e_tmp$id;
    wire RULE$lread$currentChannel;
    wire [5 - 1:0]RULE$lread$currentRBeat$addr;
    wire [4 - 1:0]RULE$lread$currentRBeat$count;
    wire [6 - 1:0]RULE$lread$currentRead;
    wire [32 - 1:0]RULE$lread$portalCtrlInfo;
    wire [32 - 1:0]RULE$lread$res;
    wire [5 - 1:0]RULE$lreadNext$agg_2e_tmp$addr;
    wire [4 - 1:0]RULE$lreadNext$agg_2e_tmp$count;
    wire RULE$lreadNext__RDY;
    wire RULE$lread__RDY;
    wire [5 - 1:0]RULE$lwrite$currentWBeat$addr;
    wire [4 - 1:0]RULE$lwrite$currentWBeat$count;
    wire [32 - 1:0]RULE$lwrite$currentWData;
    wire [6 - 1:0]RULE$lwrite$currentWrite;
    wire [5 - 1:0]RULE$lwriteNext$agg_2e_tmp$addr;
    wire [4 - 1:0]RULE$lwriteNext$agg_2e_tmp$count;
    wire RULE$lwriteNext__RDY;
    wire RULE$lwrite__RDY;
    wire RULE$writeResponse__RDY;
    wire [9 - 1:0]readBeat$in$enq$v;
    wire readBeat$in$enq__RDY;
    wire readBeat$out$deq__RDY;
    wire [9 - 1:0]readBeat$out$first;
    wire readBeat$out$first__RDY;
    wire [38 - 1:0]readData$in$enq$v;
    wire readData$in$enq__RDY;
    wire readData$out$deq__RDY;
    wire [38 - 1:0]readData$out$first;
    wire readData$out$first__RDY;
    wire readUser$enq__RDY;
    wire [6 - 1:0]reqArs$in$enq$v;
    wire reqArs$in$enq__RDY;
    wire reqArs$out$deq__ENA;
    wire reqArs$out$deq__RDY;
    wire [6 - 1:0]reqArs$out$first;
    wire reqArs$out$first__RDY;
    wire [6 - 1:0]reqAws$in$enq$v;
    wire reqAws$in$enq__RDY;
    wire reqAws$out$deq__ENA;
    wire reqAws$out$deq__RDY;
    wire [6 - 1:0]reqAws$out$first;
    wire reqAws$out$first__RDY;
    wire [32 - 1:0]user$read$enq$v;
    wire user$read$enq__ENA;
    wire user$write$enq$last;
    wire [32 - 1:0]user$write$enq$v;
    wire user$write$enq__ENA;
    wire user$write$enq__RDY;
    wire [9 - 1:0]writeBeat$in$enq$v;
    wire writeBeat$in$enq__RDY;
    wire writeBeat$out$deq__RDY;
    wire [9 - 1:0]writeBeat$out$first;
    wire writeBeat$out$first__RDY;
    wire [32 - 1:0]writeData$in$enq$v;
    wire writeData$in$enq__RDY;
    wire writeData$out$deq__RDY;
    wire [32 - 1:0]writeData$out$first;
    wire writeData$out$first__RDY;
    wire [6 - 1:0]writeDone$in$enq$v;
    wire writeDone$in$enq__ENA;
    wire writeDone$in$enq__RDY;
    wire writeDone$out$deq__RDY;
    wire writeDone$out$first__RDY;
    Fifo1Base#(6) reqArs (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$AR__ENA),
        .in$enq$v(reqArs$in$enq$v),
        .in$enq__RDY(reqArs$in$enq__RDY),
        .out$deq__ENA(reqArs$out$deq__ENA),
        .out$deq__RDY(reqArs$out$deq__RDY),
        .out$first(reqArs$out$first),
        .out$first__RDY(reqArs$out$first__RDY));
    Fifo1Base#(6) reqAws (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$AW__ENA),
        .in$enq$v(reqAws$in$enq$v),
        .in$enq__RDY(reqAws$in$enq__RDY),
        .out$deq__ENA(reqAws$out$deq__ENA),
        .out$deq__RDY(reqAws$out$deq__RDY),
        .out$first(reqAws$out$first),
        .out$first__RDY(reqAws$out$first__RDY));
    Fifo1Base#(9) readBeat (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(RULE$lreadNext__RDY),
        .in$enq$v(readBeat$in$enq$v),
        .in$enq__RDY(readBeat$in$enq__RDY),
        .out$deq__ENA(RULE$lread__RDY),
        .out$deq__RDY(readBeat$out$deq__RDY),
        .out$first(readBeat$out$first),
        .out$first__RDY(readBeat$out$first__RDY));
    Fifo1Base#(9) writeBeat (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(RULE$lwriteNext__RDY),
        .in$enq$v(writeBeat$in$enq$v),
        .in$enq__RDY(writeBeat$in$enq__RDY),
        .out$deq__ENA(RULE$lwrite__RDY),
        .out$deq__RDY(writeBeat$out$deq__RDY),
        .out$first(writeBeat$out$first),
        .out$first__RDY(writeBeat$out$first__RDY));
    Fifo1Base#(38) readData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(RULE$lread__RDY),
        .in$enq$v(readData$in$enq$v),
        .in$enq__RDY(readData$in$enq__RDY),
        .out$deq__ENA(RULE$lR__RDY),
        .out$deq__RDY(readData$out$deq__RDY),
        .out$first(readData$out$first),
        .out$first__RDY(readData$out$first__RDY));
    Fifo1Base#(32) writeData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$W__ENA),
        .in$enq$v(writeData$in$enq$v),
        .in$enq__RDY(writeData$in$enq__RDY),
        .out$deq__ENA(RULE$lwrite__RDY),
        .out$deq__RDY(writeData$out$deq__RDY),
        .out$first(writeData$out$first),
        .out$first__RDY(writeData$out$first__RDY));
    Fifo1Base#(6) writeDone (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(writeDone$in$enq__ENA),
        .in$enq$v(writeDone$in$enq$v),
        .in$enq__RDY(writeDone$in$enq__RDY),
        .out$deq__ENA(RULE$writeResponse__RDY),
        .out$deq__RDY(writeDone$out$deq__RDY),
        .out$first(MAXIGP0_I$B$id),
        .out$first__RDY(writeDone$out$first__RDY));
    UserTop user (.CLK(CLK), .nRST(nRST),
        .write$enq__ENA(user$write$enq__ENA),
        .write$enq$v(user$write$enq$v),
        .write$enq$last(user$write$enq$last),
        .write$enq__RDY(user$write$enq__RDY),
        .read$enq__ENA(user$read$enq__ENA),
        .read$enq$v(user$read$enq$v),
        .read$enq$last(),
        .read$enq__RDY(readUser$enq__RDY));
    assign MAXIGP0_I$B$resp = 2'd0;
    assign MAXIGP0_I$B__ENA = RULE$writeResponse__RDY;
    assign MAXIGP0_I$R$data = RULE$lR$currentRData$data;
    assign MAXIGP0_I$R$id = RULE$lR$currentRData$id;
    assign MAXIGP0_I$R$last = 1;
    assign MAXIGP0_I$R$resp = 2'd0;
    assign MAXIGP0_I$R__ENA = RULE$lR__RDY;
    assign MAXIGP0_O$AR__RDY = reqArs$in$enq__RDY;
    assign MAXIGP0_O$AW__RDY = reqAws$in$enq__RDY;
    assign MAXIGP0_O$W__RDY = writeData$in$enq__RDY;
    assign interrupt = hasIndication && intEnable;
    assign readBeat$in$enq$v = { RULE$lreadNext$agg_2e_tmp$addr , RULE$lreadNext$agg_2e_tmp$count };
    assign readData$in$enq$v = { RULE$lread$agg_2e_tmp$data , RULE$lread$agg_2e_tmp$id };
    assign reqArs$in$enq$v = MAXIGP0_O$AR$id[ 5 : 0 ];
    assign reqArs$out$deq__ENA = RULE$lread__RDY && ( RULE$lread$currentRBeat$count == 1 );
    assign reqAws$in$enq$v = MAXIGP0_O$AW$id[ 5 : 0 ];
    assign reqAws$out$deq__ENA = RULE$lwrite__RDY && ( RULE$lwrite$currentWBeat$count == 1 );
    assign user$write$enq$last = !( RULE$lwrite$currentWBeat$addr == 0 );
    assign user$write$enq$v = RULE$lwrite$currentWData;
    assign user$write$enq__ENA = !( portalWControl || ( !RULE$lwrite__RDY ) );
    assign writeBeat$in$enq$v = { RULE$lwriteNext$agg_2e_tmp$addr , RULE$lwriteNext$agg_2e_tmp$count };
    assign writeData$in$enq$v = MAXIGP0_O$W$data;
    assign writeDone$in$enq$v = RULE$lwrite$currentWrite;
    assign writeDone$in$enq__ENA = RULE$lwrite__RDY && ( RULE$lwrite$currentWBeat$count == 1 );
    // Extra assigments, not to output wires
    assign RULE$lR$currentRData$data = readData$out$first[ 32 - 1 + 6 : 6 ];
    assign RULE$lR$currentRData$id = readData$out$first[ 6 - 1 : 0 ];
    assign RULE$lR__RDY = readData$out$first__RDY && readData$out$deq__RDY && MAXIGP0_I$R__RDY;
    assign RULE$lread$agg_2e_tmp$data = ( portalRControl ? RULE$lread$portalCtrlInfo : 32'd0 ) | ( ( !portalRControl ) ? RULE$lread$res : 32'd0 );
    assign RULE$lread$agg_2e_tmp$id = RULE$lread$currentRead;
    assign RULE$lread$currentChannel = selectRIndReq ? 1'd0 : hasIndication;
    assign RULE$lread$currentRBeat$addr = readBeat$out$first[ 5 - 1 + 4 : 4 ];
    assign RULE$lread$currentRBeat$count = readBeat$out$first[ 4 - 1 : 0 ];
    assign RULE$lread$currentRead = reqArs$out$first;
    assign RULE$lread$portalCtrlInfo = ( ( RULE$lread__RDY && ( RULE$lread$currentRBeat$addr == 0 ) ) ? RULE$lread$currentChannel : 1'd0 ) | ( ( RULE$lread__RDY && ( RULE$lread$currentRBeat$addr == 8 ) ) ? 32'd1 : 32'd0 ) | ( ( RULE$lread__RDY && ( RULE$lread$currentRBeat$addr == 12 ) ) ? RULE$lread$currentChannel : 1'd0 ) | ( ( RULE$lread__RDY && ( RULE$lread$currentRBeat$addr == 16 ) ) ? ( selectRIndReq ? 32'd6 : 32'd5 ) : 32'd0 ) | ( ( RULE$lread__RDY && ( RULE$lread$currentRBeat$addr == 20 ) ) ? 32'd2 : 32'd0 );
    assign RULE$lread$res = ( ( RULE$lread__RDY && ( RULE$lread$currentRBeat$addr == 0 ) ) ? requestValue : 32'd0 ) | ( ( RULE$lread__RDY && ( RULE$lread$currentRBeat$addr == 4 ) ) ? user$write$enq__RDY : 1'd0 );
    assign RULE$lreadNext$agg_2e_tmp$addr = readAddr;
    assign RULE$lreadNext$agg_2e_tmp$count = readCount;
    assign RULE$lreadNext__RDY = reqArs$out$first__RDY && readBeat$in$enq__RDY;
    assign RULE$lread__RDY = reqArs$out$first__RDY && readBeat$out$first__RDY && readData$in$enq__RDY && readBeat$out$deq__RDY && ( reqArs$out$deq__RDY || ( !( RULE$lread$currentRBeat$count == 1 ) ) );
    assign RULE$lwrite$currentWBeat$addr = writeBeat$out$first[ 5 - 1 + 4 : 4 ];
    assign RULE$lwrite$currentWBeat$count = writeBeat$out$first[ 4 - 1 : 0 ];
    assign RULE$lwrite$currentWData = writeData$out$first;
    assign RULE$lwrite$currentWrite = reqAws$out$first;
    assign RULE$lwriteNext$agg_2e_tmp$addr = writeAddr;
    assign RULE$lwriteNext$agg_2e_tmp$count = writeCount;
    assign RULE$lwriteNext__RDY = reqAws$out$first__RDY && writeBeat$in$enq__RDY;
    assign RULE$lwrite__RDY = reqAws$out$first__RDY && writeBeat$out$first__RDY && writeData$out$first__RDY && ( ( writeDone$in$enq__RDY && ( ( portalWControl && writeBeat$out$deq__RDY && writeData$out$deq__RDY && ( reqAws$out$deq__RDY || ( !( RULE$lwrite$currentWBeat$count == 1 ) ) ) ) || ( ( !portalWControl ) && writeBeat$out$deq__RDY && writeData$out$deq__RDY && ( ( reqAws$out$deq__RDY && user$write$enq__RDY ) || ( ( !reqAws$out$deq__RDY ) && ( !( ( RULE$lwrite$currentWBeat$count == 1 ) || ( !user$write$enq__RDY ) ) ) ) ) ) ) ) || ( ( !writeDone$in$enq__RDY ) && ( !( ( portalWControl && ( ( RULE$lwrite$currentWBeat$count == 1 ) || ( !writeData$out$deq__RDY ) || ( !writeBeat$out$deq__RDY ) ) ) || ( ( !portalWControl ) && ( ( RULE$lwrite$currentWBeat$count == 1 ) || ( !user$write$enq__RDY ) || ( !writeData$out$deq__RDY ) || ( !writeBeat$out$deq__RDY ) ) ) ) ) ) );
    assign RULE$writeResponse__RDY = writeDone$out$first__RDY && MAXIGP0_I$B__RDY && writeDone$out$deq__RDY;
    assign readUser$enq__RDY = !hasIndication;

    always @( posedge CLK) begin
      if (!nRST) begin
        hasIndication <= 0;
        intEnable <= 0;
        portalRControl <= 0;
        portalWControl <= 0;
        readAddr <= 0;
        readCount <= 0;
        requestValue <= 0;
        selectRIndReq <= 0;
        selectWIndReq <= 0;
        writeAddr <= 0;
        writeCount <= 0;
        writeReady <= 0;
      end // nRST
      else begin
        if (MAXIGP0_O$AR__ENA && reqArs$in$enq__RDY) begin // MAXIGP0_O$AR__ENA
            portalRControl <= MAXIGP0_O$AR$addr[ 11 : 5 ] == 0;
            selectRIndReq <= MAXIGP0_O$AR$addr[ 12 ] != 0;
            readCount <= MAXIGP0_O$AR$len + 1;
            readAddr <= MAXIGP0_O$AR$addr;
        end; // End of MAXIGP0_O$AR__ENA
        if (MAXIGP0_O$AW__ENA && reqAws$in$enq__RDY) begin // MAXIGP0_O$AW__ENA
            portalWControl <= MAXIGP0_O$AW$addr[ 11 : 5 ] == 0;
            selectWIndReq <= MAXIGP0_O$AW$addr[ 12 ] != 0;
            writeCount <= MAXIGP0_O$AW$len + 1;
            writeAddr <= MAXIGP0_O$AW$addr;
        end; // End of MAXIGP0_O$AW__ENA
        if (RULE$lreadNext__RDY) begin // RULE$lreadNext__ENA
            readCount <= readCount - 1;
            readAddr <= readAddr + 4;
        end; // End of RULE$lreadNext__ENA
        if (RULE$lread__RDY) begin // RULE$lread__ENA
            if (!( portalRControl || ( !( RULE$lread$currentRBeat$addr == 0 ) ) ))
            hasIndication <= 0;
        end; // End of RULE$lread__ENA
        if (RULE$lwriteNext__RDY) begin // RULE$lwriteNext__ENA
            writeCount <= writeCount - 1;
            writeAddr <= writeAddr + 4;
        end; // End of RULE$lwriteNext__ENA
        if (RULE$lwrite__RDY) begin // RULE$lwrite__ENA
            if (( RULE$lwrite$currentWBeat$addr == 4 ) && portalWControl)
            intEnable <= RULE$lwrite$currentWData[ 0 : 0 ] != 0;
        end; // End of RULE$lwrite__ENA
        if (user$read$enq__ENA && readUser$enq__RDY) begin // readUser$enq__ENA
            requestValue <= user$read$enq$v;
            hasIndication <= 1;
        end; // End of readUser$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
