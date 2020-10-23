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
    logic RULE$lread__ENA;
    logic RULE$lread__RDY;
    logic RULE$lwrite__ENA;
    logic RULE$lwrite__RDY;
    ReadResp _RULE$lread$agg_2e_tmp;
    logic [32 - 1:0]_RULE$lread$res;
    ReadResp _RULE$lreadData$currentRData;
    logic [32 - 1:0]_RULE$lwrite$currentWData;
    PipeOut#(.width(32)) __traceMemory$out();
    PipeIn#(.width(38)) readData$in();
    PipeOut#(.width(38)) readData$out();
    PipeInLast#(.width(32)) readUser();
    PipeIn#(.width(6)) reqArs$in();
    PipeOut#(.width(6)) reqArs$out();
    PipeIn#(.width(6)) reqAws$in();
    PipeOut#(.width(6)) reqAws$out();
    PipeIn#(.width(32)) requestValue$in();
    PipeOut#(.width(32)) requestValue$out();
    PipeInLast#(.width(32)) user$read();
    PipeInLast#(.width(32)) user$write();
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
        .read(readUser));
    Trace#(.width(32+1+1+1+1+1+1+1+1+1+1+1+32+12+4+32+12+4+32+12+1+32+12+1+2+12+2),.depth(1024),.sensitivity(1+1+1+1+1+1+1+1+1+1+1)) __traceMemory (
        .CLK(CLK),
        .nRST(nRST),
        .enable(1'd1),
        .data({ 32'd0 , interrupt , MAXIGP0_O.AR__ENA , MAXIGP0_O.AR__RDY , MAXIGP0_O.AW__ENA , MAXIGP0_O.AW__RDY , MAXIGP0_O.W__ENA , MAXIGP0_O.W__RDY , MAXIGP0_I.R__ENA , MAXIGP0_I.R__RDY , MAXIGP0_I.B__ENA , MAXIGP0_I.B__RDY , MAXIGP0_O.AR$addr , MAXIGP0_O.AR$id , MAXIGP0_O.AR$len , MAXIGP0_O.AW$addr , MAXIGP0_O.AW$id , MAXIGP0_O.AW$len , MAXIGP0_O.W$data , MAXIGP0_O.W$id , MAXIGP0_O.W$last , MAXIGP0_I.R$data , MAXIGP0_I.R$id , MAXIGP0_I.R$last , MAXIGP0_I.R$resp , MAXIGP0_I.B$id , MAXIGP0_I.B$resp }),
        .out(__traceMemory$out));
    assign interrupt = !( ( requestValue$out.deq__RDY == 0 ) || ( !intEnable ) );
    // Extra assigments, not to output wires
    assign MAXIGP0_I.B$id = ( writeDone$out.first__RDY && writeDone$out.deq__RDY ) ? writeDone$out.first : 0;
    assign MAXIGP0_I.B$resp = 0;
    assign MAXIGP0_I.B__ENA = writeDone$out.first__RDY && writeDone$out.deq__RDY;
    assign MAXIGP0_I.R$data = ( readData$out.first__RDY && readData$out.deq__RDY ) ? _RULE$lreadData$currentRData.data : 0;
    assign MAXIGP0_I.R$id = ( readData$out.first__RDY && readData$out.deq__RDY ) ? _RULE$lreadData$currentRData.id : 0;
    assign MAXIGP0_I.R$last = !( ( 1 == 0 ) || ( !readData$out.deq__RDY ) || ( !readData$out.first__RDY ) );
    assign MAXIGP0_I.R$resp = 0;
    assign MAXIGP0_I.R__ENA = readData$out.first__RDY && readData$out.deq__RDY;
    assign MAXIGP0_O.AR__RDY = reqArs$in.enq__RDY;
    assign MAXIGP0_O.AW__RDY = reqAws$in.enq__RDY;
    assign MAXIGP0_O.W__RDY = writeData$in.enq__RDY;
    assign RULE$lread__ENA = reqArs$out.first__RDY && ( ( portalRControl && readData$in.enq__RDY && ( reqArs$out.deq__RDY || ( !( readCount == 0 ) ) ) ) || ( ( !portalRControl ) && readData$in.enq__RDY && ( ( reqArs$out.deq__RDY && ( ( requestValue$out.first__RDY && ( requestValue$out.deq__RDY || ( !( readAddr == 0 ) ) ) ) || ( ( !requestValue$out.first__RDY ) && ( !( readAddr == 0 ) ) ) ) ) || ( ( !reqArs$out.deq__RDY ) && ( !( ( readCount == 0 ) || ( !( ( requestValue$out.first__RDY && ( requestValue$out.deq__RDY || ( !( readAddr == 0 ) ) ) ) || ( ( !requestValue$out.first__RDY ) && ( !( readAddr == 0 ) ) ) ) ) ) ) ) ) ) );
    assign RULE$lread__RDY = reqArs$out.first__RDY && ( ( portalRControl && readData$in.enq__RDY && ( reqArs$out.deq__RDY || ( !( readCount == 0 ) ) ) ) || ( ( !portalRControl ) && readData$in.enq__RDY && ( ( reqArs$out.deq__RDY && ( ( requestValue$out.first__RDY && ( requestValue$out.deq__RDY || ( !( readAddr == 0 ) ) ) ) || ( ( !requestValue$out.first__RDY ) && ( !( readAddr == 0 ) ) ) ) ) || ( ( !reqArs$out.deq__RDY ) && ( !( ( readCount == 0 ) || ( !( ( requestValue$out.first__RDY && ( requestValue$out.deq__RDY || ( !( readAddr == 0 ) ) ) ) || ( ( !requestValue$out.first__RDY ) && ( !( readAddr == 0 ) ) ) ) ) ) ) ) ) ) );
    assign RULE$lwrite__ENA = reqAws$out.first__RDY && writeData$out.first__RDY && ( ( portalWControl && writeData$out.deq__RDY && ( ( writeDone$in.enq__RDY && ( reqAws$out.deq__RDY || ( !( writeCount == 0 ) ) ) ) || ( ( !writeDone$in.enq__RDY ) && ( !( writeCount == 0 ) ) ) ) ) || ( ( !portalWControl ) && writeData$out.deq__RDY && ( ( writeDone$in.enq__RDY && ( ( reqAws$out.deq__RDY && user$write.enq__RDY ) || ( ( !reqAws$out.deq__RDY ) && ( !( ( writeCount == 0 ) || ( !user$write.enq__RDY ) ) ) ) ) ) || ( ( !writeDone$in.enq__RDY ) && ( !( ( writeCount == 0 ) || ( !user$write.enq__RDY ) ) ) ) ) ) );
    assign RULE$lwrite__RDY = reqAws$out.first__RDY && writeData$out.first__RDY && ( ( portalWControl && writeData$out.deq__RDY && ( ( writeDone$in.enq__RDY && ( reqAws$out.deq__RDY || ( !( writeCount == 0 ) ) ) ) || ( ( !writeDone$in.enq__RDY ) && ( !( writeCount == 0 ) ) ) ) ) || ( ( !portalWControl ) && writeData$out.deq__RDY && ( ( writeDone$in.enq__RDY && ( ( reqAws$out.deq__RDY && user$write.enq__RDY ) || ( ( !reqAws$out.deq__RDY ) && ( !( ( writeCount == 0 ) || ( !user$write.enq__RDY ) ) ) ) ) ) || ( ( !writeDone$in.enq__RDY ) && ( !( ( writeCount == 0 ) || ( !user$write.enq__RDY ) ) ) ) ) ) );
    assign _RULE$lread$agg_2e_tmp.data = _RULE$lread$res;
    assign _RULE$lread$agg_2e_tmp.id = reqArs$out.first;
    assign _RULE$lreadData$currentRData = readData$out.first;
    assign _RULE$lwrite$currentWData = writeData$out.first;
    assign readData$in.enq$v = ( reqArs$out.first__RDY && ( ( portalRControl && ( reqArs$out.deq__RDY || ( !( readCount == 0 ) ) ) ) || ( ( !portalRControl ) && ( ( reqArs$out.deq__RDY && ( ( requestValue$out.first__RDY && ( requestValue$out.deq__RDY || ( !( readAddr == 0 ) ) ) ) || ( ( !requestValue$out.first__RDY ) && ( !( readAddr == 0 ) ) ) ) ) || ( ( !reqArs$out.deq__RDY ) && ( !( ( readCount == 0 ) || ( !( ( requestValue$out.first__RDY && ( requestValue$out.deq__RDY || ( !( readAddr == 0 ) ) ) ) || ( ( !requestValue$out.first__RDY ) && ( !( readAddr == 0 ) ) ) ) ) ) ) ) ) ) ) ) ? _RULE$lread$agg_2e_tmp : 0;
    assign readData$in.enq__ENA = reqArs$out.first__RDY && ( ( portalRControl && ( reqArs$out.deq__RDY || ( !( readCount == 0 ) ) ) ) || ( ( !portalRControl ) && ( ( reqArs$out.deq__RDY && ( ( requestValue$out.first__RDY && ( requestValue$out.deq__RDY || ( !( readAddr == 0 ) ) ) ) || ( ( !requestValue$out.first__RDY ) && ( !( readAddr == 0 ) ) ) ) ) || ( ( !reqArs$out.deq__RDY ) && ( !( ( readCount == 0 ) || ( !( ( requestValue$out.first__RDY && ( requestValue$out.deq__RDY || ( !( readAddr == 0 ) ) ) ) || ( ( !requestValue$out.first__RDY ) && ( !( readAddr == 0 ) ) ) ) ) ) ) ) ) ) );
    assign readData$out.deq__ENA = readData$out.first__RDY && MAXIGP0_I.R__RDY;
    assign readUser.enq__RDY = requestValue$in.enq__RDY;
    assign reqArs$in.enq$v = MAXIGP0_O.AR__ENA ? MAXIGP0_O.AR$id : 0;
    assign reqArs$in.enq__ENA = MAXIGP0_O.AR__ENA;
    assign reqArs$out.deq__ENA = reqArs$out.first__RDY && ( ( portalRControl && readData$in.enq__RDY && ( readCount == 0 ) ) || ( ( !portalRControl ) && readData$in.enq__RDY && ( readCount == 0 ) && ( ( requestValue$out.first__RDY && ( requestValue$out.deq__RDY || ( !( readAddr == 0 ) ) ) ) || ( ( !requestValue$out.first__RDY ) && ( !( readAddr == 0 ) ) ) ) ) );
    assign reqAws$in.enq$v = MAXIGP0_O.AW__ENA ? MAXIGP0_O.AW$id : 0;
    assign reqAws$in.enq__ENA = MAXIGP0_O.AW__ENA;
    assign reqAws$out.deq__ENA = reqAws$out.first__RDY && writeData$out.first__RDY && ( ( portalWControl && writeData$out.deq__RDY && writeDone$in.enq__RDY && ( writeCount == 0 ) ) || ( ( !portalWControl ) && writeData$out.deq__RDY && writeDone$in.enq__RDY && ( writeCount == 0 ) && user$write.enq__RDY ) );
    assign requestValue$in.enq$v = readUser.enq__ENA ? readUser.enq$v : 0;
    assign requestValue$in.enq__ENA = readUser.enq__ENA;
    assign requestValue$out.deq__ENA = !( portalRControl || ( !( ( readAddr == 0 ) && reqArs$out.first__RDY && readData$in.enq__RDY && ( ( reqArs$out.deq__RDY && requestValue$out.first__RDY ) || ( ( !reqArs$out.deq__RDY ) && ( !( ( readCount == 0 ) || ( !requestValue$out.first__RDY ) ) ) ) ) ) ) );
    assign user$write.enq$last = !( portalWControl || ( writeDone$in.enq__RDY && ( ( reqAws$out.deq__RDY && ( writeAddr == 0 ) ) || ( ( !reqAws$out.deq__RDY ) && ( ( writeCount == 0 ) || ( writeAddr == 0 ) ) ) ) ) || ( ( !writeDone$in.enq__RDY ) && ( ( writeCount == 0 ) || ( writeAddr == 0 ) ) ) || ( !writeData$out.deq__RDY ) || ( !writeData$out.first__RDY ) || ( !reqAws$out.first__RDY ) );
    assign user$write.enq$v = ( !( portalWControl || ( !( reqAws$out.first__RDY && writeData$out.first__RDY && writeData$out.deq__RDY && ( ( writeDone$in.enq__RDY && ( reqAws$out.deq__RDY || ( !( writeCount == 0 ) ) ) ) || ( ( !writeDone$in.enq__RDY ) && ( !( writeCount == 0 ) ) ) ) ) ) ) ) ? writeData$out.first : 0;
    assign user$write.enq__ENA = !( portalWControl || ( !( reqAws$out.first__RDY && writeData$out.first__RDY && writeData$out.deq__RDY && ( ( writeDone$in.enq__RDY && ( reqAws$out.deq__RDY || ( !( writeCount == 0 ) ) ) ) || ( ( !writeDone$in.enq__RDY ) && ( !( writeCount == 0 ) ) ) ) ) ) );
    assign writeData$in.enq$v = MAXIGP0_O.W__ENA ? MAXIGP0_O.W$data : 0;
    assign writeData$in.enq__ENA = MAXIGP0_O.W__ENA;
    assign writeData$out.deq__ENA = reqAws$out.first__RDY && writeData$out.first__RDY && ( ( portalWControl && ( ( writeDone$in.enq__RDY && ( reqAws$out.deq__RDY || ( !( writeCount == 0 ) ) ) ) || ( ( !writeDone$in.enq__RDY ) && ( !( writeCount == 0 ) ) ) ) ) || ( ( !portalWControl ) && ( ( writeDone$in.enq__RDY && ( ( reqAws$out.deq__RDY && user$write.enq__RDY ) || ( ( !reqAws$out.deq__RDY ) && ( !( ( writeCount == 0 ) || ( !user$write.enq__RDY ) ) ) ) ) ) || ( ( !writeDone$in.enq__RDY ) && ( !( ( writeCount == 0 ) || ( !user$write.enq__RDY ) ) ) ) ) ) );
    assign writeDone$in.enq$v = ( reqAws$out.first__RDY && writeData$out.first__RDY && ( ( portalWControl && writeData$out.deq__RDY && reqAws$out.deq__RDY && ( writeCount == 0 ) ) || ( ( !portalWControl ) && writeData$out.deq__RDY && reqAws$out.deq__RDY && ( writeCount == 0 ) && user$write.enq__RDY ) ) ) ? reqAws$out.first : 0;
    assign writeDone$in.enq__ENA = reqAws$out.first__RDY && writeData$out.first__RDY && ( ( portalWControl && writeData$out.deq__RDY && reqAws$out.deq__RDY && ( writeCount == 0 ) ) || ( ( !portalWControl ) && writeData$out.deq__RDY && reqAws$out.deq__RDY && ( writeCount == 0 ) && user$write.enq__RDY ) );
    assign writeDone$out.deq__ENA = writeDone$out.first__RDY && MAXIGP0_I.B__RDY;
    always_comb begin
    _RULE$lread$res = 0;
    unique case(1'b1)
    ( readAddr == 0 ) && portalRControl: _RULE$lread$res = !( selectRIndReq || ( !requestValue$out.deq__RDY ) );
    ( readAddr == 8 ) && portalRControl: _RULE$lread$res = 32'd1;
    ( readAddr == 12 ) && portalRControl: _RULE$lread$res = !( selectRIndReq || ( !requestValue$out.deq__RDY ) );
    ( readAddr == 16 ) && portalRControl: _RULE$lread$res = selectRIndReq ? 32'd6 : 32'd5;
    ( readAddr == 20 ) && portalRControl: _RULE$lread$res = 32'd2;
    !( ( readAddr == 0 ) || ( readAddr == 8 ) || ( readAddr == 12 ) || ( readAddr == 16 ) || ( readAddr == 20 ) || ( !portalRControl ) ): _RULE$lread$res = 32'd0;
    !( portalRControl || ( !( readAddr == 0 ) ) ): _RULE$lread$res = requestValue$out.first;
    !( portalRControl || ( !( readAddr == 4 ) ) ): _RULE$lread$res = user$write.enq__RDY;
    !( ( readAddr == 0 ) || ( readAddr == 4 ) || portalRControl ): _RULE$lread$res = 32'd0;
    endcase
    end

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
        if (MAXIGP0_O.AR__ENA && reqArs$in.enq__RDY) begin // MAXIGP0_O.AR__ENA
            portalRControl <= MAXIGP0_O.AR$addr[ 11 : 5 ] == 0;
            selectRIndReq <= MAXIGP0_O.AR$addr[ 12 ] != 0;
            readCount <= MAXIGP0_O.AR$len;
            readAddr <= MAXIGP0_O.AR$addr;
        end; // End of MAXIGP0_O.AR__ENA
        if (MAXIGP0_O.AW__ENA && reqAws$in.enq__RDY) begin // MAXIGP0_O.AW__ENA
            portalWControl <= MAXIGP0_O.AW$addr[ 11 : 5 ] == 0;
            selectWIndReq <= MAXIGP0_O.AW$addr[ 12 ] != 0;
            writeCount <= MAXIGP0_O.AW$len;
            writeAddr <= MAXIGP0_O.AW$addr;
        end; // End of MAXIGP0_O.AW__ENA
        if (RULE$lread__ENA && RULE$lread__RDY) begin // RULE$lread__ENA
            readCount <= readCount - 4'd1;
            readAddr <= readAddr + 5'd4;
        end; // End of RULE$lread__ENA
        if (RULE$lwrite__ENA && RULE$lwrite__RDY) begin // RULE$lwrite__ENA
            writeCount <= writeCount - 4'd1;
            writeAddr <= writeAddr + 5'd4;
            if (( writeAddr == 4 ) && portalWControl)
            intEnable <= _RULE$lwrite$currentWData[ 0 : 0 ] != 0;
        end; // End of RULE$lwrite__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
