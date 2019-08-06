`include "testTop.generated.vh"

`default_nettype none
module TestTop (
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
    reg intEnable;
    reg portalRControl;
    reg portalWControl;
    reg [5 - 1:0]readAddr;
    reg [4 - 1:0]readCount;
    reg readLast;
    reg readNotFirst;
    reg [16 - 1:0]requestLength;
    reg [32 - 1:0]requestValue;
    reg selectRIndReq;
    reg selectWIndReq;
    reg [5 - 1:0]writeAddr;
    reg [4 - 1:0]writeCount;
    reg writeLast;
    reg writeNotFirst;
    reg writeReady;
    wire [5 - 1:0]MAXIGP0_O$AR$agg_2e_tmp$addr;
    wire [4 - 1:0]MAXIGP0_O$AR$agg_2e_tmp$count;
    wire [6 - 1:0]MAXIGP0_O$AR$agg_2e_tmp$id;
    wire [5 - 1:0]MAXIGP0_O$AW$agg_2e_tmp$addr;
    wire [4 - 1:0]MAXIGP0_O$AW$agg_2e_tmp$count;
    wire [6 - 1:0]MAXIGP0_O$AW$agg_2e_tmp$id;
    wire [32 - 1:0]MAXIGP0_O$W$agg_2e_tmp$data;
    wire [32 - 1:0]RULE$lR$temp$data;
    wire [6 - 1:0]RULE$lR$temp$id;
    wire RULE$lR__RDY;
    wire [32 - 1:0]RULE$lread$agg_2e_tmp$data;
    wire [6 - 1:0]RULE$lread$agg_2e_tmp$id;
    wire [32 - 1:0]RULE$lread$portalCtrlInfo;
    wire [32 - 1:0]RULE$lread$res;
    wire [5 - 1:0]RULE$lread$temp$ac$addr;
    wire [6 - 1:0]RULE$lread$temp$ac$id;
    wire [16 - 1:0]RULE$lread$zzIntrChannel;
    wire [5 - 1:0]RULE$lreadNext$agg_2e_tmp$ac$addr;
    wire [4 - 1:0]RULE$lreadNext$agg_2e_tmp$ac$count;
    wire [6 - 1:0]RULE$lreadNext$agg_2e_tmp$ac$id;
    wire RULE$lreadNext$agg_2e_tmp$last;
    wire [5 - 1:0]RULE$lreadNext$readAddrupdate;
    wire RULE$lreadNext$readLastNext;
    wire [4 - 1:0]RULE$lreadNext$readburstCount;
    wire [5 - 1:0]RULE$lreadNext$temp$addr;
    wire [4 - 1:0]RULE$lreadNext$temp$count;
    wire [6 - 1:0]RULE$lreadNext$temp$id;
    wire RULE$lreadNext__RDY;
    wire RULE$lread__RDY;
    wire [32 - 1:0]RULE$lwrite$temp$data;
    wire [5 - 1:0]RULE$lwrite$wb$ac$addr;
    wire [6 - 1:0]RULE$lwrite$wb$ac$id;
    wire RULE$lwrite$wb$last;
    wire [5 - 1:0]RULE$lwriteNext$agg_2e_tmp$ac$addr;
    wire [4 - 1:0]RULE$lwriteNext$agg_2e_tmp$ac$count;
    wire [6 - 1:0]RULE$lwriteNext$agg_2e_tmp$ac$id;
    wire RULE$lwriteNext$agg_2e_tmp$last;
    wire [5 - 1:0]RULE$lwriteNext$temp$addr;
    wire [4 - 1:0]RULE$lwriteNext$temp$count;
    wire [6 - 1:0]RULE$lwriteNext$temp$id;
    wire [5 - 1:0]RULE$lwriteNext$writeAddrupdate;
    wire RULE$lwriteNext$writeLastNext;
    wire [4 - 1:0]RULE$lwriteNext$writeburstCount;
    wire RULE$lwriteNext__RDY;
    wire RULE$lwrite__RDY;
    wire RULE$writeResponse__RDY;
    wire [16 - 1:0]readBeat$in$enq$v;
    wire readBeat$in$enq__RDY;
    wire readBeat$out$deq__RDY;
    wire [16 - 1:0]readBeat$out$first;
    wire readBeat$out$first__RDY;
    wire [38 - 1:0]readData$in$enq$v;
    wire readData$in$enq__RDY;
    wire readData$out$deq__RDY;
    wire [38 - 1:0]readData$out$first;
    wire readData$out$first__RDY;
    wire readUser$enq__RDY;
    wire [15 - 1:0]reqArs$in$enq$v;
    wire reqArs$in$enq__RDY;
    wire reqArs$out$deq__ENA;
    wire reqArs$out$deq__RDY;
    wire [15 - 1:0]reqArs$out$first;
    wire reqArs$out$first__RDY;
    wire [15 - 1:0]reqAws$in$enq$v;
    wire reqAws$in$enq__RDY;
    wire reqAws$out$deq__ENA;
    wire reqAws$out$deq__RDY;
    wire [15 - 1:0]reqAws$out$first;
    wire reqAws$out$first__RDY;
    wire [16 - 1:0]user$read$enq$length;
    wire [32 - 1:0]user$read$enq$v;
    wire user$read$enq__ENA;
    wire [16 - 1:0]user$write$enq$length;
    wire [32 - 1:0]user$write$enq$v;
    wire user$write$enq__ENA;
    wire user$write$enq__RDY;
    wire [16 - 1:0]writeBeat$in$enq$v;
    wire writeBeat$in$enq__RDY;
    wire writeBeat$out$deq__RDY;
    wire [16 - 1:0]writeBeat$out$first;
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
    Fifo1Base#(15) reqArs (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$AR__ENA),
        .in$enq$v(reqArs$in$enq$v),
        .in$enq__RDY(reqArs$in$enq__RDY),
        .out$deq__ENA(reqArs$out$deq__ENA),
        .out$deq__RDY(reqArs$out$deq__RDY),
        .out$first(reqArs$out$first),
        .out$first__RDY(reqArs$out$first__RDY));
    Fifo1Base#(15) reqAws (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$AW__ENA),
        .in$enq$v(reqAws$in$enq$v),
        .in$enq__RDY(reqAws$in$enq__RDY),
        .out$deq__ENA(reqAws$out$deq__ENA),
        .out$deq__RDY(reqAws$out$deq__RDY),
        .out$first(reqAws$out$first),
        .out$first__RDY(reqAws$out$first__RDY));
    Fifo1Base#(16) readBeat (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(RULE$lreadNext__RDY),
        .in$enq$v(readBeat$in$enq$v),
        .in$enq__RDY(readBeat$in$enq__RDY),
        .out$deq__ENA(RULE$lread__RDY),
        .out$deq__RDY(readBeat$out$deq__RDY),
        .out$first(readBeat$out$first),
        .out$first__RDY(readBeat$out$first__RDY));
    Fifo1Base#(16) writeBeat (.CLK(CLK), .nRST(nRST),
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
        .write$enq$length(user$write$enq$length),
        .write$enq__RDY(user$write$enq__RDY),
        .read$enq__ENA(user$read$enq__ENA),
        .read$enq$v(user$read$enq$v),
        .read$enq$length(user$read$enq$length),
        .read$enq__RDY(readUser$enq__RDY));
    assign MAXIGP0_I$B$resp = 2'd0;
    assign MAXIGP0_I$B__ENA = RULE$writeResponse__RDY;
    assign MAXIGP0_I$R$data = RULE$lR$temp$data;
    assign MAXIGP0_I$R$id = RULE$lR$temp$id;
    assign MAXIGP0_I$R$last = 1;
    assign MAXIGP0_I$R$resp = 2'd0;
    assign MAXIGP0_I$R__ENA = RULE$lR__RDY;
    assign MAXIGP0_O$AR__RDY = reqArs$in$enq__RDY;
    assign MAXIGP0_O$AW__RDY = reqAws$in$enq__RDY;
    assign MAXIGP0_O$W__RDY = writeData$in$enq__RDY;
    assign interrupt = !( ( requestLength == 0 ) || ( !intEnable ) );
    assign readBeat$in$enq$v = { RULE$lreadNext$agg_2e_tmp$ac$addr , RULE$lreadNext$agg_2e_tmp$ac$count , RULE$lreadNext$agg_2e_tmp$ac$id , RULE$lreadNext$agg_2e_tmp$last };
    assign readData$in$enq$v = { RULE$lread$agg_2e_tmp$data , RULE$lread$agg_2e_tmp$id };
    assign reqArs$in$enq$v = { MAXIGP0_O$AR$agg_2e_tmp$addr , MAXIGP0_O$AR$agg_2e_tmp$count , MAXIGP0_O$AR$agg_2e_tmp$id };
    assign reqArs$out$deq__ENA = RULE$lreadNext__RDY && RULE$lreadNext$readLastNext;
    assign reqAws$in$enq$v = { MAXIGP0_O$AW$agg_2e_tmp$addr , MAXIGP0_O$AW$agg_2e_tmp$count , MAXIGP0_O$AW$agg_2e_tmp$id };
    assign reqAws$out$deq__ENA = RULE$lwriteNext__RDY && RULE$lwriteNext$writeLastNext;
    assign user$write$enq$length = RULE$lwrite$wb$ac$addr != 0;
    assign user$write$enq$v = RULE$lwrite$temp$data;
    assign user$write$enq__ENA = !( portalWControl || ( !RULE$lwrite__RDY ) );
    assign writeBeat$in$enq$v = { RULE$lwriteNext$agg_2e_tmp$ac$addr , RULE$lwriteNext$agg_2e_tmp$ac$count , RULE$lwriteNext$agg_2e_tmp$ac$id , RULE$lwriteNext$agg_2e_tmp$last };
    assign writeData$in$enq$v = { MAXIGP0_O$W$agg_2e_tmp$data };
    assign writeDone$in$enq$v = RULE$lwrite$wb$ac$id;
    assign writeDone$in$enq__ENA = RULE$lwrite__RDY && RULE$lwrite$wb$last;
    // Extra assigments, not to output wires
    assign MAXIGP0_O$AR$agg_2e_tmp$addr = MAXIGP0_O$AR$addr[ 4 : 0 ];
    assign MAXIGP0_O$AR$agg_2e_tmp$count = MAXIGP0_O$AR$len + 4'd1;
    assign MAXIGP0_O$AR$agg_2e_tmp$id = MAXIGP0_O$AR$id[ 5 : 0 ];
    assign MAXIGP0_O$AW$agg_2e_tmp$addr = MAXIGP0_O$AW$addr[ 4 : 0 ];
    assign MAXIGP0_O$AW$agg_2e_tmp$count = MAXIGP0_O$AW$len + 4'd1;
    assign MAXIGP0_O$AW$agg_2e_tmp$id = MAXIGP0_O$AW$id[ 5 : 0 ];
    assign MAXIGP0_O$W$agg_2e_tmp$data = MAXIGP0_O$W$data;
    assign RULE$lR$temp$data = readData$out$first[ 32 - 1 + 6 : 6 ];
    assign RULE$lR$temp$id = readData$out$first[ 6 - 1 : 0 ];
    assign RULE$lR__RDY = readData$out$first__RDY && readData$out$deq__RDY && MAXIGP0_I$R__RDY;
    assign RULE$lread$agg_2e_tmp$data = ( portalRControl ? RULE$lread$portalCtrlInfo : 32'd0 ) | ( ( !portalRControl ) ? RULE$lread$res : 32'd0 );
    assign RULE$lread$agg_2e_tmp$id = RULE$lread$temp$ac$id;
    assign RULE$lread$portalCtrlInfo = ( ( RULE$lread__RDY && ( RULE$lread$temp$ac$addr == 0 ) ) ? RULE$lread$zzIntrChannel : 16'd0 ) | ( ( RULE$lread__RDY && ( RULE$lread$temp$ac$addr == 8 ) ) ? 32'd1 : 32'd0 ) | ( ( RULE$lread__RDY && ( RULE$lread$temp$ac$addr == 12 ) ) ? RULE$lread$zzIntrChannel : 16'd0 ) | ( ( RULE$lread__RDY && ( RULE$lread$temp$ac$addr == 16 ) ) ? ( selectRIndReq ? 32'd6 : 32'd5 ) : 32'd0 ) | ( ( RULE$lread__RDY && ( RULE$lread$temp$ac$addr == 20 ) ) ? 32'd2 : 32'd0 );
    assign RULE$lread$res = ( ( RULE$lread__RDY && ( RULE$lread$temp$ac$addr == 0 ) ) ? requestValue : 32'd0 ) | ( ( RULE$lread__RDY && ( RULE$lread$temp$ac$addr == 4 ) ) ? user$write$enq__RDY : 1'd0 );
    assign RULE$lread$temp$ac$addr = readBeat$out$first[ 5 - 1 + 11 : 11 ];
    assign RULE$lread$temp$ac$id = readBeat$out$first[ 6 - 1 + 1 : 1 ];
    assign RULE$lread$zzIntrChannel = ( ( !selectRIndReq ) ? requestLength : 16'd0 );
    assign RULE$lreadNext$agg_2e_tmp$ac$addr = RULE$lreadNext$readAddrupdate;
    assign RULE$lreadNext$agg_2e_tmp$ac$count = RULE$lreadNext$readburstCount;
    assign RULE$lreadNext$agg_2e_tmp$ac$id = RULE$lreadNext$temp$id;
    assign RULE$lreadNext$agg_2e_tmp$last = RULE$lreadNext$readLastNext;
    assign RULE$lreadNext$readAddrupdate = readNotFirst ? readAddr : RULE$lreadNext$temp$addr;
    assign RULE$lreadNext$readLastNext = readNotFirst ? readLast : ( RULE$lreadNext$temp$count == 1 );
    assign RULE$lreadNext$readburstCount = readNotFirst ? readCount : RULE$lreadNext$temp$count;
    assign RULE$lreadNext$temp$addr = reqArs$out$first[ 5 - 1 + 10 : 10 ];
    assign RULE$lreadNext$temp$count = reqArs$out$first[ 4 - 1 + 6 : 6 ];
    assign RULE$lreadNext$temp$id = reqArs$out$first[ 6 - 1 : 0 ];
    assign RULE$lreadNext__RDY = reqArs$out$first__RDY && readBeat$in$enq__RDY && ( reqArs$out$deq__RDY || ( !RULE$lreadNext$readLastNext ) );
    assign RULE$lread__RDY = readBeat$out$first__RDY && readBeat$out$deq__RDY && readData$in$enq__RDY;
    assign RULE$lwrite$temp$data = writeData$out$first;
    assign RULE$lwrite$wb$ac$addr = writeBeat$out$first[ 5 - 1 + 11 : 11 ];
    assign RULE$lwrite$wb$ac$id = writeBeat$out$first[ 6 - 1 + 1 : 1 ];
    assign RULE$lwrite$wb$last = writeBeat$out$first[ ( 1 - 1 ) : 0 ];
    assign RULE$lwriteNext$agg_2e_tmp$ac$addr = RULE$lwriteNext$writeAddrupdate;
    assign RULE$lwriteNext$agg_2e_tmp$ac$count = RULE$lwriteNext$writeburstCount;
    assign RULE$lwriteNext$agg_2e_tmp$ac$id = RULE$lwriteNext$temp$id;
    assign RULE$lwriteNext$agg_2e_tmp$last = RULE$lwriteNext$writeLastNext;
    assign RULE$lwriteNext$temp$addr = reqAws$out$first[ 5 - 1 + 10 : 10 ];
    assign RULE$lwriteNext$temp$count = reqAws$out$first[ 4 - 1 + 6 : 6 ];
    assign RULE$lwriteNext$temp$id = reqAws$out$first[ 6 - 1 : 0 ];
    assign RULE$lwriteNext$writeAddrupdate = writeNotFirst ? writeAddr : RULE$lwriteNext$temp$addr;
    assign RULE$lwriteNext$writeLastNext = writeNotFirst ? writeLast : ( RULE$lwriteNext$temp$count == 1 );
    assign RULE$lwriteNext$writeburstCount = writeNotFirst ? writeCount : RULE$lwriteNext$temp$count;
    assign RULE$lwriteNext__RDY = reqAws$out$first__RDY && writeBeat$in$enq__RDY && ( reqAws$out$deq__RDY || ( !RULE$lwriteNext$writeLastNext ) );
    assign RULE$lwrite__RDY = writeBeat$out$first__RDY && writeBeat$out$deq__RDY && writeData$out$first__RDY && writeData$out$deq__RDY && ( ( writeDone$in$enq__RDY && ( portalWControl || user$write$enq__RDY ) ) || ( ( !writeDone$in$enq__RDY ) && ( !( ( portalWControl && RULE$lwrite$wb$last ) || ( ( !portalWControl ) && ( RULE$lwrite$wb$last || ( !user$write$enq__RDY ) ) ) ) ) ) );
    assign RULE$writeResponse__RDY = writeDone$out$first__RDY && MAXIGP0_I$B__RDY && writeDone$out$deq__RDY;
    assign readUser$enq__RDY = requestLength == 0;

    always @( posedge CLK) begin
      if (!nRST) begin
        intEnable <= 0;
        portalRControl <= 0;
        portalWControl <= 0;
        readAddr <= 0;
        readCount <= 0;
        readLast <= 0;
        readNotFirst <= 0;
        requestLength <= 0;
        requestValue <= 0;
        selectRIndReq <= 0;
        selectWIndReq <= 0;
        writeAddr <= 0;
        writeCount <= 0;
        writeLast <= 0;
        writeNotFirst <= 0;
        writeReady <= 0;
      end // nRST
      else begin
        if (MAXIGP0_O$AR__ENA && reqArs$in$enq__RDY) begin // MAXIGP0_O$AR__ENA
            portalRControl <= MAXIGP0_O$AR$addr[ 11 : 5 ] == 0;
            selectRIndReq <= MAXIGP0_O$AR$addr[ 12 ];
        end; // End of MAXIGP0_O$AR__ENA
        if (MAXIGP0_O$AW__ENA && reqAws$in$enq__RDY) begin // MAXIGP0_O$AW__ENA
            portalWControl <= MAXIGP0_O$AW$addr[ 11 : 5 ] == 0;
            selectWIndReq <= MAXIGP0_O$AW$addr[ 12 ];
        end; // End of MAXIGP0_O$AW__ENA
        if (RULE$lreadNext__RDY) begin // RULE$lreadNext__ENA
            readAddr <= RULE$lreadNext$readAddrupdate + 4;
            readCount <= RULE$lreadNext$readburstCount - 1;
            readNotFirst <= ( RULE$lreadNext$readLastNext != 0 ) ^ 1;
            readLast <= RULE$lreadNext$readburstCount == 2;
        end; // End of RULE$lreadNext__ENA
        if (RULE$lread__RDY) begin // RULE$lread__ENA
            if (( RULE$lread$temp$ac$addr == 0 ) && ( portalRControl == 0 ))
            requestLength <= 0;
        end; // End of RULE$lread__ENA
        if (RULE$lwriteNext__RDY) begin // RULE$lwriteNext__ENA
            writeAddr <= RULE$lwriteNext$writeAddrupdate + 4;
            writeCount <= RULE$lwriteNext$writeburstCount - 1;
            writeNotFirst <= ( RULE$lwriteNext$writeLastNext != 0 ) ^ 1;
            writeLast <= RULE$lwriteNext$writeburstCount == 2;
        end; // End of RULE$lwriteNext__ENA
        if (RULE$lwrite__RDY) begin // RULE$lwrite__ENA
            if (!( ( portalWControl == 0 ) || ( !( RULE$lwrite$wb$ac$addr == 4 ) ) ))
            intEnable <= RULE$lwrite$temp$data[ 0 : 0 ];
        end; // End of RULE$lwrite__ENA
        if (user$read$enq__ENA && readUser$enq__RDY) begin // readUser$enq__ENA
            requestValue <= user$read$enq$v;
            requestLength <= user$read$enq$length;
        end; // End of readUser$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
