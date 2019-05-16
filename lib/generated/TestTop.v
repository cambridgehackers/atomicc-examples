`include "testTop.generated.vh"

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
    wire RULE$lreadNext__ENA;
    wire [4:0]RULE$lreadNext__ENA$agg_2e_tmp$ac$addr;
    wire [3:0]RULE$lreadNext__ENA$agg_2e_tmp$ac$count;
    wire RULE$lreadNext__ENA$agg_2e_tmp$last;
    wire RULE$lreadNext__RDY;
    wire RULE$lread__ENA;
    wire [31:0]RULE$lread__ENA$agg_2e_tmp$data;
    wire [31:0]RULE$lread__ENA$portalCtrlInfo;
    wire [31:0]RULE$lread__ENA$res;
    wire [4:0]RULE$lread__ENA$temp$ac$addr;
    wire RULE$lread__RDY;
    wire RULE$lwriteNext__ENA;
    wire [4:0]RULE$lwriteNext__ENA$agg_2e_tmp$ac$addr;
    wire [3:0]RULE$lwriteNext__ENA$agg_2e_tmp$ac$count;
    wire RULE$lwriteNext__ENA$agg_2e_tmp$last;
    wire RULE$lwriteNext__RDY;
    wire RULE$lwrite__ENA;
    wire [31:0]RULE$lwrite__ENA$temp$data;
    wire [4:0]RULE$lwrite__ENA$wb$ac$addr;
    wire RULE$lwrite__RDY;
    wire readBeat$in$enq__ENA;
    wire readBeat$in$enq__RDY;
    wire readBeat$out$deq__ENA;
    wire readBeat$out$deq__RDY;
    wire [15:0]readBeat$out$first;
    wire readBeat$out$first__RDY;
    wire readData$in$enq__ENA;
    wire readData$in$enq__RDY;
    wire readData$out$deq__RDY;
    wire [37:0]readData$out$first;
    wire readData$out$first__RDY;
    wire reqArs$in$enq__RDY;
    wire reqArs$out$deq__ENA;
    wire reqArs$out$deq__RDY;
    wire [14:0]reqArs$out$first;
    wire reqArs$out$first__RDY;
    wire reqAws$in$enq__RDY;
    wire reqAws$out$deq__ENA;
    wire reqAws$out$deq__RDY;
    wire [14:0]reqAws$out$first;
    wire reqAws$out$first__RDY;
    wire [15:0]user$read$enq$length;
    wire [31:0]user$read$enq$v;
    wire user$read$enq__ENA;
    wire [15:0]user$write$enq$length;
    wire user$write$enq__ENA;
    wire user$write$enq__RDY;
    wire writeBeat$in$enq__ENA;
    wire writeBeat$in$enq__RDY;
    wire writeBeat$out$deq__ENA;
    wire writeBeat$out$deq__RDY;
    wire [15:0]writeBeat$out$first;
    wire writeBeat$out$first__RDY;
    wire writeData$in$enq__RDY;
    wire writeData$out$deq__ENA;
    wire writeData$out$deq__RDY;
    wire [31:0]writeData$out$first;
    wire writeData$out$first__RDY;
    wire writeDone$in$enq__ENA;
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
        .in$enq$v({ RULE$lreadNext__ENA$agg_2e_tmp$ac$addr , RULE$lreadNext__ENA$agg_2e_tmp$ac$count , reqArs$out$first[ 5 : 0 ] , RULE$lreadNext__ENA$agg_2e_tmp$last }),
        .in$enq__RDY(readBeat$in$enq__RDY),
        .out$deq__ENA(readBeat$out$deq__ENA),
        .out$deq__RDY(readBeat$out$deq__RDY),
        .out$first(readBeat$out$first),
        .out$first__RDY(readBeat$out$first__RDY));
    Fifo1Base#(16) writeBeat (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(writeBeat$in$enq__ENA),
        .in$enq$v({ RULE$lwriteNext__ENA$agg_2e_tmp$ac$addr , RULE$lwriteNext__ENA$agg_2e_tmp$ac$count , reqAws$out$first[ 5 : 0 ] , RULE$lwriteNext__ENA$agg_2e_tmp$last }),
        .in$enq__RDY(writeBeat$in$enq__RDY),
        .out$deq__ENA(writeBeat$out$deq__ENA),
        .out$deq__RDY(writeBeat$out$deq__RDY),
        .out$first(writeBeat$out$first),
        .out$first__RDY(writeBeat$out$first__RDY));
    Fifo1Base#(38) readData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(readData$in$enq__ENA),
        .in$enq$v({ RULE$lread__ENA$agg_2e_tmp$data , readBeat$out$first[ 6 : 1 ] }),
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
        .in$enq$v(writeBeat$out$first[ 6 : 1 ]),
        .in$enq__RDY(),
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
        .read$enq__RDY(requestLength == 16'd0));
    assign MAXIGP0_I$B$resp = 2'd0;
    assign MAXIGP0_I$B__ENA = writeDone$out$first__RDY & writeDone$out$deq__RDY;
    assign MAXIGP0_I$R$data = readData$out$first[ 37 : 6 ];
    assign MAXIGP0_I$R$id = readData$out$first[ 5 : 0 ];
    assign MAXIGP0_I$R$last = 1;
    assign MAXIGP0_I$R$resp = 2'd0;
    assign MAXIGP0_I$R__ENA = readData$out$first__RDY & readData$out$deq__RDY;
    assign MAXIGP0_O$AR__RDY = reqArs$in$enq__RDY;
    assign MAXIGP0_O$AW__RDY = reqAws$in$enq__RDY;
    assign MAXIGP0_O$W__RDY = writeData$in$enq__RDY;
    assign interrupt = ( requestLength != 16'd0 ) & intEnable;
    assign readBeat$in$enq__ENA = reqArs$out$first__RDY & ( reqArs$out$deq__RDY | ( !( readNotFirst ? readLast : 1 ) ) );
    assign readBeat$out$deq__ENA = readBeat$out$first__RDY & ( readData$in$enq__RDY | ( !portalRControl ) );
    assign readData$in$enq__ENA = readBeat$out$first__RDY & readBeat$out$deq__RDY & portalRControl & ( readBeat$out$first[ 15 : 11 ] == 5'd8 ) & ( readBeat$out$first[ 15 : 11 ] == 5'd4 );
    assign reqArs$out$deq__ENA = reqArs$out$first__RDY & readBeat$in$enq__RDY & ( readNotFirst ? readLast : ( reqArs$out$first[ 9 : 6 ] == 4'd1 ) );
    assign reqAws$out$deq__ENA = reqAws$out$first__RDY & writeBeat$in$enq__RDY & ( writeNotFirst ? writeLast : ( reqAws$out$first[ 9 : 6 ] == 4'd1 ) );
    assign user$write$enq$length = writeBeat$out$first[ 15 : 11 ] != 5'd0;
    assign user$write$enq__ENA = !( portalWControl | ( !( writeData$out$deq__RDY & writeData$out$first__RDY & writeBeat$out$deq__RDY & writeBeat$out$first__RDY ) ) );
    assign writeBeat$in$enq__ENA = reqAws$out$first__RDY & ( reqAws$out$deq__RDY | ( !( writeNotFirst ? writeLast : 1 ) ) );
    assign writeBeat$out$deq__ENA = writeBeat$out$first__RDY & writeData$out$first__RDY & writeData$out$deq__RDY & ( portalWControl | user$write$enq__RDY );
    assign writeData$out$deq__ENA = writeBeat$out$first__RDY & writeBeat$out$deq__RDY & writeData$out$first__RDY & ( portalWControl | user$write$enq__RDY );
    assign writeDone$in$enq__ENA = writeBeat$out$first__RDY & writeBeat$out$deq__RDY & writeData$out$first__RDY & writeData$out$deq__RDY & writeBeat$out$first[ 0 : 0 ] & user$write$enq__RDY;
    // Extra assigments, not to output wires
    assign RULE$lreadNext__ENA = reqArs$out$first__RDY & readBeat$in$enq__RDY & ( reqArs$out$deq__RDY | ( !( readNotFirst ? readLast : 1 ) ) );
    assign RULE$lreadNext__ENA$agg_2e_tmp$ac$addr = readNotFirst ? readAddr : reqArs$out$first[ 14 : 10 ];
    assign RULE$lreadNext__ENA$agg_2e_tmp$ac$count = readNotFirst ? readCount : reqArs$out$first[ 9 : 6 ];
    assign RULE$lreadNext__ENA$agg_2e_tmp$last = readNotFirst ? readLast : ( reqArs$out$first[ 9 : 6 ] == 4'd1 );
    assign RULE$lreadNext__RDY = reqArs$out$first__RDY & readBeat$in$enq__RDY & ( reqArs$out$deq__RDY | ( !( readNotFirst ? readLast : 1 ) ) );
    assign RULE$lread__ENA = readBeat$out$first__RDY & readBeat$out$deq__RDY & ( readData$in$enq__RDY | ( !portalRControl ) );
    assign RULE$lread__ENA$agg_2e_tmp$data = ( ( portalRControl & ( ( readBeat$out$first[ 15 : 11 ] == 5'd0 ) | ( ( readBeat$out$first[ 15 : 11 ] == 5'd8 ) & ( readBeat$out$first[ 15 : 11 ] == 5'd4 ) ) ) ) ? RULE$lread__ENA$portalCtrlInfo : 32'd0 ) | ( ( !( portalRControl | ( !( readBeat$out$first[ 15 : 11 ] == 5'd0 ) ) ) ) ? RULE$lread__ENA$res : 32'd0 );
    assign RULE$lread__ENA$portalCtrlInfo = ( ( !( portalRControl | ( !( ( readBeat$out$first[ 15 : 11 ] == 5'd0 ) & readBeat$out$deq__RDY & readBeat$out$first__RDY ) ) ) ) ? ( ( !selectRIndReq ) ? requestLength : 32'd0 ) : 16'd0 ) | ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & portalRControl & ( readBeat$out$first[ 15 : 11 ] == 5'd8 ) ) ? 32'd1 : 32'd0 ) | ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & portalRControl & ( readBeat$out$first[ 15 : 11 ] == 5'd12 ) ) ? ( ( !selectRIndReq ) ? requestLength : 32'd0 ) : 16'd0 ) | ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & portalRControl & ( readBeat$out$first[ 15 : 11 ] == 5'd16 ) ) ? ( selectRIndReq ? 32'd6 : 32'd5 ) : 32'd0 ) | ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & portalRControl & ( readBeat$out$first[ 15 : 11 ] == 5'd20 ) ) ? 32'd2 : 32'd0 );
    assign RULE$lread__ENA$res = ( ( !( portalRControl | ( !( ( readBeat$out$first[ 15 : 11 ] == 5'd0 ) & readBeat$out$deq__RDY & readBeat$out$first__RDY ) ) ) ) ? requestValue : 32'd0 ) | ( ( readBeat$out$first__RDY & readBeat$out$deq__RDY & readData$in$enq__RDY & portalRControl & ( readBeat$out$first[ 15 : 11 ] == 5'd4 ) & ( ( readBeat$out$first[ 15 : 11 ] == 5'd20 ) | ( readBeat$out$first[ 15 : 11 ] == 5'd16 ) | ( readBeat$out$first[ 15 : 11 ] == 5'd12 ) | ( readBeat$out$first[ 15 : 11 ] == 5'd8 ) ) ) ? user$write$enq__RDY : 1'd0 );
    assign RULE$lread__ENA$temp$ac$addr = readBeat$out$first[ 15 : 11 ];
    assign RULE$lread__RDY = readBeat$out$first__RDY & readBeat$out$deq__RDY & ( readData$in$enq__RDY | ( !portalRControl ) );
    assign RULE$lwriteNext__ENA = reqAws$out$first__RDY & writeBeat$in$enq__RDY & ( reqAws$out$deq__RDY | ( !( writeNotFirst ? writeLast : 1 ) ) );
    assign RULE$lwriteNext__ENA$agg_2e_tmp$ac$addr = writeNotFirst ? writeAddr : reqAws$out$first[ 14 : 10 ];
    assign RULE$lwriteNext__ENA$agg_2e_tmp$ac$count = writeNotFirst ? writeCount : reqAws$out$first[ 9 : 6 ];
    assign RULE$lwriteNext__ENA$agg_2e_tmp$last = writeNotFirst ? writeLast : ( reqAws$out$first[ 9 : 6 ] == 4'd1 );
    assign RULE$lwriteNext__RDY = reqAws$out$first__RDY & writeBeat$in$enq__RDY & ( reqAws$out$deq__RDY | ( !( writeNotFirst ? writeLast : 1 ) ) );
    assign RULE$lwrite__ENA = writeBeat$out$first__RDY & writeBeat$out$deq__RDY & writeData$out$first__RDY & writeData$out$deq__RDY & ( portalWControl | user$write$enq__RDY );
    assign RULE$lwrite__ENA$temp$data = writeData$out$first;
    assign RULE$lwrite__ENA$wb$ac$addr = writeBeat$out$first[ 15 : 11 ];
    assign RULE$lwrite__RDY = writeBeat$out$first__RDY & writeBeat$out$deq__RDY & writeData$out$first__RDY & writeData$out$deq__RDY & ( portalWControl | user$write$enq__RDY );

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
        if (RULE$lreadNext__ENA & RULE$lreadNext__RDY) begin // RULE$lreadNext__ENA
            readAddr <= ( readNotFirst ? readAddr : reqArs$out$first[ 14 : 10 ] ) + 4;
            readCount <= ( readNotFirst ? readCount : reqArs$out$first[ 9 : 6 ] ) - 1;
            readNotFirst <= ( readNotFirst ? readLast : ( reqArs$out$first[ 9 : 6 ] == 4'd1 ) ) ^ 1;
            readLast <= ( readNotFirst ? readCount : reqArs$out$first[ 9 : 6 ] ) == 4'd2;
        end; // End of RULE$lreadNext__ENA
        if (RULE$lread__ENA & RULE$lread__RDY) begin // RULE$lread__ENA
            if (( RULE$lread__ENA$temp$ac$addr == 0 ) & ( portalRControl == 0 ))
            requestLength <= 0;
        end; // End of RULE$lread__ENA
        if (RULE$lwriteNext__ENA & RULE$lwriteNext__RDY) begin // RULE$lwriteNext__ENA
            writeAddr <= ( writeNotFirst ? writeAddr : reqAws$out$first[ 14 : 10 ] ) + 4;
            writeCount <= ( writeNotFirst ? writeCount : reqAws$out$first[ 9 : 6 ] ) - 1;
            writeNotFirst <= ( writeNotFirst ? writeLast : ( reqAws$out$first[ 9 : 6 ] == 4'd1 ) ) ^ 1;
            writeLast <= ( writeNotFirst ? writeCount : reqAws$out$first[ 9 : 6 ] ) == 4'd2;
        end; // End of RULE$lwriteNext__ENA
        if (RULE$lwrite__ENA & RULE$lwrite__RDY) begin // RULE$lwrite__ENA
            if (( RULE$lwrite__ENA$wb$ac$addr == 4 ) & ( portalWControl != 0 ))
            intEnable <= RULE$lwrite__ENA$temp$data[ 0 : 0 ];
        end; // End of RULE$lwrite__ENA
        if (user$read$enq__ENA & ( requestLength == 16'd0 )) begin // readUser$enq__ENA
            requestValue <= user$read$enq$v;
            requestLength <= user$read$enq$length;
        end; // End of readUser$enq__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
