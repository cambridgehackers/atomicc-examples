`include "zynqTop.generated.vh"

`default_nettype none
module TestTop ( input wire CLK, input wire nRST,
    input wire MAXIGP0_O$AR__ENA,
    input wire [31:0]MAXIGP0_O$AR$addr,
    input wire [11:0]MAXIGP0_O$AR$id,
    input wire [3:0]MAXIGP0_O$AR$len,
    output wire MAXIGP0_O$AR__RDY,
    input wire MAXIGP0_O$AW__ENA,
    input wire [31:0]MAXIGP0_O$AW$addr,
    input wire [11:0]MAXIGP0_O$AW$id,
    input wire [3:0]MAXIGP0_O$AW$len,
    output wire MAXIGP0_O$AW__RDY,
    input wire MAXIGP0_O$W__ENA,
    input wire [31:0]MAXIGP0_O$W$data,
    input wire [11:0]MAXIGP0_O$W$id,
    input wire MAXIGP0_O$W$last,
    output wire MAXIGP0_O$W__RDY,
    output wire MAXIGP0_I$B__ENA,
    output wire [11:0]MAXIGP0_I$B$id,
    output wire [1:0]MAXIGP0_I$B$resp,
    input wire MAXIGP0_I$B__RDY,
    output wire MAXIGP0_I$R__ENA,
    output wire [31:0]MAXIGP0_I$R$data,
    output wire [11:0]MAXIGP0_I$R$id,
    output wire MAXIGP0_I$R$last,
    output wire [1:0]MAXIGP0_I$R$resp,
    input wire MAXIGP0_I$R__RDY,
    output wire interrupt);
`ifdef FOOFOF
    reg haveUser;
    reg intEnable;
    reg [31:0]portalCtrlInfo;
    reg portalRControl;
    reg portalWControl;
    reg [4:0]readAddr;
    reg [3:0]readCount;
    reg readLast;
    reg readNotFirst;
    reg [31:0]requestValue;
    reg selectRIndReq;
    reg selectWIndReq;
    reg [4:0]writeAddr;
    reg [3:0]writeCount;
    reg writeLast;
    reg writeNotFirst;
    reg writeReady;
    wire RULEinit__ENA;
    wire RULEinit__RDY;
    wire RULElR__ENA;
    wire RULElR__RDY;
    wire RULElreadNext__ENA;
    wire RULElreadNext__ENA$agg_2e_tmp$last;
    wire [4:0]RULElreadNext__ENA$readAddrupdate;
    wire RULElreadNext__ENA$readLastNext;
    wire RULElreadNext__ENA$zzIntrChannel;
    wire RULElreadNext__RDY;
    wire RULElread__ENA;
    wire [31:0]RULElread__ENA$res;
    wire [4:0]RULElread__ENA$temp$ac$addr;
    wire RULElread__RDY;
    wire RULElwriteNext__ENA;
    wire RULElwriteNext__ENA$agg_2e_tmp$last;
    wire RULElwriteNext__ENA$writeLastNext;
    wire RULElwriteNext__RDY;
    wire RULElwrite__ENA;
    wire [31:0]RULElwrite__ENA$temp$data;
    wire [4:0]RULElwrite__ENA$wb$ac$addr;
    wire RULElwrite__ENA$wb$last;
    wire RULElwrite__RDY;
    wire RULEwriteResponse__ENA;
    wire RULEwriteResponse__RDY;
    wire readBeat$in$enq__ENA;
    wire readBeat$in$enq__RDY;
    wire readBeat$out$deq__RDY;
    wire [15:0]readBeat$out$first;
    wire readData$in$enq__RDY;
    wire readData$out$deq__RDY;
    wire [37:0]readData$out$first;
    wire readUser$enq$last;
    wire [31:0]readUser$enq$v;
    wire readUser$enq__ENA;
    wire readUser$enq__RDY;
    wire reqArs$out$deq__RDY;
    wire [14:0]reqArs$out$first;
    wire reqAws$out$deq__RDY;
    wire [14:0]reqAws$out$first;
    wire user$read$enq$last;
    wire [31:0]user$read$enq$v;
    wire user$read$enq__ENA;
    wire user$read$enq__RDY;
    wire user$write$enq$last;
    wire user$write$enq__ENA;
    wire user$write$enq__RDY;
    wire writeBeat$in$enq__ENA;
    wire writeBeat$in$enq__RDY;
    wire writeBeat$out$deq__ENA;
    wire writeBeat$out$deq__RDY;
    wire [15:0]writeBeat$out$first;
    wire writeData$out$deq__ENA;
    wire writeData$out$deq__RDY;
    wire [31:0]writeData$out$first;
    wire writeDone$in$enq__ENA;
    wire writeDone$in$enq__RDY;
    wire writeDone$out$deq__RDY;
    assign MAXIGP0_I$B$resp = 0;
    assign MAXIGP0_I$R$data = readData$out$first[37:6];
    assign MAXIGP0_I$R$id = {6'd0, readData$out$first[5:0]};
    assign MAXIGP0_I$R$last = readData$out$deq__RDY & MAXIGP0_I$R__RDY;
    assign MAXIGP0_I$R$resp = 0;
    assign RULEinit__ENA = 1;
    assign RULElR__ENA = readData$out$deq__RDY & MAXIGP0_I$R__RDY;
    assign RULElreadNext__ENA = reqArs$out$deq__RDY & readBeat$in$enq__RDY & ( ( !RULElreadNext__ENA$readLastNext ) | reqArs$out$deq__RDY );
    assign RULElread__ENA = readBeat$out$deq__RDY & readData$in$enq__RDY;
    assign RULElwriteNext__ENA = reqAws$out$deq__RDY & writeBeat$in$enq__RDY & ( ( !RULElwriteNext__ENA$writeLastNext ) | reqAws$out$deq__RDY );
    assign RULElwrite__ENA = writeBeat$out$deq__RDY & writeData$out$deq__RDY & ( ( !RULElwrite__ENA$wb$last ) | writeDone$in$enq__RDY ) & ( portalWControl | RULElwrite__ENA$wb$last | user$write$enq__RDY );
    assign RULEwriteResponse__ENA = writeDone$out$deq__RDY & MAXIGP0_I$B__RDY;
    assign interrupt = haveUser & intEnable;
    Fifo1_OC_10 reqArs (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$AR__ENA),
        .in$enq$v({ MAXIGP0_O$AR$addr[4:0] , MAXIGP0_O$AR$len + 4'd1 , MAXIGP0_O$AR$id[5:0] }),
        .in$enq__RDY(MAXIGP0_O$AR__RDY),
        .out$deq__ENA(RULElreadNext__ENA$readLastNext & readBeat$in$enq__RDY),
        .out$deq__RDY(reqArs$out$deq__RDY),
        .out$first(reqArs$out$first),
        .out$first__RDY());
    Fifo1_OC_10 reqAws (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$AW__ENA),
        .in$enq$v({ MAXIGP0_O$AW$addr[4:0] , MAXIGP0_O$AW$len + 4'd1 , MAXIGP0_O$AW$id[5:0] }),
        .in$enq__RDY(MAXIGP0_O$AW__RDY),
        .out$deq__ENA(RULElwriteNext__ENA$writeLastNext & writeBeat$in$enq__RDY),
        .out$deq__RDY(reqAws$out$deq__RDY),
        .out$first(reqAws$out$first),
        .out$first__RDY());
    Fifo1_OC_12 readBeat (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(readBeat$in$enq__ENA),
        .in$enq$v({ readNotFirst ? readAddr : reqArs$out$first[ 14 : 10 ] , readNotFirst ? readCount : reqArs$out$first[ 9 : 6 ] , reqArs$out$first[ 5 : 0 ] , RULElreadNext__ENA$agg_2e_tmp$last }),
        .in$enq__RDY(readBeat$in$enq__RDY),
        .out$deq__ENA(readData$in$enq__RDY),
        .out$deq__RDY(readBeat$out$deq__RDY),
        .out$first(readBeat$out$first),
        .out$first__RDY());
    Fifo1_OC_12 writeBeat (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(writeBeat$in$enq__ENA),
        .in$enq$v({ writeNotFirst ? writeAddr : reqAws$out$first[ 14 : 10 ] , writeNotFirst ? writeCount : reqAws$out$first[ 9 : 6 ] , reqAws$out$first[ 5 : 0 ] , RULElwriteNext__ENA$agg_2e_tmp$last }),
        .in$enq__RDY(writeBeat$in$enq__RDY),
        .out$deq__ENA(writeBeat$out$deq__ENA),
        .out$deq__RDY(writeBeat$out$deq__RDY),
        .out$first(writeBeat$out$first),
        .out$first__RDY());
    Fifo1_OC_14 readData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(readBeat$out$deq__RDY),
        .in$enq$v({ portalRControl ? portalCtrlInfo : RULElread__ENA$res , readBeat$out$first[ 6 : 1 ] }),
        .in$enq__RDY(readData$in$enq__RDY),
        .out$deq__ENA(MAXIGP0_I$R__RDY),
        .out$deq__RDY(MAXIGP0_I$R__ENA),
        .out$first(readData$out$first),
        .out$first__RDY());
    Fifo1_OC_16 writeData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$W__ENA),
        .in$enq$v({ MAXIGP0_O$W$data }),
        .in$enq__RDY(MAXIGP0_O$W__RDY),
        .out$deq__ENA(writeData$out$deq__ENA),
        .out$deq__RDY(writeData$out$deq__RDY),
        .out$first(writeData$out$first),
        .out$first__RDY());
    wire [5: 0] writeDone$out$first;
    assign MAXIGP0_I$B$id = {6'd0, writeDone$out$first};
    Fifo1_OC_18 writeDone (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(writeDone$in$enq__ENA),
        .in$enq$v(writeBeat$out$first[ 6 : 1 ]),
        .in$enq__RDY(writeDone$in$enq__RDY),
        .out$deq__ENA(MAXIGP0_I$B__RDY),
        .out$deq__RDY(MAXIGP0_I$B__ENA),
        .out$first(writeDone$out$first),
        .out$first__RDY());
    UserTop user (.CLK(CLK), .nRST(nRST),
        .write$enq__ENA(user$write$enq__ENA),
        .write$enq$v(writeData$out$first[ 31 : 0 ]),
        .write$enq$last(user$write$enq$last),
        .write$enq__RDY(user$write$enq__RDY),
        .read$enq__ENA(user$read$enq__ENA),
        .read$enq$v(user$read$enq$v),
        .read$enq$last(user$read$enq$last),
        .read$enq__RDY(user$read$enq__RDY));
    assign readBeat$in$enq__ENA = reqArs$out$deq__RDY & ( ( !RULElreadNext__ENA$readLastNext ) | reqArs$out$deq__RDY );
    assign readUser$enq$last = user$read$enq$last;
    assign readUser$enq$v = user$read$enq$v;
    assign readUser$enq__ENA = user$read$enq__ENA;
    assign readUser$enq__RDY = user$read$enq__RDY;
    assign user$write$enq$last = ( !portalWControl ) & ( !RULElwrite__ENA$wb$last ) & writeBeat$out$deq__RDY & writeData$out$deq__RDY & ( ( !RULElwrite__ENA$wb$last ) | writeDone$in$enq__RDY ) & ( portalWControl | RULElwrite__ENA$wb$last | user$write$enq__RDY ) & ( writeBeat$out$first[15:11] != 5'd0 );
    assign user$write$enq__ENA = ( !portalWControl ) & ( !RULElwrite__ENA$wb$last ) & writeBeat$out$deq__RDY & writeData$out$deq__RDY & ( ( !RULElwrite__ENA$wb$last ) | writeDone$in$enq__RDY );
    assign writeBeat$in$enq__ENA = reqAws$out$deq__RDY & ( ( !RULElwriteNext__ENA$writeLastNext ) | reqAws$out$deq__RDY );
    assign writeBeat$out$deq__ENA = writeData$out$deq__RDY & ( ( !RULElwrite__ENA$wb$last ) | writeDone$in$enq__RDY ) & ( portalWControl | RULElwrite__ENA$wb$last | user$write$enq__RDY );
    assign writeData$out$deq__ENA = writeBeat$out$deq__RDY & ( ( !RULElwrite__ENA$wb$last ) | writeDone$in$enq__RDY ) & ( portalWControl | RULElwrite__ENA$wb$last | user$write$enq__RDY );
    assign writeDone$in$enq__ENA = RULElwrite__ENA$wb$last & writeBeat$out$deq__RDY & writeData$out$deq__RDY & ( portalWControl | RULElwrite__ENA$wb$last | user$write$enq__RDY );
    // Extra assigments, not to output wires
    assign RULEinit__RDY = 1;
    assign RULElR__RDY = readData$out$deq__RDY & MAXIGP0_I$R__RDY;
    assign RULElreadNext__ENA$agg_2e_tmp$last = reqArs$out$deq__RDY & readBeat$in$enq__RDY & ( ( !RULElreadNext__ENA$readLastNext ) | reqArs$out$deq__RDY ) & RULElreadNext__ENA$readLastNext;
    assign RULElreadNext__ENA$readAddrupdate = readNotFirst ? readAddr : reqArs$out$first[14:10];
    assign RULElreadNext__ENA$readLastNext = reqArs$out$deq__RDY & readBeat$in$enq__RDY & ( reqArs$out$deq__RDY ) & ( readNotFirst ? readLast : ( reqArs$out$first[9:6] == 4'd1 ) );
    assign RULElreadNext__ENA$zzIntrChannel = reqArs$out$deq__RDY & readBeat$in$enq__RDY & ( ( !RULElreadNext__ENA$readLastNext ) | reqArs$out$deq__RDY ) & ( !selectRIndReq ) & haveUser;
    assign RULElreadNext__RDY = reqArs$out$deq__RDY & readBeat$in$enq__RDY & ( ( !RULElreadNext__ENA$readLastNext ) | reqArs$out$deq__RDY );
    assign RULElread__ENA$res = ( readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[15:11] == 5'd0 ) ) ? requestValue : 
{31'd0, ( readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[15:11] == 5'd4 ) & writeReady )};
    assign RULElread__ENA$temp$ac$addr = readBeat$out$first[15:11];
    assign RULElread__RDY = readBeat$out$deq__RDY & readData$in$enq__RDY;
    assign RULElwriteNext__ENA$agg_2e_tmp$last = reqAws$out$deq__RDY & writeBeat$in$enq__RDY & ( ( !RULElwriteNext__ENA$writeLastNext ) | reqAws$out$deq__RDY ) & RULElwriteNext__ENA$writeLastNext;
    assign RULElwriteNext__ENA$writeLastNext = reqAws$out$deq__RDY & writeBeat$in$enq__RDY & ( reqAws$out$deq__RDY ) & ( writeNotFirst ? writeLast : ( reqAws$out$first[9:6] == 4'd1 ) );
    assign RULElwriteNext__RDY = reqAws$out$deq__RDY & writeBeat$in$enq__RDY & ( ( !RULElwriteNext__ENA$writeLastNext ) | reqAws$out$deq__RDY );
    assign RULElwrite__ENA$temp$data = writeData$out$first[31:0];
    assign RULElwrite__ENA$wb$ac$addr = writeBeat$out$first[15:11];
    assign RULElwrite__ENA$wb$last = writeBeat$out$deq__RDY & writeData$out$deq__RDY & ( writeDone$in$enq__RDY ) & ( portalWControl | user$write$enq__RDY ) & writeBeat$out$first[0:0];
    assign RULElwrite__RDY = writeBeat$out$deq__RDY & writeData$out$deq__RDY & ( ( !RULElwrite__ENA$wb$last ) | writeDone$in$enq__RDY ) & ( portalWControl | RULElwrite__ENA$wb$last | user$write$enq__RDY );
    assign RULEwriteResponse__RDY = writeDone$out$deq__RDY & MAXIGP0_I$B__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        haveUser <= 0;
        intEnable <= 0;
        portalCtrlInfo <= 0;
        portalRControl <= 0;
        portalWControl <= 0;
        readAddr <= 0;
        readCount <= 0;
        readLast <= 0;
        readNotFirst <= 0;
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
        if (MAXIGP0_O$AR__ENA & MAXIGP0_O$AR__RDY) begin
            portalRControl <= MAXIGP0_O$AR$addr[ 11 : 5 ] == 7'd0;
            selectRIndReq <= MAXIGP0_O$AR$addr[ 12 ];
        end; // End of MAXIGP0_O$AR__ENA
        if (MAXIGP0_O$AW__ENA & MAXIGP0_O$AW__RDY) begin
            portalWControl <= MAXIGP0_O$AW$addr[ 11 : 5 ] == 7'd0;
            selectWIndReq <= MAXIGP0_O$AW$addr[ 12 ];
        end; // End of MAXIGP0_O$AW__ENA
        if (RULEinit__ENA & RULEinit__RDY) begin
            writeReady <= user$write$enq__RDY;
        end; // End of RULEinit__ENA
        if (RULElreadNext__ENA & RULElreadNext__RDY) begin
            portalCtrlInfo <= 0;
            readAddr <= ( readNotFirst ? readAddr : reqArs$out$first[ 14 : 10 ] ) + 4;
            readCount <= ( readNotFirst ? readCount : reqArs$out$first[ 9 : 6 ] ) - 1;
            readNotFirst <= !RULElreadNext__ENA$readLastNext;
            readLast <= ( readNotFirst ? readCount : reqArs$out$first[ 9 : 6 ] ) == 2;
            if (( RULElreadNext__ENA$readAddrupdate == 0 ) & ( selectRIndReq != 0 ))
            portalCtrlInfo <= {31'd0, RULElreadNext__ENA$zzIntrChannel};
            if (( RULElreadNext__ENA$readAddrupdate == 8 ) & ( selectRIndReq != 0 ))
            portalCtrlInfo <= 1;
            if (( RULElreadNext__ENA$readAddrupdate == 12 ) & ( selectRIndReq != 0 ))
            portalCtrlInfo <= {31'd0, RULElreadNext__ENA$zzIntrChannel};
            if (( RULElreadNext__ENA$readAddrupdate == 16 ) & ( selectRIndReq != 0 ))
            portalCtrlInfo <= 5;
            if (( RULElreadNext__ENA$readAddrupdate == 20 ) & ( selectRIndReq != 0 ))
            portalCtrlInfo <= 2;
        end; // End of RULElreadNext__ENA
        if (RULElread__ENA & RULElread__RDY) begin
            if (RULElread__ENA$temp$ac$addr == 0)
            haveUser <= 0;
        end; // End of RULElread__ENA
        if (RULElwriteNext__ENA & RULElwriteNext__RDY) begin
            writeAddr <= ( writeNotFirst ? writeAddr : reqAws$out$first[ 14 : 10 ] ) + 4;
            writeCount <= ( writeNotFirst ? writeCount : reqAws$out$first[ 9 : 6 ] ) - 1;
            writeNotFirst <= !RULElwriteNext__ENA$writeLastNext;
            writeLast <= ( writeNotFirst ? writeCount : reqAws$out$first[ 9 : 6 ] ) == 2;
        end; // End of RULElwriteNext__ENA
        if (RULElwrite__ENA & RULElwrite__RDY) begin
            if (( RULElwrite__ENA$wb$ac$addr == 4 ) & ( portalWControl != 0 ) & ( RULElwrite__ENA$wb$last == 0 ))
            intEnable <= RULElwrite__ENA$temp$data[ 0 : 0 ];
        end; // End of RULElwrite__ENA
        if (readUser$enq__ENA & readUser$enq__RDY) begin
            requestValue <= user$read$enq$v;
            haveUser <= 1;
        end; // End of readUser$enq__ENA
      end
    end // always @ (posedge CLK)
`else
//newNEW
  reg intEnable, writeNotFirst, writeLast, readNotFirst, readLast, selectRIndReq, portalRControl, selectWIndReq, portalWControl;
  reg [3 : 0] readCount, writeCount;
  reg [4 : 0] readAddr, writeAddr;

  wire [31 : 0] read$enq$v, write$enq$v;
  wire [31 : 0] requestValue, portalCtrlInfo;
  wire [3 : 0] readBeat$base, readburstCount, writeBeat$count, writeburstCount;
  wire [5 : 0] readBeat$id, reqArs$id, writeBeat$id, reqAws$id;
  wire [4 : 0] writeBeat$addr, reqAws$addr, writeAddrupdate, readBeat$addr, reqArs$addr, readAddrupdate;
  wire [3 : 0] reqArs$count, reqAws$count;

  wire write$enq__RDY, read$enq__ENA, readData$in$enq__RDY, zzIntrChannel;
  wire readBeat$out$deq__RDY, readBeat$in$enq__RDY;
  wire writeData$out$deq__RDY, readLastNext, writeLastNext, writeDone$in$enq__RDY, readBeat$last;
  wire writeBeat$out$deq__RDY, writeBeat$in$enq__RDY, reqAws$out$deq__RDY, writeBeat$last, reqArs$out$deq__RDY;

  wire RULEwriteNext, RULElwrite, RULEreadNext, RULElread;

  assign MAXIGP0_I$R$id[11:6] = 0;
  assign MAXIGP0_I$B$id[11:6] = 0;
  assign MAXIGP0_I$B$resp = 0;
  assign MAXIGP0_I$R$last = 1;
  assign MAXIGP0_I$R$resp = 0;

  Fifo1_OC_10 reqArs(.nRST(nRST), .CLK(CLK),
        .in$enq__ENA(MAXIGP0_O$AR__ENA),
        .in$enq$v({MAXIGP0_O$AR$addr[4:0], MAXIGP0_O$AR$len + 4'd1, MAXIGP0_O$AR$id[5:0]}),
        .in$enq__RDY(MAXIGP0_O$AR__RDY),
        .out$deq__ENA(RULEreadNext && readLastNext),
        .out$deq__RDY(reqArs$out$deq__RDY),
        .out$first({reqArs$addr, reqArs$count, reqArs$id}),
        .out$first__RDY());
  Fifo1_OC_10 reqAws(.nRST(nRST), .CLK(CLK),
        .in$enq__ENA(MAXIGP0_O$AW__ENA),
        .in$enq$v({MAXIGP0_O$AW$addr[4:0], MAXIGP0_O$AW$len + 4'd1, MAXIGP0_O$AW$id[5:0]}),
        .in$enq__RDY(MAXIGP0_O$AW__RDY),
        .out$deq__ENA(RULEwriteNext && writeLastNext),
        .out$deq__RDY(reqAws$out$deq__RDY),
        .out$first({reqAws$addr, reqAws$count, reqAws$id}),
        .out$first__RDY());
  Fifo1_OC_12 readBeat(.nRST(nRST), .CLK(CLK),
        .in$enq__ENA(RULEreadNext),
        .in$enq$v({readAddrupdate, readburstCount, reqArs$id, readLastNext}),
        .in$enq__RDY(readBeat$in$enq__RDY),
        .out$deq__ENA(RULElread),
        .out$deq__RDY(readBeat$out$deq__RDY),
        .out$first({readBeat$addr, readBeat$base, readBeat$id, readBeat$last}),
        .out$first__RDY());
  Fifo1_OC_12 writeBeat(.nRST(nRST), .CLK(CLK),
        .in$enq__ENA(RULEwriteNext),
        .in$enq$v({writeAddrupdate, writeburstCount, reqAws$id, writeLastNext}),
        .in$enq__RDY(writeBeat$in$enq__RDY),
        .out$deq__ENA(RULElwrite),
        .out$deq__RDY(writeBeat$out$deq__RDY),
        .out$first({writeBeat$addr, writeBeat$count, writeBeat$id, writeBeat$last}),
        .out$first__RDY());
  Fifo1_OC_14 readData(.nRST(nRST), .CLK(CLK),
        .in$enq__ENA(RULElread),
        .in$enq$v({portalRControl ? portalCtrlInfo : requestValue, readBeat$id}),
        .in$enq__RDY(readData$in$enq__RDY),
        .out$deq__ENA(MAXIGP0_I$R__RDY),
        .out$deq__RDY(MAXIGP0_I$R__ENA),
        .out$first({MAXIGP0_I$R$data, MAXIGP0_I$R$id[5:0]}),
        .out$first__RDY());
  Fifo1_OC_16 writeData(.nRST(nRST), .CLK(CLK),
        .in$enq__ENA(MAXIGP0_O$W__ENA),
        .in$enq$v(MAXIGP0_O$W$data),
        .in$enq__RDY(MAXIGP0_O$W__RDY),
        .out$deq__ENA(RULElwrite),
        .out$deq__RDY(writeData$out$deq__RDY),
        .out$first(write$enq$v),
        .out$first__RDY());
  Fifo1_OC_18 writeDone(.nRST(nRST), .CLK(CLK),
        .in$enq__ENA(RULElwrite && writeBeat$last),
        .in$enq$v(writeBeat$id),
        .in$enq__RDY(writeDone$in$enq__RDY),
        .out$deq__ENA(MAXIGP0_I$B__RDY),
        .out$deq__RDY(MAXIGP0_I$B__ENA),
        .out$first(MAXIGP0_I$B$id[5:0]),
        .out$first__RDY());

  UserTop user(.nRST(nRST), .CLK(CLK),
    .write$enq__ENA(RULElwrite && !portalWControl),
    .write$enq$v(write$enq$v), .write$enq$last(writeBeat$addr != 0),
    .write$enq__RDY(write$enq__RDY),
    .read$enq__ENA(read$enq__ENA),
    .read$enq$v(read$enq$v), .read$enq$last(),
    .read$enq__RDY(RULElread && !portalRControl));

  assign RULEreadNext = reqArs$out$deq__RDY && readBeat$in$enq__RDY;
  assign RULEwriteNext = reqAws$out$deq__RDY && writeBeat$in$enq__RDY ;
  assign RULElread = readBeat$out$deq__RDY && readData$in$enq__RDY;
  assign RULElwrite = writeData$out$deq__RDY && writeBeat$out$deq__RDY
            && (!writeBeat$last || writeDone$in$enq__RDY)
            && (!selectWIndReq || portalWControl);

  assign interrupt = read$enq__ENA && intEnable;
  assign zzIntrChannel = read$enq__ENA && !selectRIndReq;
  assign readAddrupdate = readNotFirst ? readAddr : reqArs$addr;
  assign readburstCount = readNotFirst ? readCount : reqArs$count;
  assign readLastNext = readNotFirst ? readLast : reqArs$count == 1;

  assign writeAddrupdate = writeNotFirst ? writeAddr : reqAws$addr;
  assign writeburstCount = writeNotFirst ? writeCount : reqAws$count;
  assign writeLastNext = writeNotFirst ? writeLast : reqAws$count == 1;

  assign requestValue = readBeat$addr == 0 ? read$enq$v : readBeat$addr == 4 ? write$enq__RDY : 0;
  assign portalCtrlInfo = readBeat$addr == 0 ? zzIntrChannel :
      readBeat$addr == 8 ? 1 :
      readBeat$addr == 5'h0C ? zzIntrChannel :
      readBeat$addr == 5'h10 ? (selectRIndReq ? 6 : 5) :
      readBeat$addr == 5'h14 ? 2 : 0;

  always@(posedge CLK)
  begin
    if (nRST == 0)
      begin
        intEnable <=  0;
        readAddr <= 0;
        readCount <= 0;
        readNotFirst <= 0;
        readLast <= 0;
        writeAddr <= 0;
        writeCount <= 0;
        writeNotFirst <= 0;
        writeLast <= 0;
      end
    else
      begin
        if (MAXIGP0_O$AR__ENA && MAXIGP0_O$AR__RDY) begin
            portalRControl <= MAXIGP0_O$AR$addr[11:5] == 7'd0;
            selectRIndReq <= MAXIGP0_O$AR$addr[12];
        end
        if (MAXIGP0_O$AW__ENA && MAXIGP0_O$AW__RDY) begin
            portalWControl <= MAXIGP0_O$AW$addr[11:5] == 7'd0;
            selectWIndReq <= MAXIGP0_O$AW$addr[12];
        end
        if (RULEreadNext) begin
          readAddr <= readAddrupdate + 4 ;
          readCount <= readburstCount - 1 ;
          readNotFirst <= !readLastNext;
          readLast <= readburstCount == 2 ;
        end
        if (RULElwrite && portalWControl && writeBeat$addr == 4)
          intEnable <= write$enq$v[0];

        if (RULEwriteNext) begin
          writeAddr <= writeAddrupdate + 4 ;
          writeCount <= writeburstCount - 1 ;
          writeNotFirst <= !writeLastNext ;
          writeLast <= writeburstCount == 2 ;
        end
      end
  end
`endif
endmodule 

`default_nettype wire    // set back to default value
