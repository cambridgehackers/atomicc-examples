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
  reg requestState, indicationState;

  wire [7 : 0] theResult, readyChannel;
  wire lERI_fifoMsgSink_FULL_N, lEIO_fifoMsgSource_EMPTY_N;
  wire indicationAvailable;

  reg [15 : 0] indicationWords;
  reg [7 : 0] indicationId;
  reg [7 : 0] requestWords;
  reg [7 : 0] requestId;
  reg [31 : 0] indicationData;
  wire CCI_methodIdReg_indDeq, CCR_methodIdReg_reqEnq;

  assign RDY_requests_0_message_notFull = 1'd1;
  assign RDY_indications_0_message_notEmpty = 1'd1;
  assign requests_0_message_notFull = lERI_fifoMsgSink_FULL_N;
  assign RDY_requests_0_message_enq = lERI_fifoMsgSink_FULL_N;
  assign RDY_indications_0_message_first = lEIO_fifoMsgSource_EMPTY_N;
  assign RDY_indications_0_message_deq = lEIO_fifoMsgSource_EMPTY_N;
  assign indications_0_message_notEmpty = lEIO_fifoMsgSource_EMPTY_N;

  assign RULElERI_receiveHeader = EN_requests_0_message_enq && !requestState;
  assign RULElERI_receiveMessage = EN_requests_0_message_enq && requestState && CCR_methodIdReg_reqEnq;
  assign CCR_methodIdReg_reqEnq = (  (requestId == 8'd0 && lEcho_delay_FULL_N) || (requestId == 8'd1 && lEcho_delay2_FULL_N) ||  requestId == 8'd2);
  assign lERI_fifoMsgSink_FULL_N = (!requestState || CCR_methodIdReg_reqEnq);
  assign theResult = (requests_0_message_enq_v[7:0] == 8'd1) ?
           requests_0_message_enq_v[7:0] : (requests_0_message_enq_v[7:0] - 8'd1);

  assign RULElEIO_sendHeader = EN_indications_0_message_deq && indicationAvailable;
  assign RULElEIO_sendMessage = EN_indications_0_message_deq && indicationState && CCI_methodIdReg_indDeq;
  assign indicationAvailable = !indicationState && (lEcho_delay_EMPTY_N || lEcho_delay2_EMPTY_N);
  assign readyChannel = lEcho_delay_EMPTY_N ?  8'd0 : (lEcho_delay2_EMPTY_N ?  8'd1 : 8'd255);
  assign indicationData = indicationId == 8'd0 ? lEcho_heard_v : lEcho_heard2_a_b;
  assign indications_0_message_first =
    indicationAvailable ? { { 8'd0, readyChannel }, 1 + 16'd1 } : indicationData;
  assign lEIO_fifoMsgSource_EMPTY_N = (indicationState && CCI_methodIdReg_indDeq ) || indicationAvailable;
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

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        indicationState <= 1'd0;
        indicationWords <= 16'd0;
        indicationId <= 8'd0;
        requestState <= 1'd0;
        requestWords <= 8'd0;
        requestId <= 8'd0;
      end
    else
      begin
        if (RULElEIO_sendMessage && indicationWords == 16'd1 || RULElEIO_sendHeader)
          indicationState <= !(RULElEIO_sendMessage && indicationWords == 16'd1);
        if (RULElEIO_sendHeader || RULElEIO_sendMessage)
          indicationWords <= RULElEIO_sendHeader ?  1 : (indicationWords - 16'd1);
        if (RULElEIO_sendHeader)
          indicationId <= readyChannel;

        if (RULElERI_receiveHeader && theResult != 8'd0 || RULElERI_receiveMessage && requestWords == 8'd1)
          requestState <= RULElERI_receiveHeader && theResult != 8'd0;
        if (RULElERI_receiveHeader || RULElERI_receiveMessage)
          requestWords <= RULElERI_receiveHeader ?  theResult : (requestWords - 8'd1);
        if (RULElERI_receiveHeader)
          requestId <= requests_0_message_enq_v[23:16];
      end
  end
  initial
  begin
    indicationState = 1'h0;
    indicationWords = 16'hAAAA;
    indicationId = 8'hAA;
    requestState = 1'h0;
    requestWords = 8'hAA;
    requestId = 8'hAA;
  end
endmodule  // mkCnocTop
