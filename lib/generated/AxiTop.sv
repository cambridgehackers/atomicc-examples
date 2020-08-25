`include "axiTop.generated.vh"

`default_nettype none
module AxiTop (
    input wire CLK,
    input wire nRST,
    output wire interrupt,
    MaxiO.server MAXIGP0_O,
    MaxiI.client MAXIGP0_I);
    reg intEnable;
    reg portalRControl;
    reg portalWControl;
    reg [5 - 1:0]readAddr;
    reg [4 - 1:0]readCount;
    reg selectRIndReq;
    reg selectWIndReq;
    reg [5 - 1:0]writeAddr;
    reg [4 - 1:0]writeCount;
    reg writeReady;
    ReadResp RULE$lread$agg_2e_tmp;
    ReadResp RULE$lreadData$currentRData;
    wire RULE$lread__RDY;
    wire [32 - 1:0]RULE$lwrite$currentWData;
    wire RULE$lwrite__RDY;
    PipeIn#(.width(38)) readData$in();
    PipeOut#(.width(38)) readData$out();
    PipeInB#(.width(32)) readUser();
    PipeIn#(.width(6)) reqArs$in();
    PipeOut#(.width(6)) reqArs$out();
    PipeIn#(.width(6)) reqAws$in();
    PipeOut#(.width(6)) reqAws$out();
    PipeIn#(.width(32)) requestValue$in();
    PipeOut#(.width(32)) requestValue$out();
    PipeInB#(.width(32)) user$read();
    PipeInB#(.width(32)) user$write();
    PipeIn#(.width(32)) writeData$in();
    PipeOut#(.width(32)) writeData$out();
    PipeIn#(.width(6)) writeDone$in();
    PipeOut#(.width(6)) writeDone$out();
    Fifo1Base#(.width(6)) reqArs (.CLK(CLK), .nRST(nRST),
        .in(reqArs$in),
        .out(reqArs$out));
    Fifo1Base#(.width(6)) reqAws (.CLK(CLK), .nRST(nRST),
        .in(reqAws$in),
        .out(reqAws$out));
    Fifo1Base#(.width(6)) writeDone (.CLK(CLK), .nRST(nRST),
        .in(writeDone$in),
        .out(writeDone$out));
    Fifo1Base#(.width(32)) requestValue (.CLK(CLK), .nRST(nRST),
        .in(requestValue$in),
        .out(requestValue$out));
    Fifo1Base#(.width(38)) readData (.CLK(CLK), .nRST(nRST),
        .in(readData$in),
        .out(readData$out));
    Fifo1Base#(.width(32)) writeData (.CLK(CLK), .nRST(nRST),
        .in(writeData$in),
        .out(writeData$out));
    UserTop user (.CLK(CLK), .nRST(nRST),
        .write(user$write),
        .read(user$read));
    assign interrupt = !( ( requestValue$out.deq__RDY == 0 ) || ( !intEnable ) );
    // Extra assigments, not to output wires
    assign MAXIGP0_I.B$id = writeDone$out.first;
    assign MAXIGP0_I.B$resp = 0;
    assign MAXIGP0_I.B__ENA = writeDone$out.first__RDY && writeDone$out.deq__RDY;
    assign MAXIGP0_I.R$data = RULE$lreadData$currentRData.data;
    assign MAXIGP0_I.R$id = RULE$lreadData$currentRData.id;
    assign MAXIGP0_I.R$last = 1 != 0;
    assign MAXIGP0_I.R$resp = 0;
    assign MAXIGP0_I.R__ENA = readData$out.first__RDY && readData$out.deq__RDY;
    assign MAXIGP0_O.AR__RDY = reqArs$in.enq__RDY;
    assign MAXIGP0_O.AW__RDY = reqAws$in.enq__RDY;
    assign MAXIGP0_O.W__RDY = writeData$in.enq__RDY;
    wire RULE$lread$currentChannel;
    wire [6 - 1:0]RULE$lread$currentRead;
    wire [32 - 1:0]RULE$lread$res;
    wire [6 - 1:0]RULE$lwrite$currentWrite;
    assign RULE$lread$currentChannel = !( selectRIndReq || ( !requestValue$out.deq__RDY ) );
    assign RULE$lread$currentRead = reqArs$out.first;
    assign RULE$lread$res = ( ( RULE$lread__RDY && ( readAddr == 0 ) && portalRControl ) ? RULE$lread$currentChannel : 1'd0 ) | ( ( RULE$lread__RDY && ( readAddr == 8 ) && portalRControl ) ? 32'd1 : 32'd0 ) | ( ( RULE$lread__RDY && ( readAddr == 12 ) && portalRControl ) ? RULE$lread$currentChannel : 1'd0 ) | ( ( RULE$lread__RDY && ( readAddr == 16 ) && portalRControl ) ? ( selectRIndReq ? 32'd6 : 32'd5 ) : 32'd0 ) | ( ( RULE$lread__RDY && ( readAddr == 20 ) && portalRControl ) ? 32'd2 : 32'd0 ) | ( ( !( portalRControl || ( !( ( readAddr == 0 ) && RULE$lread__RDY ) ) ) ) ? requestValue$out.first : 32'd0 ) | ( ( !( portalRControl || ( !( ( readAddr == 4 ) && RULE$lread__RDY ) ) ) ) ? user$write.enq__RDY : 1'd0 );
    assign RULE$lread$agg_2e_tmp.data = RULE$lread$res;
    assign RULE$lread$agg_2e_tmp.id = RULE$lread$currentRead;
    assign RULE$lreadData$currentRData.data = readData$out.first[ 32 - 1 + 6 : 6 ];
    assign RULE$lreadData$currentRData.id = readData$out.first[ 6 - 1 : 0 ];
    assign RULE$lread__RDY = reqArs$out.first__RDY && ( ( portalRControl && readData$in.enq__RDY && ( reqArs$out.deq__RDY || ( !( readCount == 0 ) ) ) ) || ( ( !portalRControl ) && readData$in.enq__RDY && ( ( reqArs$out.deq__RDY && ( ( requestValue$out.first__RDY && ( requestValue$out.deq__RDY || ( !( readAddr == 0 ) ) ) ) || ( ( !requestValue$out.first__RDY ) && ( !( readAddr == 0 ) ) ) ) ) || ( ( !reqArs$out.deq__RDY ) && ( !( ( readCount == 0 ) || ( !( ( requestValue$out.first__RDY && ( requestValue$out.deq__RDY || ( !( readAddr == 0 ) ) ) ) || ( ( !requestValue$out.first__RDY ) && ( !( readAddr == 0 ) ) ) ) ) ) ) ) ) ) );
    assign RULE$lwrite$currentWData = writeData$out.first;
    assign RULE$lwrite$currentWrite = reqAws$out.first;
    assign RULE$lwrite__RDY = reqAws$out.first__RDY && writeData$out.first__RDY && ( ( portalWControl && writeData$out.deq__RDY && ( ( writeDone$in.enq__RDY && ( reqAws$out.deq__RDY || ( !( writeCount == 0 ) ) ) ) || ( ( !writeDone$in.enq__RDY ) && ( !( writeCount == 0 ) ) ) ) ) || ( ( !portalWControl ) && writeData$out.deq__RDY && ( ( writeDone$in.enq__RDY && ( ( reqAws$out.deq__RDY && user$write.enq__RDY ) || ( ( !reqAws$out.deq__RDY ) && ( !( ( writeCount == 0 ) || ( !user$write.enq__RDY ) ) ) ) ) ) || ( ( !writeDone$in.enq__RDY ) && ( !( ( writeCount == 0 ) || ( !user$write.enq__RDY ) ) ) ) ) ) );
    assign readData$in.enq$v = RULE$lread$agg_2e_tmp;
    assign readData$in.enq__ENA = RULE$lread__RDY;
    assign readData$out.deq__ENA = readData$out.first__RDY && MAXIGP0_I.R__RDY;
    assign user$read.enq__RDY = requestValue$in.enq__RDY;
    assign reqArs$in.enq$v = MAXIGP0_O.AR$id;
    assign reqArs$in.enq__ENA = MAXIGP0_O.AR__ENA;
    assign reqArs$out.deq__ENA = RULE$lread__RDY && ( readCount == 0 );
    assign reqAws$in.enq$v = MAXIGP0_O.AW$id;
    assign reqAws$in.enq__ENA = MAXIGP0_O.AW__ENA;
    assign reqAws$out.deq__ENA = RULE$lwrite__RDY && ( writeCount == 0 );
    assign requestValue$in.enq$v = user$read.enq$v;
    assign requestValue$in.enq__ENA = user$read.enq__ENA;
    assign requestValue$out.deq__ENA = !( portalRControl || ( !( ( readAddr == 0 ) && RULE$lread__RDY ) ) );
    assign user$write.enq$last = writeAddr != 0;
    assign user$write.enq$v = RULE$lwrite$currentWData;
    assign user$write.enq__ENA = !( portalWControl || ( !RULE$lwrite__RDY ) );
    assign writeData$in.enq$v = MAXIGP0_O.W$data;
    assign writeData$in.enq__ENA = MAXIGP0_O.W__ENA;
    assign writeData$out.deq__ENA = RULE$lwrite__RDY;
    assign writeDone$in.enq$v = RULE$lwrite$currentWrite;
    assign writeDone$in.enq__ENA = RULE$lwrite__RDY && ( writeCount == 0 );
    assign writeDone$out.deq__ENA = writeDone$out.first__RDY && MAXIGP0_I.B__RDY;

    always @( posedge CLK) begin
      if (!nRST) begin
        intEnable <= 0;
        portalRControl <= 0;
        portalWControl <= 0;
        readAddr <= 0;
        readCount <= 0;
        selectRIndReq <= 0;
        selectWIndReq <= 0;
        writeAddr <= 0;
        writeCount <= 0;
        writeReady <= 0;
      end // nRST
      else begin
        if (MAXIGP0_O.AR__ENA && MAXIGP0_O.AR__RDY) begin // MAXIGP0_O.AR__ENA
            portalRControl <= MAXIGP0_O.AR$addr[ 11 : 5 ] == 0;
            selectRIndReq <= MAXIGP0_O.AR$addr[ 12 ] != 0;
            readCount <= MAXIGP0_O.AR$len;
            readAddr <= MAXIGP0_O.AR$addr;
        end; // End of MAXIGP0_O.AR__ENA
        if (MAXIGP0_O.AW__ENA && MAXIGP0_O.AW__RDY) begin // MAXIGP0_O.AW__ENA
            portalWControl <= MAXIGP0_O.AW$addr[ 11 : 5 ] == 0;
            selectWIndReq <= MAXIGP0_O.AW$addr[ 12 ] != 0;
            writeCount <= MAXIGP0_O.AW$len;
            writeAddr <= MAXIGP0_O.AW$addr;
        end; // End of MAXIGP0_O.AW__ENA
        if (RULE$lread__RDY) begin // RULE$lread__ENA
            readCount <= readCount - 1;
            readAddr <= readAddr + 4;
        end; // End of RULE$lread__ENA
        if (RULE$lwrite__RDY) begin // RULE$lwrite__ENA
            writeCount <= writeCount - 1;
            writeAddr <= writeAddr + 4;
            if (( writeAddr == 4 ) && portalWControl)
            intEnable <= RULE$lwrite$currentWData[ 0 : 0 ] != 0;
        end; // End of RULE$lwrite__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
