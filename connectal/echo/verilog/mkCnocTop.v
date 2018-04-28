`define BSV_RESET_VALUE 1'b0
module mkCnocTop( input  CLK, input  RST_N,
  input  [31 : 0] requests_0_message_enq_v, input  EN_requests_0_message_enq, output RDY_requests_0_message_enq,
  output requests_0_message_notFull, output RDY_requests_0_message_notFull,
  output [31 : 0] indications_0_message_first, output RDY_indications_0_message_first,
  input  EN_indications_0_message_deq, output RDY_indications_0_message_deq,
  output indications_0_message_notEmpty, output RDY_indications_0_message_notEmpty);

  wire [31 : 0] lEcho_heard_v; wire lEcho_delay_EMPTY_N, lEcho_delay_FULL_N;
  wire [31 : 0] lEcho_heard2_a_b; wire lEcho_delay2_EMPTY_N, lEcho_delay2_FULL_N;
  wire RULElEIO_sendHeader, RULElEIO_sendMessage, RULElERI_receiveMessage, RULElERI_receiveHeader;
  wire RULElEIO_sendPortal, RULElERI_receivePortal;
  reg [1: 0]requestState, indicationState;

  wire [7 : 0] theResult, readyChannel;
  wire lERI_fifoMsgSink_FULL_N, lEIO_fifoMsgSource_EMPTY_N;
  wire indStart, indicationAvailable;

  reg [7 : 0] requestWords;
  reg [15 : 0] indicationWords;
  reg [7 : 0] requestPortal, indicationPortal;
  reg [7 : 0] requestId, indicationId;
  reg [31 : 0] indicationData;
  wire CCI_methodIdReg_indDeq, CCR_methodIdReg_reqEnq;

  assign RDY_requests_0_message_notFull = 1'd1;
  assign RDY_indications_0_message_notEmpty = 1'd1;
  assign requests_0_message_notFull = lERI_fifoMsgSink_FULL_N;
  assign RDY_requests_0_message_enq = lERI_fifoMsgSink_FULL_N;
  assign RDY_indications_0_message_first = lEIO_fifoMsgSource_EMPTY_N;
  assign RDY_indications_0_message_deq = lEIO_fifoMsgSource_EMPTY_N;
  assign indications_0_message_notEmpty = lEIO_fifoMsgSource_EMPTY_N;

  assign RULElERI_receivePortal = EN_requests_0_message_enq && requestState == 0;
  assign RULElERI_receiveHeader = EN_requests_0_message_enq && requestState == 1;
  assign RULElERI_receiveMessage = EN_requests_0_message_enq && requestState == 2 && CCR_methodIdReg_reqEnq;
  assign CCR_methodIdReg_reqEnq = (  (requestId == 8'd0 && lEcho_delay_FULL_N) || (requestId == 8'd1 && lEcho_delay2_FULL_N) ||  requestId == 8'd2);
  assign lERI_fifoMsgSink_FULL_N = (requestState == 1 || CCR_methodIdReg_reqEnq);
  assign theResult = (requests_0_message_enq_v[7:0] == 8'd1) ?
           requests_0_message_enq_v[7:0] : (requests_0_message_enq_v[7:0] - 8'd1);

  assign RULElEIO_sendPortal = EN_indications_0_message_deq && indicationState == 0 && indStart;
  assign RULElEIO_sendHeader = EN_indications_0_message_deq && indicationAvailable;
  assign RULElEIO_sendMessage = EN_indications_0_message_deq && indicationState == 2 && CCI_methodIdReg_indDeq;
  assign indStart = (lEcho_delay_EMPTY_N || lEcho_delay2_EMPTY_N);
  assign indicationAvailable = indicationState == 1 && indStart;
  assign readyChannel = lEcho_delay_EMPTY_N ?  8'd0 : (lEcho_delay2_EMPTY_N ?  8'd1 : 8'd255);
  assign indicationData = indicationId == 8'd0 ? lEcho_heard_v : lEcho_heard2_a_b;
  assign indications_0_message_first =
    indicationState == 0 ? { { 8'd5}, 16'd1 + 16'd1 + 16'd1} :
    indicationState == 1 ? { { 8'd0, readyChannel }, 16'd1 + 16'd1 } :
                           indicationData;
  assign lEIO_fifoMsgSource_EMPTY_N = (indicationState == 2 && CCI_methodIdReg_indDeq ) || indicationAvailable;
  assign CCI_methodIdReg_indDeq = indicationId == 8'd0 ? lEcho_delay_EMPTY_N : lEcho_delay2_EMPTY_N;

  SizedFIFO #(.p1width(32'd32), .p2depth(32'd8), .p3cntr_width(32'd3), .guarded(32'd1)) lEcho_delay(
      .RST(RST_N), .CLK(CLK), .D_IN(requests_0_message_enq_v),
      .ENQ(RULElERI_receiveMessage && requestId == 8'd0 && lEcho_delay_FULL_N),
      .DEQ(RULElEIO_sendMessage && indicationId == 8'd0 && lEcho_delay_EMPTY_N), .CLR(0),
      .D_OUT(lEcho_heard_v), .FULL_N(lEcho_delay_FULL_N), .EMPTY_N(lEcho_delay_EMPTY_N));

  SizedFIFO #(.p1width(32'd32), .p2depth(32'd8), .p3cntr_width(32'd3), .guarded(32'd1)) lEcho_delay2(
      .RST(RST_N), .CLK(CLK), .D_IN(requests_0_message_enq_v),
      .ENQ(RULElERI_receiveMessage && requestId == 8'd1 && lEcho_delay2_FULL_N),
      .DEQ((RULElEIO_sendMessage && indicationId == 8'd1) && lEcho_delay2_EMPTY_N), .CLR(0),
      .D_OUT(lEcho_heard2_a_b), .FULL_N(lEcho_delay2_FULL_N), .EMPTY_N(lEcho_delay2_EMPTY_N));

`define StartState 1
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        indicationState <= `StartState;
        indicationWords <= 16'd0;
        indicationId <= 8'd0;
        requestState <= `StartState;
        requestWords <= 8'd0;
        requestId <= 8'd0;
      end
    else
      begin
        if (RULElEIO_sendMessage && indicationWords == 16'd1)
          indicationState <= `StartState;
        if (RULElEIO_sendPortal)
          indicationState <= 1;
        if (RULElEIO_sendHeader)
          indicationState <= 2;
        if (RULElEIO_sendHeader)
          indicationWords <= 1;
        else if (RULElEIO_sendMessage)
          indicationWords <= indicationWords - 16'd1;
        if (RULElEIO_sendHeader)
          indicationId <= readyChannel;

        if (RULElERI_receivePortal)
          requestState <= 1;
        if (RULElERI_receiveHeader && theResult != 8'd0)
          requestState <= 2;
        if (RULElERI_receiveMessage && requestWords == 8'd1)
          requestState <= `StartState;
        if (RULElERI_receiveHeader)
          requestWords <= theResult;
        if (RULElERI_receiveMessage)
          requestWords <= requestWords - 8'd1;
        if (RULElERI_receiveHeader)
          requestId <= requests_0_message_enq_v[23:16];
        if (RULElERI_receivePortal)
          requestPortal <= requests_0_message_enq_v[23:16];
        if (EN_requests_0_message_enq)
          $display("CNOCTOP: incoming %x", requests_0_message_enq_v);
      end
  end
  initial
  begin
    indicationState = `StartState;
    indicationWords = 16'hAAAA;
    indicationId = 8'hAA;
    requestState = `StartState;
    requestWords = 8'hAA;
    requestId = 8'hAA;
  end
endmodule  // mkCnocTop
