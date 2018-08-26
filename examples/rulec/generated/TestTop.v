`include "zynqTop.generated.vh"

`default_nettype none
module TestTop (
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
    output wire interrupt,
    input wire CLK,
    input wire nRST);
    reg intEnable;
    reg portalRControl;
    reg portalWControl;
    reg [4:0]readAddr;
    reg [3:0]readCount;
    reg readLast;
    reg readNotFirst;
    reg [15:0]requestLength;
    reg [31:0]requestValue;
    reg selectRIndReq;
    reg selectWIndReq;
    reg [4:0]writeAddr;
    reg [3:0]writeCount;
    reg writeLast;
    reg writeNotFirst;
    reg writeReady;
    wire [4:0]RULElreadNext__ENA$readAddrupdate;
    wire RULElreadNext__ENA$readLastNext;
    wire [3:0]RULElreadNext__ENA$readburstCount;
    wire [31:0]RULElread__ENA$portalCtrlInfo;
    wire [31:0]RULElread__ENA$res;
    wire [4:0]RULElread__ENA$temp$ac$addr;
    wire [15:0]RULElread__ENA$zzIntrChannel;
    wire [4:0]RULElwriteNext__ENA$writeAddrupdate;
    wire RULElwriteNext__ENA$writeLastNext;
    wire [3:0]RULElwriteNext__ENA$writeburstCount;
    wire RULElwrite__ENA;
    wire [31:0]RULElwrite__ENA$temp$data;
    wire [4:0]RULElwrite__ENA$wb$ac$addr;
    wire RULElwrite__RDY;
    wire readBeat$in$enq__RDY;
    wire readBeat$out$deq__RDY;
    wire [15:0]readBeat$out$first;
    wire readBeat$out$first__RDY;
    wire readData$in$enq__RDY;
    wire readData$out$deq__RDY;
    wire [37:0]readData$out$first;
    wire readData$out$first__RDY;
    wire reqArs$in$enq__RDY;
    wire [14:0]reqArs$out$first;
    wire reqArs$out$first__RDY;
    wire reqAws$in$enq__RDY;
    wire [14:0]reqAws$out$first;
    wire reqAws$out$first__RDY;
    wire [15:0]user$read$enq$length;
    wire [31:0]user$read$enq$v;
    wire user$read$enq__ENA;
    wire [15:0]user$write$enq$length;
    wire user$write$enq__ENA;
    wire user$write$enq__RDY;
    wire writeBeat$in$enq__RDY;
    wire writeBeat$out$deq__ENA;
    wire writeBeat$out$deq__RDY;
    wire [15:0]writeBeat$out$first;
    wire writeBeat$out$first__RDY;
    wire writeData$out$deq__ENA;
    wire writeData$out$deq__RDY;
    wire [31:0]writeData$out$first;
    wire writeData$out$first__RDY;
    wire writeDone$in$enq__ENA;
    wire writeDone$out$deq__RDY;
    wire writeDone$out$first__RDY;
    Fifo1_OC_23 reqArs (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$AR__ENA),
        .in$enq$v({ MAXIGP0_O$AR$addr[ 4 : 0 ] , MAXIGP0_O$AR$len + 4'd1 , MAXIGP0_O$AR$id[ 5 : 0 ] }),
        .in$enq__RDY(reqArs$in$enq__RDY),
        .out$deq__ENA(RULElreadNext__ENA$readLastNext & reqArs$out$first__RDY & readBeat$in$enq__RDY),
        .out$deq__RDY(),
        .out$first(reqArs$out$first),
        .out$first__RDY(reqArs$out$first__RDY));
    Fifo1_OC_23 reqAws (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$AW__ENA),
        .in$enq$v({ MAXIGP0_O$AW$addr[ 4 : 0 ] , MAXIGP0_O$AW$len + 4'd1 , MAXIGP0_O$AW$id[ 5 : 0 ] }),
        .in$enq__RDY(reqAws$in$enq__RDY),
        .out$deq__ENA(RULElwriteNext__ENA$writeLastNext & reqAws$out$first__RDY & writeBeat$in$enq__RDY),
        .out$deq__RDY(),
        .out$first(reqAws$out$first),
        .out$first__RDY(reqAws$out$first__RDY));
    Fifo1_OC_26 readBeat (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(reqArs$out$first__RDY),
        .in$enq$v({ RULElreadNext__ENA$readAddrupdate , RULElreadNext__ENA$readburstCount , reqArs$out$first[ 5 : 0 ] , RULElreadNext__ENA$readLastNext }),
        .in$enq__RDY(readBeat$in$enq__RDY),
        .out$deq__ENA(readBeat$out$first__RDY & readData$in$enq__RDY),
        .out$deq__RDY(readBeat$out$deq__RDY),
        .out$first(readBeat$out$first),
        .out$first__RDY(readBeat$out$first__RDY));
    Fifo1_OC_26 writeBeat (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(reqAws$out$first__RDY),
        .in$enq$v({ RULElwriteNext__ENA$writeAddrupdate , RULElwriteNext__ENA$writeburstCount , reqAws$out$first[ 5 : 0 ] , RULElwriteNext__ENA$writeLastNext }),
        .in$enq__RDY(writeBeat$in$enq__RDY),
        .out$deq__ENA(writeBeat$out$deq__ENA),
        .out$deq__RDY(writeBeat$out$deq__RDY),
        .out$first(writeBeat$out$first),
        .out$first__RDY(writeBeat$out$first__RDY));
    Fifo1_OC_29 readData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(readBeat$out$first__RDY & readBeat$out$deq__RDY),
        .in$enq$v({ portalRControl ? RULElread__ENA$portalCtrlInfo : RULElread__ENA$res , readBeat$out$first[ 6 : 1 ] }),
        .in$enq__RDY(readData$in$enq__RDY),
        .out$deq__ENA(readData$out$first__RDY & MAXIGP0_I$R__RDY),
        .out$deq__RDY(readData$out$deq__RDY),
        .out$first(readData$out$first),
        .out$first__RDY(readData$out$first__RDY));
    Fifo1_OC_32 writeData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$W__ENA),
        .in$enq$v({ MAXIGP0_O$W$data }),
        .in$enq__RDY(MAXIGP0_O$W__RDY),
        .out$deq__ENA(writeData$out$deq__ENA),
        .out$deq__RDY(writeData$out$deq__RDY),
        .out$first(writeData$out$first),
        .out$first__RDY(writeData$out$first__RDY));
    Fifo1_OC_35 writeDone (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(writeDone$in$enq__ENA),
        .in$enq$v(writeBeat$out$first[ 6 : 1 ]),
        .in$enq__RDY(),
        .out$deq__ENA(writeDone$out$first__RDY & MAXIGP0_I$B__RDY),
        .out$deq__RDY(writeDone$out$deq__RDY),
        .out$first(MAXIGP0_I$B$id),
        .out$first__RDY(writeDone$out$first__RDY));
    UserTop user (.CLK(CLK), .nRST(nRST),
        .write$enq__ENA(user$write$enq__ENA),
        .write$enq$v(writeData$out$first[ 31 : 0 ]),
        .write$enq$length(user$write$enq$length),
        .write$enq__RDY(user$write$enq__RDY),
        .read$enq__ENA(user$read$enq__ENA),
        .read$enq$v(user$read$enq$v),
        .read$enq$length(user$read$enq$length),
        .read$enq__RDY(requestLength == 16'd0));
    assign MAXIGP0_I$B$resp = 0;
    assign MAXIGP0_I$B__ENA = writeDone$out$first__RDY & writeDone$out$deq__RDY;
    assign MAXIGP0_I$R$data = readData$out$first[ 37 : 6 ];
    assign MAXIGP0_I$R$id = readData$out$first[ 5 : 0 ];
    assign MAXIGP0_I$R$last = 1;
    assign MAXIGP0_I$R$resp = 0;
    assign MAXIGP0_I$R__ENA = readData$out$first__RDY & readData$out$deq__RDY;
    assign MAXIGP0_O$AR__RDY = reqArs$in$enq__RDY;
    assign MAXIGP0_O$AW__RDY = reqAws$in$enq__RDY;
    assign interrupt = ( requestLength != 16'd0 ) & intEnable;
    assign user$write$enq$length = writeBeat$out$first[ 15 : 11 ] != 5'd0;
    assign user$write$enq__ENA = ( !portalWControl ) & writeBeat$out$first__RDY & writeBeat$out$deq__RDY & writeData$out$first__RDY & writeData$out$deq__RDY;
    assign writeBeat$out$deq__ENA = writeBeat$out$first__RDY & writeData$out$first__RDY & writeData$out$deq__RDY & ( portalWControl | user$write$enq__RDY );
    assign writeData$out$deq__ENA = writeBeat$out$first__RDY & writeBeat$out$deq__RDY & writeData$out$first__RDY & ( portalWControl | user$write$enq__RDY );
    assign writeDone$in$enq__ENA = writeBeat$out$first[ 0 : 0 ] & writeBeat$out$first__RDY & writeBeat$out$deq__RDY & writeData$out$first__RDY & writeData$out$deq__RDY & ( portalWControl | user$write$enq__RDY );
    // Extra assigments, not to output wires
    assign RULElreadNext__ENA$readAddrupdate = readNotFirst ? readAddr : reqArs$out$first[ 14 : 10 ];
    assign RULElreadNext__ENA$readLastNext = readNotFirst ? readLast : ( reqArs$out$first[ 9 : 6 ] == 4'd1 );
    assign RULElreadNext__ENA$readburstCount = readNotFirst ? readCount : reqArs$out$first[ 9 : 6 ];
    assign RULElread__ENA$portalCtrlInfo = ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[ 15 : 11 ] == 5'd0 ) ) ? RULElread__ENA$zzIntrChannel : 0 ) | ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[ 15 : 11 ] == 5'd8 ) ) | ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[ 15 : 11 ] == 5'd12 ) ) ? RULElread__ENA$zzIntrChannel : 0 ) | ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[ 15 : 11 ] == 5'd16 ) ) ? ( selectRIndReq ? 32'd6 : 5 ) : 0 ) | ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[ 15 : 11 ] == 5'd20 ) ) ? 32'd2 : 0 ) | ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[ 15 : 11 ] != 5'd0 ) & ( readBeat$out$first[ 15 : 11 ] != 5'd8 ) & ( readBeat$out$first[ 15 : 11 ] != 5'd12 ) & ( readBeat$out$first[ 15 : 11 ] != 5'd16 ) & ( readBeat$out$first[ 15 : 11 ] != 5'd20 ) ) ? 32'd0 : 0 );
    assign RULElread__ENA$res = ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[ 15 : 11 ] == 5'd0 ) ) ? requestValue : 0 ) | ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[ 15 : 11 ] == 5'd4 ) & user$write$enq__RDY ) | ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & ( readBeat$out$first[ 15 : 11 ] != 5'd0 ) & ( readBeat$out$first[ 15 : 11 ] != 5'd4 ) ) ? 32'd0 : 0 );
    assign RULElread__ENA$temp$ac$addr = readBeat$out$first[ 15 : 11 ];
    assign RULElread__ENA$zzIntrChannel = ( !selectRIndReq ) ? requestLength : 0;
    assign RULElwriteNext__ENA$writeAddrupdate = writeNotFirst ? writeAddr : reqAws$out$first[ 14 : 10 ];
    assign RULElwriteNext__ENA$writeLastNext = writeNotFirst ? writeLast : ( reqAws$out$first[ 9 : 6 ] == 4'd1 );
    assign RULElwriteNext__ENA$writeburstCount = writeNotFirst ? writeCount : reqAws$out$first[ 9 : 6 ];
    assign RULElwrite__ENA = writeBeat$out$first__RDY & writeBeat$out$deq__RDY & writeData$out$first__RDY & writeData$out$deq__RDY & ( portalWControl | user$write$enq__RDY );
    assign RULElwrite__ENA$temp$data = writeData$out$first[ 31 : 0 ];
    assign RULElwrite__ENA$wb$ac$addr = writeBeat$out$first[ 15 : 11 ];
    assign RULElwrite__RDY = writeBeat$out$first__RDY & writeBeat$out$deq__RDY & writeData$out$first__RDY & writeData$out$deq__RDY & ( portalWControl | user$write$enq__RDY );

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
            portalRControl <= MAXIGP0_O$AR$addr[ 11 : 5 ] == 7'd0;
            selectRIndReq <= MAXIGP0_O$AR$addr[ 12 ];
        end; // End of MAXIGP0_O$AR__ENA
        if (MAXIGP0_O$AW__ENA & reqAws$in$enq__RDY) begin // MAXIGP0_O$AW__ENA
            portalWControl <= MAXIGP0_O$AW$addr[ 11 : 5 ] == 7'd0;
            selectWIndReq <= MAXIGP0_O$AW$addr[ 12 ];
        end; // End of MAXIGP0_O$AW__ENA
        if (reqArs$out$first__RDY & readBeat$in$enq__RDY) begin // RULElreadNext__ENA
            readAddr <= RULElreadNext__ENA$readAddrupdate + 4;
            readCount <= RULElreadNext__ENA$readburstCount - 1;
            readNotFirst <= !RULElreadNext__ENA$readLastNext;
            readLast <= RULElreadNext__ENA$readburstCount == 4'd2;
        end; // End of RULElreadNext__ENA
        if (readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY) begin // RULElread__ENA
            if (( RULElread__ENA$temp$ac$addr == 0 ) & ( portalRControl == 0 ))
            requestLength <= 0;
        end; // End of RULElread__ENA
        if (reqAws$out$first__RDY & writeBeat$in$enq__RDY) begin // RULElwriteNext__ENA
            writeAddr <= RULElwriteNext__ENA$writeAddrupdate + 4;
            writeCount <= RULElwriteNext__ENA$writeburstCount - 1;
            writeNotFirst <= !RULElwriteNext__ENA$writeLastNext;
            writeLast <= RULElwriteNext__ENA$writeburstCount == 4'd2;
        end; // End of RULElwriteNext__ENA
        if (RULElwrite__ENA & RULElwrite__RDY) begin // RULElwrite__ENA
            if (( RULElwrite__ENA$wb$ac$addr == 4 ) & ( portalWControl != 0 ))
            intEnable <= RULElwrite__ENA$temp$data[ 0 : 0 ];
        end; // End of RULElwrite__ENA
        if (user$read$enq__ENA & ( requestLength == 16'd0 )) begin // readUser$enq__ENA
            requestValue <= user$read$enq$v;
            requestLength <= user$read$enq$length;
        end; // End of readUser$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
