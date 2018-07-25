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
    output wire interrupt);
    wire CLK;
    wire nRST;
    reg intEnable;
    reg portalRControl;
    reg portalWControl;
    reg [4:0]readAddr;
    reg [9:0]readCount;
    reg readFirst;
    reg readLast;
    reg selectRIndReq;
    reg selectWIndReq;
    reg [4:0]writeAddr;
    reg [9:0]writeCount;
    reg writeFirst;
    reg writeLast;
    wire RULEinit__ENA;
    wire RULEinit__RDY;
    wire RULElR__ENA;
    wire RULElR__RDY;
    wire RULElreadNext__ENA;
    wire [4:0]RULElreadNext__ENA$temp$addr;
    wire [9:0]RULElreadNext__ENA$temp$count;
    wire RULElreadNext__RDY;
    wire RULElread__ENA;
    wire RULElread__RDY;
    wire RULElwriteNext__ENA;
    wire [4:0]RULElwriteNext__ENA$temp$addr;
    wire [9:0]RULElwriteNext__ENA$temp$count;
    wire RULElwriteNext__RDY;
    wire RULElwrite__ENA;
    wire [31:0]RULElwrite__ENA$temp$data;
    wire [4:0]RULElwrite__ENA$wb$ac$addr;
    wire RULElwrite__ENA$wb$last;
    wire RULElwrite__RDY;
    wire RULEwriteResponse__ENA;
    wire RULEwriteResponse__RDY;
    wire readBeat$in$enq__RDY;
    wire readBeat$out$deq__RDY;
    wire [21:0]readBeat$out$first;
    wire readBeat$out$first__RDY;
    wire readBus$out$deq__RDY;
    wire readBus$out$first__RDY;
    wire readData$in$enq__RDY;
    wire readData$out$deq__RDY;
    wire [37:0]readData$out$first;
    wire readData$out$first__RDY;
    wire readUser$enq$last;
    wire [31:0]readUser$enq$v;
    wire readUser$enq__ENA;
    wire readUser$enq__RDY;
    wire reqArs$out$deq__RDY;
    wire [20:0]reqArs$out$first;
    wire reqArs$out$first__RDY;
    wire reqAws$out$deq__RDY;
    wire [20:0]reqAws$out$first;
    wire reqAws$out$first__RDY;
    wire user$read$enq$last;
    wire [31:0]user$read$enq$v;
    wire user$read$enq__ENA;
    wire user$read$enq__RDY;
    wire user$write$enq__RDY;
    wire writeBeat$in$enq__RDY;
    wire writeBeat$out$deq__RDY;
    wire [21:0]writeBeat$out$first;
    wire writeBeat$out$first__RDY;
    wire writeData$out$deq__RDY;
    wire [31:0]writeData$out$first;
    wire writeData$out$first__RDY;
    wire writeDone$in$enq__RDY;
    wire writeDone$out$deq__RDY;
    wire writeDone$out$first__RDY;
    assign MAXIGP0_I$B$resp = 0;
    assign MAXIGP0_I$B__ENA = writeDone$out$first__RDY & writeDone$out$deq__RDY;
    assign MAXIGP0_I$R$data = readData$out$first[37:6];
    assign MAXIGP0_I$R$id = readData$out$first[5:0];
    assign MAXIGP0_I$R$last = readData$out$first__RDY & readData$out$deq__RDY & MAXIGP0_I$R__RDY;
    assign MAXIGP0_I$R$resp = 0;
    assign MAXIGP0_I$R__ENA = readData$out$first__RDY & readData$out$deq__RDY;
    assign RULEinit__ENA = 1;
    assign RULElR__ENA = readData$out$first__RDY & readData$out$deq__RDY & MAXIGP0_I$R__RDY;
    assign RULElreadNext__ENA = reqArs$out$first__RDY & readBeat$in$enq__RDY & ( ( ( ( !readFirst ) ? ( reqArs$out$first[15:6] == 10'd4 ) : readLast ) == 0 ) | reqArs$out$deq__RDY );
    assign RULElread__ENA = readBeat$out$first__RDY & readBeat$out$deq__RDY & ( ( readBeat$out$first[20:16] != 5'd0 ) | ( !selectRIndReq ) | readBus$out$first__RDY ) & ( ( readBeat$out$first[20:16] != 5'd0 ) | ( !selectRIndReq ) | readBus$out$deq__RDY ) & readData$in$enq__RDY;
    assign RULElwriteNext__ENA = reqAws$out$first__RDY & writeBeat$in$enq__RDY & ( ( ( ( !writeFirst ) ? ( reqAws$out$first[15:6] == 10'd4 ) : writeLast ) == 0 ) | reqAws$out$deq__RDY );
    assign RULElwrite__ENA = writeBeat$out$first__RDY & ( ( !RULElwrite__ENA$wb$last ) | writeDone$in$enq__RDY ) & ( RULElwrite__ENA$wb$last | writeBeat$out$deq__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$first__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$deq__RDY ) & ( portalWControl | RULElwrite__ENA$wb$last | user$write$enq__RDY );
    assign RULEwriteResponse__ENA = writeDone$out$first__RDY & MAXIGP0_I$B__RDY & writeDone$out$deq__RDY;
    assign interrupt = ( !readBus$out$first__RDY ) & intEnable;
    Fifo1_OC_10 reqArs (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$AR__ENA & MAXIGP0_O$AR__RDY),
        .in$enq$v({ MAXIGP0_O$AR$addr , ( MAXIGP0_O$AR$len + 1 ) << 2 , MAXIGP0_O$AR$id }),
        .in$enq__RDY(MAXIGP0_O$AR__RDY),
        .out$deq__ENA(( ( ( !readFirst ) ? ( reqArs$out$first[ 15 : 6 ] == 10'd4 ) : readLast ) != 0 ) & reqArs$out$first__RDY & readBeat$in$enq__RDY),
        .out$deq__RDY(reqArs$out$deq__RDY),
        .out$first(reqArs$out$first),
        .out$first__RDY(reqArs$out$first__RDY));
    Fifo1_OC_10 reqAws (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$AW__ENA & MAXIGP0_O$AW__RDY),
        .in$enq$v({ MAXIGP0_O$AW$addr , ( MAXIGP0_O$AW$len + 1 ) << 2 , MAXIGP0_O$AW$id }),
        .in$enq__RDY(MAXIGP0_O$AW__RDY),
        .out$deq__ENA(( ( ( !writeFirst ) ? ( reqAws$out$first[ 15 : 6 ] == 10'd4 ) : writeLast ) != 0 ) & reqAws$out$first__RDY & writeBeat$in$enq__RDY),
        .out$deq__RDY(reqAws$out$deq__RDY),
        .out$first(reqAws$out$first),
        .out$first__RDY(reqAws$out$first__RDY));
    Fifo1_OC_12 readBeat (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(reqArs$out$first__RDY & ( ( ( ( !readFirst ) ? ( reqArs$out$first[ 15 : 6 ] == 10'd4 ) : readLast ) == 0 ) | reqArs$out$deq__RDY )),
        .in$enq$v({ reqArs$out$first__RDY & readBeat$in$enq__RDY & ( ( ( ( !readFirst ) ? ( reqArs$out$first[ 15 : 6 ] == 10'd4 ) : readLast ) == 0 ) | reqArs$out$deq__RDY ) & ( ( ( !readFirst ) ? ( reqArs$out$first[ 15 : 6 ] == 10'd4 ) : readLast ) != 0 ) , ( !readFirst ) ? reqArs$out$first[ 20 : 16 ] : readAddr , ( !readFirst ) ? reqArs$out$first[ 15 : 6 ] : readCount , reqArs$out$first[ 5 : 0 ] }),
        .in$enq__RDY(readBeat$in$enq__RDY),
        .out$deq__ENA(readBeat$out$first__RDY & ( ( readBeat$out$first[ 20 : 16 ] != 5'd0 ) | ( !selectRIndReq ) | readBus$out$first__RDY ) & ( ( readBeat$out$first[ 20 : 16 ] != 5'd0 ) | ( !selectRIndReq ) | readBus$out$deq__RDY ) & readData$in$enq__RDY),
        .out$deq__RDY(readBeat$out$deq__RDY),
        .out$first(readBeat$out$first),
        .out$first__RDY(readBeat$out$first__RDY));
    Fifo1_OC_12 writeBeat (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(reqAws$out$first__RDY & ( ( ( ( !writeFirst ) ? ( reqAws$out$first[ 15 : 6 ] == 10'd4 ) : writeLast ) == 0 ) | reqAws$out$deq__RDY )),
        .in$enq$v({ reqAws$out$first__RDY & writeBeat$in$enq__RDY & ( ( ( ( !writeFirst ) ? ( reqAws$out$first[ 15 : 6 ] == 10'd4 ) : writeLast ) == 0 ) | reqAws$out$deq__RDY ) & ( ( ( !writeFirst ) ? ( reqAws$out$first[ 15 : 6 ] == 10'd4 ) : writeLast ) != 0 ) , ( !writeFirst ) ? reqAws$out$first[ 20 : 16 ] : writeAddr , ( !writeFirst ) ? reqAws$out$first[ 15 : 6 ] : writeCount , reqAws$out$first[ 5 : 0 ] }),
        .in$enq__RDY(writeBeat$in$enq__RDY),
        .out$deq__ENA(( !RULElwrite__ENA$wb$last ) & writeBeat$out$first__RDY & ( ( !RULElwrite__ENA$wb$last ) | writeDone$in$enq__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$first__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$deq__RDY ) & ( portalWControl | RULElwrite__ENA$wb$last | user$write$enq__RDY )),
        .out$deq__RDY(writeBeat$out$deq__RDY),
        .out$first(writeBeat$out$first),
        .out$first__RDY(writeBeat$out$first__RDY));
    Fifo1_OC_14 readData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(readBeat$out$first__RDY & readBeat$out$deq__RDY & ( ( readBeat$out$first[ 20 : 16 ] != 5'd0 ) | ( !selectRIndReq ) | readBus$out$first__RDY ) & ( ( readBeat$out$first[ 20 : 16 ] != 5'd0 ) | ( !selectRIndReq ) | readBus$out$deq__RDY )),
        .in$enq$v({ 32'd0 , readBeat$out$first[ 5 : 0 ] }),
        .in$enq__RDY(readData$in$enq__RDY),
        .out$deq__ENA(readData$out$first__RDY & MAXIGP0_I$R__RDY),
        .out$deq__RDY(readData$out$deq__RDY),
        .out$first(readData$out$first),
        .out$first__RDY(readData$out$first__RDY));
    Fifo1_OC_16 readBus (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(user$read$enq__ENA & user$read$enq__RDY),
        .in$enq$v({ user$read$enq$v }),
        .in$enq__RDY(),
        .out$deq__ENA(( readBeat$out$first[ 20 : 16 ] == 5'd0 ) & selectRIndReq & readBeat$out$first__RDY & readBeat$out$deq__RDY & ( ( readBeat$out$first[ 20 : 16 ] != 5'd0 ) | ( !selectRIndReq ) | readBus$out$first__RDY ) & readData$in$enq__RDY),
        .out$deq__RDY(readBus$out$deq__RDY),
        .out$first(),
        .out$first__RDY(readBus$out$first__RDY));
    Fifo1_OC_16 writeData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$W__ENA & MAXIGP0_O$W__RDY),
        .in$enq$v({ MAXIGP0_O$W$data }),
        .in$enq__RDY(MAXIGP0_O$W__RDY),
        .out$deq__ENA(( !RULElwrite__ENA$wb$last ) & writeBeat$out$first__RDY & ( ( !RULElwrite__ENA$wb$last ) | writeDone$in$enq__RDY ) & ( RULElwrite__ENA$wb$last | writeBeat$out$deq__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$first__RDY ) & ( portalWControl | RULElwrite__ENA$wb$last | user$write$enq__RDY )),
        .out$deq__RDY(writeData$out$deq__RDY),
        .out$first(writeData$out$first),
        .out$first__RDY(writeData$out$first__RDY));
    Fifo1_OC_18 writeDone (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(RULElwrite__ENA$wb$last & writeBeat$out$first__RDY & ( RULElwrite__ENA$wb$last | writeBeat$out$deq__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$first__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$deq__RDY ) & ( portalWControl | RULElwrite__ENA$wb$last | user$write$enq__RDY )),
        .in$enq$v(writeBeat$out$first[ 5 : 0 ]),
        .in$enq__RDY(writeDone$in$enq__RDY),
        .out$deq__ENA(writeDone$out$first__RDY & MAXIGP0_I$B__RDY),
        .out$deq__RDY(writeDone$out$deq__RDY),
        .out$first(MAXIGP0_I$B$id),
        .out$first__RDY(writeDone$out$first__RDY));
    UserTop user (.CLK(CLK), .nRST(nRST),
        .write$enq__ENA(( !portalWControl ) & ( !RULElwrite__ENA$wb$last ) & writeBeat$out$first__RDY & ( ( !RULElwrite__ENA$wb$last ) | writeDone$in$enq__RDY ) & ( RULElwrite__ENA$wb$last | writeBeat$out$deq__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$first__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$deq__RDY )),
        .write$enq$v(writeData$out$first[ 31 : 0 ]),
        .write$enq$last(( !portalWControl ) & ( !RULElwrite__ENA$wb$last ) & writeBeat$out$first__RDY & ( ( !RULElwrite__ENA$wb$last ) | writeDone$in$enq__RDY ) & ( RULElwrite__ENA$wb$last | writeBeat$out$deq__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$first__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$deq__RDY ) & ( portalWControl | RULElwrite__ENA$wb$last | user$write$enq__RDY ) & ( writeBeat$out$first[ 20 : 16 ] != 5'd0 )),
        .write$enq__RDY(user$write$enq__RDY),
        .read$enq__ENA(user$read$enq__ENA),
        .read$enq$v(user$read$enq$v),
        .read$enq$last(user$read$enq$last),
        .read$enq__RDY(user$read$enq__RDY));
    assign readUser$enq$last = user$read$enq$last;
    assign readUser$enq$v = user$read$enq$v;
    assign readUser$enq__ENA = user$read$enq__ENA;
    assign readUser$enq__RDY = user$read$enq__RDY;
    // Extra assigments, not to output wires
    assign RULEinit__RDY = 1;
    assign RULElR__RDY = readData$out$first__RDY & readData$out$deq__RDY & MAXIGP0_I$R__RDY;
    assign RULElreadNext__ENA$temp$addr = reqArs$out$first[20:16];
    assign RULElreadNext__ENA$temp$count = reqArs$out$first[15:6];
    assign RULElreadNext__RDY = reqArs$out$first__RDY & readBeat$in$enq__RDY & ( ( ( ( !readFirst ) ? ( reqArs$out$first[15:6] == 10'd4 ) : readLast ) == 0 ) | reqArs$out$deq__RDY );
    assign RULElread__RDY = readBeat$out$first__RDY & readBeat$out$deq__RDY & ( ( readBeat$out$first[20:16] != 5'd0 ) | ( !selectRIndReq ) | readBus$out$first__RDY ) & ( ( readBeat$out$first[20:16] != 5'd0 ) | ( !selectRIndReq ) | readBus$out$deq__RDY ) & readData$in$enq__RDY;
    assign RULElwriteNext__ENA$temp$addr = reqAws$out$first[20:16];
    assign RULElwriteNext__ENA$temp$count = reqAws$out$first[15:6];
    assign RULElwriteNext__RDY = reqAws$out$first__RDY & writeBeat$in$enq__RDY & ( ( ( ( !writeFirst ) ? ( reqAws$out$first[15:6] == 10'd4 ) : writeLast ) == 0 ) | reqAws$out$deq__RDY );
    assign RULElwrite__ENA$temp$data = writeData$out$first[31:0];
    assign RULElwrite__ENA$wb$ac$addr = writeBeat$out$first[20:16];
    assign RULElwrite__ENA$wb$last = writeBeat$out$first__RDY & ( ( !RULElwrite__ENA$wb$last ) | writeDone$in$enq__RDY ) & ( RULElwrite__ENA$wb$last | writeBeat$out$deq__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$first__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$deq__RDY ) & ( portalWControl | RULElwrite__ENA$wb$last | user$write$enq__RDY ) & writeBeat$out$first[21:21];
    assign RULElwrite__RDY = writeBeat$out$first__RDY & ( ( !RULElwrite__ENA$wb$last ) | writeDone$in$enq__RDY ) & ( RULElwrite__ENA$wb$last | writeBeat$out$deq__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$first__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$deq__RDY ) & ( portalWControl | RULElwrite__ENA$wb$last | user$write$enq__RDY );
    assign RULEwriteResponse__RDY = writeDone$out$first__RDY & MAXIGP0_I$B__RDY & writeDone$out$deq__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        intEnable <= 0;
        portalRControl <= 0;
        portalWControl <= 0;
        readAddr <= 0;
        readCount <= 0;
        readFirst <= 0;
        readLast <= 0;
        selectRIndReq <= 0;
        selectWIndReq <= 0;
        writeAddr <= 0;
        writeCount <= 0;
        writeFirst <= 0;
        writeLast <= 0;
      end // nRST
      else begin
        if (MAXIGP0_O$AR__ENA & MAXIGP0_O$AR__RDY) begin
            portalRControl <= MAXIGP0_O$AR$addr[ 11 : 5 ] == 0;
            selectRIndReq <= MAXIGP0_O$AR$addr[ 12 ];
        end; // End of MAXIGP0_O$AR__ENA
        if (MAXIGP0_O$AW__ENA & MAXIGP0_O$AW__RDY) begin
            portalWControl <= MAXIGP0_O$AW$addr[ 11 : 5 ] == 0;
            selectWIndReq <= MAXIGP0_O$AW$addr[ 12 ];
        end; // End of MAXIGP0_O$AW__ENA
        if (RULElreadNext__ENA & reqArs$out$first__RDY & readBeat$in$enq__RDY & ( ( ( ( !readFirst ) ? ( reqArs$out$first[15:6] == 10'd4 ) : readLast ) == 0 ) | reqArs$out$deq__RDY )) begin
            readAddr <= ( ( readFirst == 0 ) ? reqArs$out$first[20:16] : readAddr ) + 4;
            readCount <= ( ( readFirst == 0 ) ? RULElreadNext__ENA$temp$count[ 9 : 2 ] : readCount ) - 1;
            readFirst <= ( ( readFirst == 0 ) ? ( reqArs$out$first[15:6] == 4 ) : readLast ) == 0;
            readLast <= ( ( readFirst == 0 ) ? RULElreadNext__ENA$temp$count[ 9 : 2 ] : readCount ) == 2;
        end; // End of RULElreadNext__ENA
        if (RULElwriteNext__ENA & reqAws$out$first__RDY & writeBeat$in$enq__RDY & ( ( ( ( !writeFirst ) ? ( reqAws$out$first[15:6] == 10'd4 ) : writeLast ) == 0 ) | reqAws$out$deq__RDY )) begin
            writeAddr <= ( ( writeFirst == 0 ) ? reqAws$out$first[20:16] : writeAddr ) + 4;
            writeCount <= ( ( writeFirst == 0 ) ? RULElwriteNext__ENA$temp$count[ 9 : 2 ] : writeCount ) - 1;
            writeFirst <= ( ( writeFirst == 0 ) ? ( reqAws$out$first[15:6] == 4 ) : writeLast ) == 0;
            writeLast <= ( ( writeFirst == 0 ) ? RULElwriteNext__ENA$temp$count[ 9 : 2 ] : writeCount ) == 2;
        end; // End of RULElwriteNext__ENA
        if (RULElwrite__ENA & writeBeat$out$first__RDY & ( ( !RULElwrite__ENA$wb$last ) | writeDone$in$enq__RDY ) & ( RULElwrite__ENA$wb$last | writeBeat$out$deq__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$first__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$deq__RDY ) & ( portalWControl | RULElwrite__ENA$wb$last | user$write$enq__RDY )) begin
            if (( writeBeat$out$first[20:16] == 4 ) & ( portalWControl != 0 ) & ( RULElwrite__ENA$wb$last == 0 ))
            intEnable <= RULElwrite__ENA$temp$data[ 0 : 0 ];
        end; // End of RULElwrite__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
