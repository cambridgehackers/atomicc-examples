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
    wire [32 - 1:0]RULE$lread$agg_2e_tmp$data;
    wire [6 - 1:0]RULE$lread$agg_2e_tmp$id;
    wire RULE$lread$currentChannel;
    wire [6 - 1:0]RULE$lread$currentRead;
    wire [32 - 1:0]RULE$lread$res;
    wire [32 - 1:0]RULE$lreadData$currentRData$data;
    wire [6 - 1:0]RULE$lreadData$currentRData$id;
    wire RULE$lread__RDY;
    wire [32 - 1:0]RULE$lwrite$currentWData;
    wire [6 - 1:0]RULE$lwrite$currentWrite;
    wire RULE$lwrite__RDY;
    wire [38 - 1:0]readData$in$enq$v;
    wire readData$in$enq__RDY;
    wire readData$out$deq__ENA;
    wire readData$out$deq__RDY;
    wire [38 - 1:0]readData$out$first;
    wire readData$out$first__RDY;
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
    wire [32 - 1:0]requestValue$in$enq$v;
    wire requestValue$in$enq__RDY;
    wire requestValue$out$deq__ENA;
    wire requestValue$out$deq__RDY;
    wire [32 - 1:0]requestValue$out$first;
    wire requestValue$out$first__RDY;
    wire [32 - 1:0]user$read$enq$v;
    wire user$read$enq__ENA;
    wire user$write$enq$last;
    wire [32 - 1:0]user$write$enq$v;
    wire user$write$enq__ENA;
    wire user$write$enq__RDY;
    wire [32 - 1:0]writeData$in$enq$v;
    wire writeData$in$enq__RDY;
    wire writeData$out$deq__RDY;
    wire [32 - 1:0]writeData$out$first;
    wire writeData$out$first__RDY;
    wire [6 - 1:0]writeDone$in$enq$v;
    wire writeDone$in$enq__ENA;
    wire writeDone$in$enq__RDY;
    wire writeDone$out$deq__ENA;
    wire writeDone$out$deq__RDY;
    wire writeDone$out$first__RDY;
    Fifo1Base#(.width(6)) reqArs (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$AR__ENA),
        .in$enq$v(reqArs$in$enq$v),
        .in$enq__RDY(reqArs$in$enq__RDY),
        .out$deq__ENA(reqArs$out$deq__ENA),
        .out$deq__RDY(reqArs$out$deq__RDY),
        .out$first(reqArs$out$first),
        .out$first__RDY(reqArs$out$first__RDY));
    Fifo1Base#(.width(6)) reqAws (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$AW__ENA),
        .in$enq$v(reqAws$in$enq$v),
        .in$enq__RDY(reqAws$in$enq__RDY),
        .out$deq__ENA(reqAws$out$deq__ENA),
        .out$deq__RDY(reqAws$out$deq__RDY),
        .out$first(reqAws$out$first),
        .out$first__RDY(reqAws$out$first__RDY));
    Fifo1Base#(.width(6)) writeDone (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(writeDone$in$enq__ENA),
        .in$enq$v(writeDone$in$enq$v),
        .in$enq__RDY(writeDone$in$enq__RDY),
        .out$deq__ENA(writeDone$out$deq__ENA),
        .out$deq__RDY(writeDone$out$deq__RDY),
        .out$first(MAXIGP0_I$B$id),
        .out$first__RDY(writeDone$out$first__RDY));
    Fifo1Base#(.width(32)) requestValue (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(user$read$enq__ENA),
        .in$enq$v(requestValue$in$enq$v),
        .in$enq__RDY(requestValue$in$enq__RDY),
        .out$deq__ENA(requestValue$out$deq__ENA),
        .out$deq__RDY(requestValue$out$deq__RDY),
        .out$first(requestValue$out$first),
        .out$first__RDY(requestValue$out$first__RDY));
    Fifo1Base#(.width(38)) readData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(RULE$lread__RDY),
        .in$enq$v(readData$in$enq$v),
        .in$enq__RDY(readData$in$enq__RDY),
        .out$deq__ENA(readData$out$deq__ENA),
        .out$deq__RDY(readData$out$deq__RDY),
        .out$first(readData$out$first),
        .out$first__RDY(readData$out$first__RDY));
    Fifo1Base#(.width(32)) writeData (.CLK(CLK), .nRST(nRST),
        .in$enq__ENA(MAXIGP0_O$W__ENA),
        .in$enq$v(writeData$in$enq$v),
        .in$enq__RDY(writeData$in$enq__RDY),
        .out$deq__ENA(RULE$lwrite__RDY),
        .out$deq__RDY(writeData$out$deq__RDY),
        .out$first(writeData$out$first),
        .out$first__RDY(writeData$out$first__RDY));
    UserTop user (.CLK(CLK), .nRST(nRST),
        .write$enq__ENA(user$write$enq__ENA),
        .write$enq$v(user$write$enq$v),
        .write$enq$last(user$write$enq$last),
        .write$enq__RDY(user$write$enq__RDY),
        .read$enq__ENA(user$read$enq__ENA),
        .read$enq$v(user$read$enq$v),
        .read$enq$last(),
        .read$enq__RDY(requestValue$in$enq__RDY));
    assign MAXIGP0_I$B$resp = 2'd0;
    assign MAXIGP0_I$B__ENA = writeDone$out$first__RDY && writeDone$out$deq__RDY;
    assign MAXIGP0_I$R$data = RULE$lreadData$currentRData$data;
    assign MAXIGP0_I$R$id = RULE$lreadData$currentRData$id;
    assign MAXIGP0_I$R$last = 1;
    assign MAXIGP0_I$R$resp = 2'd0;
    assign MAXIGP0_I$R__ENA = readData$out$first__RDY && readData$out$deq__RDY;
    assign MAXIGP0_O$AR__RDY = reqArs$in$enq__RDY;
    assign MAXIGP0_O$AW__RDY = reqAws$in$enq__RDY;
    assign MAXIGP0_O$W__RDY = writeData$in$enq__RDY;
    assign interrupt = requestValue$out$deq__RDY && intEnable;
    assign readData$in$enq$v = { RULE$lread$agg_2e_tmp$data , RULE$lread$agg_2e_tmp$id };
    assign readData$out$deq__ENA = readData$out$first__RDY && MAXIGP0_I$R__RDY;
    assign reqArs$in$enq$v = MAXIGP0_O$AR$id[ 5 : 0 ];
    assign reqArs$out$deq__ENA = RULE$lread__RDY && ( readCount == 0 );
    assign reqAws$in$enq$v = MAXIGP0_O$AW$id[ 5 : 0 ];
    assign reqAws$out$deq__ENA = RULE$lwrite__RDY && ( writeCount == 0 );
    assign requestValue$in$enq$v = user$read$enq$v;
    assign requestValue$out$deq__ENA = !( portalRControl || ( !( ( readAddr == 0 ) && RULE$lread__RDY ) ) );
    assign user$write$enq$last = !( writeAddr == 0 );
    assign user$write$enq$v = RULE$lwrite$currentWData;
    assign user$write$enq__ENA = !( portalWControl || ( !RULE$lwrite__RDY ) );
    assign writeData$in$enq$v = MAXIGP0_O$W$data;
    assign writeDone$in$enq$v = RULE$lwrite$currentWrite;
    assign writeDone$in$enq__ENA = RULE$lwrite__RDY && ( writeCount == 0 );
    assign writeDone$out$deq__ENA = writeDone$out$first__RDY && MAXIGP0_I$B__RDY;
    // Extra assigments, not to output wires
    assign RULE$lread$agg_2e_tmp$data = RULE$lread$res;
    assign RULE$lread$agg_2e_tmp$id = RULE$lread$currentRead;
    assign RULE$lread$currentChannel = selectRIndReq ? 1'd0 : requestValue$out$deq__RDY;
    assign RULE$lread$currentRead = reqArs$out$first;
    assign RULE$lread$res = ( ( RULE$lread__RDY && ( readAddr == 0 ) && portalRControl ) ? RULE$lread$currentChannel : 1'd0 ) | ( ( RULE$lread__RDY && ( readAddr == 8 ) && portalRControl ) ? 32'd1 : 32'd0 ) | ( ( RULE$lread__RDY && ( readAddr == 12 ) && portalRControl ) ? RULE$lread$currentChannel : 1'd0 ) | ( ( RULE$lread__RDY && ( readAddr == 16 ) && portalRControl ) ? ( selectRIndReq ? 32'd6 : 32'd5 ) : 32'd0 ) | ( ( RULE$lread__RDY && ( readAddr == 20 ) && portalRControl ) ? 32'd2 : 32'd0 ) | ( ( !( portalRControl || ( !( ( readAddr == 0 ) && RULE$lread__RDY ) ) ) ) ? requestValue$out$first : 32'd0 ) | ( ( !( portalRControl || ( !( ( readAddr == 4 ) && RULE$lread__RDY ) ) ) ) ? user$write$enq__RDY : 1'd0 );
    assign RULE$lreadData$currentRData$data = readData$out$first[ 32 - 1 + 6 : 6 ];
    assign RULE$lreadData$currentRData$id = readData$out$first[ 6 - 1 : 0 ];
    assign RULE$lread__RDY = reqArs$out$first__RDY && ( ( portalRControl && readData$in$enq__RDY && ( reqArs$out$deq__RDY || ( !( readCount == 0 ) ) ) ) || ( ( !portalRControl ) && readData$in$enq__RDY && ( ( reqArs$out$deq__RDY && ( ( requestValue$out$first__RDY && ( requestValue$out$deq__RDY || ( !( readAddr == 0 ) ) ) ) || ( ( !requestValue$out$first__RDY ) && ( !( readAddr == 0 ) ) ) ) ) || ( ( !reqArs$out$deq__RDY ) && ( !( ( readCount == 0 ) || ( !( ( requestValue$out$first__RDY && ( requestValue$out$deq__RDY || ( !( readAddr == 0 ) ) ) ) || ( ( !requestValue$out$first__RDY ) && ( !( readAddr == 0 ) ) ) ) ) ) ) ) ) ) );
    assign RULE$lwrite$currentWData = writeData$out$first;
    assign RULE$lwrite$currentWrite = reqAws$out$first;
    assign RULE$lwrite__RDY = reqAws$out$first__RDY && writeData$out$first__RDY && ( ( portalWControl && writeData$out$deq__RDY && ( ( writeDone$in$enq__RDY && ( reqAws$out$deq__RDY || ( !( writeCount == 0 ) ) ) ) || ( ( !writeDone$in$enq__RDY ) && ( !( writeCount == 0 ) ) ) ) ) || ( ( !portalWControl ) && writeData$out$deq__RDY && ( ( writeDone$in$enq__RDY && ( ( reqAws$out$deq__RDY && user$write$enq__RDY ) || ( ( !reqAws$out$deq__RDY ) && ( !( ( writeCount == 0 ) || ( !user$write$enq__RDY ) ) ) ) ) ) || ( ( !writeDone$in$enq__RDY ) && ( !( ( writeCount == 0 ) || ( !user$write$enq__RDY ) ) ) ) ) ) );

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
        if (MAXIGP0_O$AR__ENA && reqArs$in$enq__RDY) begin // MAXIGP0_O$AR__ENA
            portalRControl <= MAXIGP0_O$AR$addr[ 11 : 5 ] == 0;
            selectRIndReq <= MAXIGP0_O$AR$addr[ 12 ] != 0;
            readCount <= MAXIGP0_O$AR$len;
            readAddr <= MAXIGP0_O$AR$addr;
        end; // End of MAXIGP0_O$AR__ENA
        if (MAXIGP0_O$AW__ENA && reqAws$in$enq__RDY) begin // MAXIGP0_O$AW__ENA
            portalWControl <= MAXIGP0_O$AW$addr[ 11 : 5 ] == 0;
            selectWIndReq <= MAXIGP0_O$AW$addr[ 12 ] != 0;
            writeCount <= MAXIGP0_O$AW$len;
            writeAddr <= MAXIGP0_O$AW$addr;
        end; // End of MAXIGP0_O$AW__ENA
        if (RULE$lread__RDY) begin // RULE$lread__ENA
            if (1) begin
            readCount <= readCount - 1;
            readAddr <= readAddr + 4;
            end;
        end; // End of RULE$lread__ENA
        if (RULE$lwrite__RDY) begin // RULE$lwrite__ENA
            if (1) begin
            writeCount <= writeCount - 1;
            writeAddr <= writeAddr + 4;
            end;
            if (( writeAddr == 4 ) && portalWControl)
            intEnable <= RULE$lwrite$currentWData[ 0 : 0 ] != 0;
        end; // End of RULE$lwrite__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
