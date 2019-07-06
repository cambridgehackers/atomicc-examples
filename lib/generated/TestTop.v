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
    output wire MAXIGP0_I$B__ENA,
    output wire [12 - 1:0]MAXIGP0_I$B$id,
    output wire [2 - 1:0]MAXIGP0_I$B$resp,
    input wire MAXIGP0_I$B__RDY,
    output wire MAXIGP0_I$R__ENA,
    output wire [32 - 1:0]MAXIGP0_I$R$data,
    output wire [12 - 1:0]MAXIGP0_I$R$id,
    output wire MAXIGP0_I$R$last,
    output wire [2 - 1:0]MAXIGP0_I$R$resp,
    input wire MAXIGP0_I$R__RDY,
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
    wire [((6 + 4) + 5) - 1:0]MAXIGP0_O$AR$agg_2e_tmp;
    wire [((6 + 4) + 5) - 1:0]MAXIGP0_O$AW$agg_2e_tmp;
    wire [(6 + 32) - 1:0]RULE$lR$temp;
    wire [(6 + 32) - 1:0]RULE$lread$agg_2e_tmp;
    wire [32 - 1:0]RULE$lread$agg_2e_tmp$data;
    wire [32 - 1:0]RULE$lread$portalCtrlInfo;
    wire [32 - 1:0]RULE$lread$res;
    wire [(1 + ((6 + 4) + 5)) - 1:0]RULE$lread$temp;
    wire [5 - 1:0]RULE$lread$temp$ac$addr;
    wire [(1 + ((6 + 4) + 5)) - 1:0]RULE$lreadNext$agg_2e_tmp;
    wire [5 - 1:0]RULE$lreadNext$agg_2e_tmp$ac$addr;
    wire [4 - 1:0]RULE$lreadNext$agg_2e_tmp$ac$count;
    wire RULE$lreadNext$agg_2e_tmp$last;
    wire [((6 + 4) + 5) - 1:0]RULE$lreadNext$temp;
    wire [5 - 1:0]RULE$lreadNext$temp$addr;
    wire [4 - 1:0]RULE$lreadNext$temp$count;
    wire RULE$lreadNext__ENA;
    wire RULE$lreadNext__RDY;
    wire [32 - 1:0]RULE$lwrite$temp;
    wire [32 - 1:0]RULE$lwrite$temp$data;
    wire [(1 + ((6 + 4) + 5)) - 1:0]RULE$lwrite$wb;
    wire [5 - 1:0]RULE$lwrite$wb$ac$addr;
    wire [(1 + ((6 + 4) + 5)) - 1:0]RULE$lwriteNext$agg_2e_tmp;
    wire [5 - 1:0]RULE$lwriteNext$agg_2e_tmp$ac$addr;
    wire [4 - 1:0]RULE$lwriteNext$agg_2e_tmp$ac$count;
    wire RULE$lwriteNext$agg_2e_tmp$last;
    wire [((6 + 4) + 5) - 1:0]RULE$lwriteNext$temp;
    wire [5 - 1:0]RULE$lwriteNext$temp$addr;
    wire [4 - 1:0]RULE$lwriteNext$temp$count;
    wire RULE$lwriteNext__ENA;
    wire RULE$lwriteNext__RDY;
    wire RULE$lwrite__ENA;
    wire RULE$lwrite__RDY;
    wire readBeat$in$enq__ENA;
    wire readBeat$in$enq__RDY;
    wire readBeat$out$deq__RDY;
    wire [16 - 1:0]readBeat$out$first;
    wire readBeat$out$first__RDY;
    wire readData$in$enq__RDY;
    wire readData$out$deq__RDY;
    wire [38 - 1:0]readData$out$first;
    wire readData$out$first__RDY;
    wire reqArs$in$enq__RDY;
    wire reqArs$out$deq__ENA;
    wire reqArs$out$deq__RDY;
    wire [15 - 1:0]reqArs$out$first;
    wire reqArs$out$first__RDY;
    wire reqAws$in$enq__RDY;
    wire reqAws$out$deq__ENA;
    wire reqAws$out$deq__RDY;
    wire [15 - 1:0]reqAws$out$first;
    wire reqAws$out$first__RDY;
    wire [16 - 1:0]user$read$enq$length;
    wire [32 - 1:0]user$read$enq$v;
    wire user$read$enq__ENA;
    wire [16 - 1:0]user$write$enq$length;
    wire user$write$enq__ENA;
    wire user$write$enq__RDY;
    wire writeBeat$in$enq__ENA;
    wire writeBeat$in$enq__RDY;
    wire writeBeat$out$deq__ENA;
    wire writeBeat$out$deq__RDY;
    wire [16 - 1:0]writeBeat$out$first;
    wire writeBeat$out$first__RDY;
    wire writeData$in$enq__RDY;
    wire writeData$out$deq__ENA;
    wire writeData$out$deq__RDY;
    wire [32 - 1:0]writeData$out$first;
    wire writeData$out$first__RDY;
    wire writeDone$in$enq__ENA;
    wire writeDone$in$enq__RDY;
    wire writeDone$out$deq__RDY;
    wire writeDone$out$first__RDY;
    Fifo1Base#(15) reqArs (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$AR__ENA),
        .in$enq$v({ MAXIGP0_O$AR$addr[ 4 : 0 ] , MAXIGP0_O$AR$len + 4'd1 , MAXIGP0_O$AR$id[ 5 : 0 ] }),
        .in$enq__RDY(reqArs$in$enq__RDY),
        .out$deq__ENA(reqArs$out$deq__ENA),
        .out$deq__RDY(reqArs$out$deq__RDY),
        .out$first(reqArs$out$first),
        .out$first__RDY(reqArs$out$first__RDY));
    Fifo1Base#(15) reqAws (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$AW__ENA),
        .in$enq$v({ MAXIGP0_O$AW$addr[ 4 : 0 ] , MAXIGP0_O$AW$len + 4'd1 , MAXIGP0_O$AW$id[ 5 : 0 ] }),
        .in$enq__RDY(reqAws$in$enq__RDY),
        .out$deq__ENA(reqAws$out$deq__ENA),
        .out$deq__RDY(reqAws$out$deq__RDY),
        .out$first(reqAws$out$first),
        .out$first__RDY(reqAws$out$first__RDY));
    Fifo1Base#(16) readBeat (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(readBeat$in$enq__ENA),
        .in$enq$v({ RULE$lreadNext$agg_2e_tmp$ac$addr , RULE$lreadNext$agg_2e_tmp$ac$count , reqArs$out$first[ ( 6 - 1 ) : 0 ] , RULE$lreadNext$agg_2e_tmp$last }),
        .in$enq__RDY(readBeat$in$enq__RDY),
        .out$deq__ENA(readBeat$out$first__RDY & readData$in$enq__RDY),
        .out$deq__RDY(readBeat$out$deq__RDY),
        .out$first(readBeat$out$first),
        .out$first__RDY(readBeat$out$first__RDY));
    Fifo1Base#(16) writeBeat (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(writeBeat$in$enq__ENA),
        .in$enq$v({ RULE$lwriteNext$agg_2e_tmp$ac$addr , RULE$lwriteNext$agg_2e_tmp$ac$count , reqAws$out$first[ ( 6 - 1 ) : 0 ] , RULE$lwriteNext$agg_2e_tmp$last }),
        .in$enq__RDY(writeBeat$in$enq__RDY),
        .out$deq__ENA(writeBeat$out$deq__ENA),
        .out$deq__RDY(writeBeat$out$deq__RDY),
        .out$first(writeBeat$out$first),
        .out$first__RDY(writeBeat$out$first__RDY));
    Fifo1Base#(38) readData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(readBeat$out$first__RDY & readBeat$out$deq__RDY),
        .in$enq$v({ RULE$lread$agg_2e_tmp$data , readBeat$out$first[ ( ( 6 - 1 ) + 1 ) : 1 ] }),
        .in$enq__RDY(readData$in$enq__RDY),
        .out$deq__ENA(readData$out$first__RDY & MAXIGP0_I$R__RDY),
        .out$deq__RDY(readData$out$deq__RDY),
        .out$first(readData$out$first),
        .out$first__RDY(readData$out$first__RDY));
    Fifo1Base#(32) writeData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$W__ENA),
        .in$enq$v({ MAXIGP0_O$W$data }),
        .in$enq__RDY(writeData$in$enq__RDY),
        .out$deq__ENA(writeData$out$deq__ENA),
        .out$deq__RDY(writeData$out$deq__RDY),
        .out$first(writeData$out$first),
        .out$first__RDY(writeData$out$first__RDY));
    Fifo1Base#(6) writeDone (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(writeDone$in$enq__ENA),
        .in$enq$v(writeBeat$out$first[ ( ( 6 - 1 ) + 1 ) : 1 ]),
        .in$enq__RDY(writeDone$in$enq__RDY),
        .out$deq__ENA(writeDone$out$first__RDY & MAXIGP0_I$B__RDY),
        .out$deq__RDY(writeDone$out$deq__RDY),
        .out$first(MAXIGP0_I$B$id),
        .out$first__RDY(writeDone$out$first__RDY));
    UserTop user (.CLK(CLK), .nRST(nRST),
        .write$enq__ENA(user$write$enq__ENA),
        .write$enq$v(writeData$out$first),
        .write$enq$length(user$write$enq$length),
        .write$enq__RDY(user$write$enq__RDY),
        .read$enq__ENA(user$read$enq__ENA),
        .read$enq$v(user$read$enq$v),
        .read$enq$length(user$read$enq$length),
        .read$enq__RDY(requestLength == 0));
    assign MAXIGP0_I$B$resp = 2'd0;
    assign MAXIGP0_I$B__ENA = writeDone$out$first__RDY & writeDone$out$deq__RDY;
    assign MAXIGP0_I$R$data = readData$out$first[ 32 - 1 + 6 : 6 ];
    assign MAXIGP0_I$R$id = readData$out$first[ 6 - 1 : 0 ];
    assign MAXIGP0_I$R$last = 1;
    assign MAXIGP0_I$R$resp = 2'd0;
    assign MAXIGP0_I$R__ENA = readData$out$first__RDY & readData$out$deq__RDY;
    assign MAXIGP0_O$AR__RDY = reqArs$in$enq__RDY;
    assign MAXIGP0_O$AW__RDY = reqAws$in$enq__RDY;
    assign MAXIGP0_O$W__RDY = writeData$in$enq__RDY;
    assign interrupt = !( ( requestLength == 0 ) | ( !intEnable ) );
    assign readBeat$in$enq__ENA = reqArs$out$first__RDY & ( reqArs$out$deq__RDY | ( !( readNotFirst ? readLast : ( reqArs$out$first[ ( ( 4 - 1 ) + 6 ) : 6 ] == 1 ) ) ) );
    assign reqArs$out$deq__ENA = reqArs$out$first__RDY & readBeat$in$enq__RDY & ( readNotFirst ? readLast : ( reqArs$out$first[ ( ( 4 - 1 ) + 6 ) : 6 ] == 1 ) );
    assign reqAws$out$deq__ENA = reqAws$out$first__RDY & writeBeat$in$enq__RDY & ( writeNotFirst ? writeLast : ( reqAws$out$first[ ( ( 4 - 1 ) + 6 ) : 6 ] == 1 ) );
    assign user$write$enq$length = writeBeat$out$first[ 5 - 1 + 11 : 11 ] != 0;
    assign user$write$enq__ENA = !( portalWControl | ( !( writeBeat$out$first__RDY & writeBeat$out$deq__RDY & writeData$out$first__RDY & writeData$out$deq__RDY & ( writeDone$in$enq__RDY | ( !writeBeat$out$first[ ( 1 - 1 ) : 0 ] ) ) ) ) );
    assign writeBeat$in$enq__ENA = reqAws$out$first__RDY & ( reqAws$out$deq__RDY | ( !( writeNotFirst ? writeLast : ( reqAws$out$first[ ( ( 4 - 1 ) + 6 ) : 6 ] == 1 ) ) ) );
    assign writeBeat$out$deq__ENA = writeBeat$out$first__RDY & writeData$out$first__RDY & writeData$out$deq__RDY & ( ( writeDone$in$enq__RDY & ( portalWControl | user$write$enq__RDY ) ) | ( ( !writeDone$in$enq__RDY ) & ( !( ( portalWControl & writeBeat$out$first[ ( 1 - 1 ) : 0 ] ) | ( ( !portalWControl ) & ( writeBeat$out$first[ ( 1 - 1 ) : 0 ] | ( !user$write$enq__RDY ) ) ) ) ) ) );
    assign writeData$out$deq__ENA = writeBeat$out$first__RDY & writeBeat$out$deq__RDY & writeData$out$first__RDY & ( ( writeDone$in$enq__RDY & ( portalWControl | user$write$enq__RDY ) ) | ( ( !writeDone$in$enq__RDY ) & ( !( ( portalWControl & writeBeat$out$first[ ( 1 - 1 ) : 0 ] ) | ( ( !portalWControl ) & ( writeBeat$out$first[ ( 1 - 1 ) : 0 ] | ( !user$write$enq__RDY ) ) ) ) ) ) );
    assign writeDone$in$enq__ENA = writeBeat$out$first__RDY & writeBeat$out$deq__RDY & writeData$out$first__RDY & writeData$out$deq__RDY & ( ( portalWControl & writeBeat$out$first[ ( 1 - 1 ) : 0 ] ) | ( ( !portalWControl ) & writeBeat$out$first[ ( 1 - 1 ) : 0 ] & user$write$enq__RDY ) );
    // Extra assigments, not to output wires
    assign MAXIGP0_O$AR$agg_2e_tmp = { MAXIGP0_O$AR$addr[ 4 : 0 ] , MAXIGP0_O$AR$len + 4'd1 , MAXIGP0_O$AR$id[ 5 : 0 ] };
    assign MAXIGP0_O$AW$agg_2e_tmp = { MAXIGP0_O$AW$addr[ 4 : 0 ] , MAXIGP0_O$AW$len + 4'd1 , MAXIGP0_O$AW$id[ 5 : 0 ] };
    assign RULE$lR$temp = { readData$out$first[ 32 - 1 + 6 : 6 ] , readData$out$first[ 6 - 1 : 0 ] };
    assign RULE$lread$agg_2e_tmp = { RULE$lread$agg_2e_tmp$data , readBeat$out$first[ 6 - 1 + 1 : 1 ] };
    assign RULE$lread$agg_2e_tmp$data = ( portalRControl ? RULE$lread$portalCtrlInfo : 32'd0 ) | ( ( !portalRControl ) ? RULE$lread$res : 32'd0 );
    assign RULE$lread$portalCtrlInfo = ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[ ( ( 5 - 1 ) + 11 ) : 11 ] == 0 ) ) ? ( ( ( !selectRIndReq ) ? requestLength : 32'd0 ) ) : 32'd0 ) | ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[ ( ( 5 - 1 ) + 11 ) : 11 ] == 8 ) ) ? 32'd1 : 32'd0 ) | ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[ ( ( 5 - 1 ) + 11 ) : 11 ] == 12 ) ) ? ( ( ( !selectRIndReq ) ? requestLength : 32'd0 ) ) : 32'd0 ) | ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[ ( ( 5 - 1 ) + 11 ) : 11 ] == 16 ) ) ? ( selectRIndReq ? 32'd6 : 32'd5 ) : 32'd0 ) | ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[ ( ( 5 - 1 ) + 11 ) : 11 ] == 20 ) ) ? 32'd2 : 32'd0 );
    assign RULE$lread$res = ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[ ( ( 5 - 1 ) + 11 ) : 11 ] == 0 ) ) ? requestValue : 32'd0 ) | ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[ ( ( 5 - 1 ) + 11 ) : 11 ] == 4 ) ) ? user$write$enq__RDY : 1'd0 );
    assign RULE$lread$temp = { readBeat$out$first[ 5 - 1 + 11 : 11 ] , readBeat$out$first[ 4 - 1 + 7 : 7 ] , readBeat$out$first[ 6 - 1 + 1 : 1 ] , readBeat$out$first[ ( 1 - 1 ) : 0 ] };
    assign RULE$lread$temp$ac$addr = readBeat$out$first[ 5 - 1 + 11 : 11 ];
    assign RULE$lreadNext$agg_2e_tmp = { RULE$lreadNext$agg_2e_tmp$ac$addr , RULE$lreadNext$agg_2e_tmp$ac$count , reqArs$out$first[ 6 - 1 : 0 ] , RULE$lreadNext$agg_2e_tmp$last };
    assign RULE$lreadNext$agg_2e_tmp$ac$addr = readNotFirst ? readAddr : reqArs$out$first[ 5 - 1 + 10 : 10 ];
    assign RULE$lreadNext$agg_2e_tmp$ac$count = readNotFirst ? readCount : reqArs$out$first[ 4 - 1 + 6 : 6 ];
    assign RULE$lreadNext$agg_2e_tmp$last = readNotFirst ? readLast : ( reqArs$out$first[ ( ( 4 - 1 ) + 6 ) : 6 ] == 1 );
    assign RULE$lreadNext$temp = { reqArs$out$first[ 5 - 1 + 10 : 10 ] , reqArs$out$first[ 4 - 1 + 6 : 6 ] , reqArs$out$first[ 6 - 1 : 0 ] };
    assign RULE$lreadNext$temp$addr = reqArs$out$first[ 5 - 1 + 10 : 10 ];
    assign RULE$lreadNext$temp$count = reqArs$out$first[ 4 - 1 + 6 : 6 ];
    assign RULE$lreadNext__ENA = reqArs$out$first__RDY & readBeat$in$enq__RDY & ( reqArs$out$deq__RDY | ( !( readNotFirst ? readLast : ( reqArs$out$first[ ( ( 4 - 1 ) + 6 ) : 6 ] == 1 ) ) ) );
    assign RULE$lreadNext__RDY = reqArs$out$first__RDY & readBeat$in$enq__RDY & ( reqArs$out$deq__RDY | ( !( readNotFirst ? readLast : ( reqArs$out$first[ ( ( 4 - 1 ) + 6 ) : 6 ] == 1 ) ) ) );
    assign RULE$lwrite$temp = writeData$out$first;
    assign RULE$lwrite$temp$data = writeData$out$first;
    assign RULE$lwrite$wb = { writeBeat$out$first[ 5 - 1 + 11 : 11 ] , writeBeat$out$first[ 4 - 1 + 7 : 7 ] , writeBeat$out$first[ 6 - 1 + 1 : 1 ] , writeBeat$out$first[ ( 1 - 1 ) : 0 ] };
    assign RULE$lwrite$wb$ac$addr = writeBeat$out$first[ 5 - 1 + 11 : 11 ];
    assign RULE$lwriteNext$agg_2e_tmp = { RULE$lwriteNext$agg_2e_tmp$ac$addr , RULE$lwriteNext$agg_2e_tmp$ac$count , reqAws$out$first[ 6 - 1 : 0 ] , RULE$lwriteNext$agg_2e_tmp$last };
    assign RULE$lwriteNext$agg_2e_tmp$ac$addr = writeNotFirst ? writeAddr : reqAws$out$first[ 5 - 1 + 10 : 10 ];
    assign RULE$lwriteNext$agg_2e_tmp$ac$count = writeNotFirst ? writeCount : reqAws$out$first[ 4 - 1 + 6 : 6 ];
    assign RULE$lwriteNext$agg_2e_tmp$last = writeNotFirst ? writeLast : ( reqAws$out$first[ ( ( 4 - 1 ) + 6 ) : 6 ] == 1 );
    assign RULE$lwriteNext$temp = { reqAws$out$first[ 5 - 1 + 10 : 10 ] , reqAws$out$first[ 4 - 1 + 6 : 6 ] , reqAws$out$first[ 6 - 1 : 0 ] };
    assign RULE$lwriteNext$temp$addr = reqAws$out$first[ 5 - 1 + 10 : 10 ];
    assign RULE$lwriteNext$temp$count = reqAws$out$first[ 4 - 1 + 6 : 6 ];
    assign RULE$lwriteNext__ENA = reqAws$out$first__RDY & writeBeat$in$enq__RDY & ( reqAws$out$deq__RDY | ( !( writeNotFirst ? writeLast : ( reqAws$out$first[ ( ( 4 - 1 ) + 6 ) : 6 ] == 1 ) ) ) );
    assign RULE$lwriteNext__RDY = reqAws$out$first__RDY & writeBeat$in$enq__RDY & ( reqAws$out$deq__RDY | ( !( writeNotFirst ? writeLast : ( reqAws$out$first[ ( ( 4 - 1 ) + 6 ) : 6 ] == 1 ) ) ) );
    assign RULE$lwrite__ENA = writeBeat$out$first__RDY & writeBeat$out$deq__RDY & writeData$out$first__RDY & writeData$out$deq__RDY & ( ( writeDone$in$enq__RDY & ( portalWControl | user$write$enq__RDY ) ) | ( ( !writeDone$in$enq__RDY ) & ( !( ( portalWControl & writeBeat$out$first[ ( 1 - 1 ) : 0 ] ) | ( ( !portalWControl ) & ( writeBeat$out$first[ ( 1 - 1 ) : 0 ] | ( !user$write$enq__RDY ) ) ) ) ) ) );
    assign RULE$lwrite__RDY = writeBeat$out$first__RDY & writeBeat$out$deq__RDY & writeData$out$first__RDY & writeData$out$deq__RDY & ( ( writeDone$in$enq__RDY & ( portalWControl | user$write$enq__RDY ) ) | ( ( !writeDone$in$enq__RDY ) & ( !( ( portalWControl & writeBeat$out$first[ ( 1 - 1 ) : 0 ] ) | ( ( !portalWControl ) & ( writeBeat$out$first[ ( 1 - 1 ) : 0 ] | ( !user$write$enq__RDY ) ) ) ) ) ) );

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
        if (MAXIGP0_O$AR__ENA & reqArs$in$enq__RDY) begin // MAXIGP0_O$AR__ENA
            portalRControl <= MAXIGP0_O$AR$addr[ 11 : 5 ] == 0;
            selectRIndReq <= MAXIGP0_O$AR$addr[ 12 ];
        end; // End of MAXIGP0_O$AR__ENA
        if (MAXIGP0_O$AW__ENA & reqAws$in$enq__RDY) begin // MAXIGP0_O$AW__ENA
            portalWControl <= MAXIGP0_O$AW$addr[ 11 : 5 ] == 0;
            selectWIndReq <= MAXIGP0_O$AW$addr[ 12 ];
        end; // End of MAXIGP0_O$AW__ENA
        if (RULE$lreadNext__ENA & RULE$lreadNext__RDY) begin // RULE$lreadNext__ENA
            readAddr <= ( readNotFirst ? readAddr : RULE$lreadNext$temp$addr ) + 4;
            readCount <= ( readNotFirst ? readCount : RULE$lreadNext$temp$count ) - 1;
            readNotFirst <= ( ( readNotFirst ? readLast : ( RULE$lreadNext$temp$count == 1 ) ) != 0 ) ^ 1;
            readLast <= ( readNotFirst ? readCount : RULE$lreadNext$temp$count ) == 2;
        end; // End of RULE$lreadNext__ENA
        if (readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY) begin // RULE$lread__ENA
            if (( RULE$lread$temp$ac$addr == 0 ) & ( portalRControl == 0 ))
            requestLength <= 0;
        end; // End of RULE$lread__ENA
        if (RULE$lwriteNext__ENA & RULE$lwriteNext__RDY) begin // RULE$lwriteNext__ENA
            writeAddr <= ( writeNotFirst ? writeAddr : RULE$lwriteNext$temp$addr ) + 4;
            writeCount <= ( writeNotFirst ? writeCount : RULE$lwriteNext$temp$count ) - 1;
            writeNotFirst <= ( ( writeNotFirst ? writeLast : ( RULE$lwriteNext$temp$count == 1 ) ) != 0 ) ^ 1;
            writeLast <= ( writeNotFirst ? writeCount : RULE$lwriteNext$temp$count ) == 2;
        end; // End of RULE$lwriteNext__ENA
        if (RULE$lwrite__ENA & RULE$lwrite__RDY) begin // RULE$lwrite__ENA
            if (!( ( portalWControl == 0 ) | ( !( RULE$lwrite$wb$ac$addr == 4 ) ) ))
            intEnable <= RULE$lwrite$temp$data[ 0 : 0 ];
        end; // End of RULE$lwrite__ENA
        if (user$read$enq__ENA & ( requestLength == 0 )) begin // readUser$enq__ENA
            requestValue <= user$read$enq$v;
            requestLength <= user$read$enq$length;
        end; // End of readUser$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
