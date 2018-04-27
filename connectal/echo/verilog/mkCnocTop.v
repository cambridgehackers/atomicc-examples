`define BSV_RESET_VALUE 1'b0
`define BSV_RESET_EDGE negedge
module mkCnocTop( input  CLK, input  RST_N,
  input  [31 : 0] requests_0_message_enq_v, input  EN_requests_0_message_enq, output RDY_requests_0_message_enq,
  output requests_0_message_notFull, output RDY_requests_0_message_notFull,
  output [31 : 0] indications_0_message_first, output RDY_indications_0_message_first,
  input  EN_indications_0_message_deq, output RDY_indications_0_message_deq,
  output indications_0_message_notEmpty, output RDY_indications_0_message_notEmpty);

  wire [31 : 0] lEIO_portalIfc_indications_0_first, lEIO_portalIfc_indications_1_first;
  wire [15 : 0] lEIO_portalIfc_messageSize_size;
  wire lEIO_RDY_ifc_heard, lEIO_RDY_ifc_heard2,
       lEIO_RDY_portalIfc_indications_0_deq, lEIO_RDY_portalIfc_indications_0_first,
       lEIO_RDY_portalIfc_indications_1_deq, lEIO_RDY_portalIfc_indications_1_first,
       lEIO_portalIfc_indications_0_notEmpty, lEIO_portalIfc_indications_1_notEmpty;
  wire [31 : 0] lERI_lEcho_say2_a_b, lERI_lEcho_say_v;
  wire lERI_RDY_pipes_say2_PipeOut_deq, lERI_RDY_lEcho_say2_a_b,
       lERI_RDY_pipes_say_PipeOut_deq, lERI_RDY_lEcho_say_v,
       lERI_RDY_pipes_setLeds_PipeOut_deq, lERI_RDY_portalIfc_requests_0_enq,
       lERI_RDY_portalIfc_requests_1_enq, lERI_RDY_portalIfc_requests_2_enq;
  wire [31 : 0] lEcho_heard_v; wire lEcho_delay_EMPTY_N, lEcho_delay_FULL_N;
  wire [31 : 0] lEcho_heard2_a_b; wire lEcho_delay2_EMPTY_N, lEcho_delay2_FULL_N;
  wire RULElEIO_sendHeader, RULElEIO_sendMessage, RULElERI_receiveMessage, RULElERI_receiveHeader;
  wire [15 : 0] numWords__h1336;
  wire [7 : 0] _theResult____h1942, readyChannel__h1054;
  wire lERI_fifoMsgSink_FULL_N;
  wire lEIO_fifoMsgSource_EMPTY_N;
  wire indicationAvailable;

  reg indicationState;
  reg [15 : 0] indicationWords;
  reg [7 : 0] indicationId;
  reg requestState;
  reg [7 : 0] requestWords;
  reg [7 : 0] requestId;
  reg [31 : 0] indicationData;
  reg CCI_methodIdReg_indDeq, CCR_methodIdReg_reqEnq;

  assign RDY_requests_0_message_notFull = 1'd1;
  assign RDY_indications_0_message_notEmpty = 1'd1;
  assign RDY_requests_0_message_enq = lERI_fifoMsgSink_FULL_N;
  assign requests_0_message_notFull = lERI_fifoMsgSink_FULL_N;
  assign RDY_indications_0_message_first = lEIO_fifoMsgSource_EMPTY_N;
  assign RDY_indications_0_message_deq = lEIO_fifoMsgSource_EMPTY_N;
  assign indications_0_message_notEmpty = lEIO_fifoMsgSource_EMPTY_N;

  assign indicationAvailable = !indicationState && (lEIO_portalIfc_indications_0_notEmpty || lEIO_portalIfc_indications_1_notEmpty);
  assign RULElERI_receiveHeader = EN_requests_0_message_enq && !requestState;
  assign RULElERI_receiveMessage = EN_requests_0_message_enq && requestState && CCR_methodIdReg_reqEnq;
  assign RULElEIO_sendHeader = EN_indications_0_message_deq && indicationAvailable;
  assign RULElEIO_sendMessage = EN_indications_0_message_deq && indicationState && CCI_methodIdReg_indDeq;

  assign lERI_fifoMsgSink_FULL_N = (!requestState || CCR_methodIdReg_reqEnq);

  assign indications_0_message_first =
    indicationAvailable ? { { 8'd0, readyChannel__h1054 }, numWords__h1336 + 16'd1 } : indicationData;
  assign lEIO_fifoMsgSource_EMPTY_N = (indicationState && CCI_methodIdReg_indDeq ) || indicationAvailable;

  // AdapterFromBus
  mkEchoRequestInput lERI(.CLK(CLK), .RST_N(RST_N),
    // from bus
    .portalIfc_requests_0_enq_v(requests_0_message_enq_v),
    .portalIfc_requests_1_enq_v(requests_0_message_enq_v),
    .portalIfc_requests_2_enq_v(requests_0_message_enq_v),
    .EN_portalIfc_requests_0_enq(RULElERI_receiveMessage && requestId == 8'd0), .RDY_portalIfc_requests_0_enq(lERI_RDY_portalIfc_requests_0_enq),
    .EN_portalIfc_requests_1_enq(RULElERI_receiveMessage && requestId == 8'd1), .RDY_portalIfc_requests_1_enq(lERI_RDY_portalIfc_requests_1_enq),
    .EN_portalIfc_requests_2_enq(RULElERI_receiveMessage && requestId == 8'd2), .RDY_portalIfc_requests_2_enq(lERI_RDY_portalIfc_requests_2_enq),
    .portalIfc_messageSize_size_methodNumber(0), .portalIfc_messageSize_size(), .RDY_portalIfc_messageSize_size(),
    .portalIfc_requests_0_notFull(), .RDY_portalIfc_requests_0_notFull(),
    .portalIfc_requests_1_notFull(), .RDY_portalIfc_requests_1_notFull(),
    .portalIfc_requests_2_notFull(), .RDY_portalIfc_requests_2_notFull(),
    .portalIfc_intr_status(), .RDY_portalIfc_intr_status(), .portalIfc_intr_channel(), .RDY_portalIfc_intr_channel(),

    // to user
    .pipes_say_PipeOut_first(lERI_lEcho_say_v), .RDY_pipes_say_PipeOut_first(lERI_RDY_lEcho_say_v),
    .pipes_say_PipeOut_notEmpty(), .RDY_pipes_say_PipeOut_notEmpty(),
    .pipes_say2_PipeOut_first(lERI_lEcho_say2_a_b), .RDY_pipes_say2_PipeOut_first(lERI_RDY_lEcho_say2_a_b),
    .EN_pipes_say_PipeOut_deq(lERI_RDY_lEcho_say_v && lERI_RDY_pipes_say_PipeOut_deq && lEcho_delay_FULL_N), .RDY_pipes_say_PipeOut_deq(lERI_RDY_pipes_say_PipeOut_deq),
    .EN_pipes_say2_PipeOut_deq(lERI_RDY_lEcho_say2_a_b && lERI_RDY_pipes_say2_PipeOut_deq && lEcho_delay2_FULL_N), .RDY_pipes_say2_PipeOut_deq(lERI_RDY_pipes_say2_PipeOut_deq),
    .EN_pipes_setLeds_PipeOut_deq(lERI_RDY_pipes_setLeds_PipeOut_deq), .RDY_pipes_setLeds_PipeOut_deq(lERI_RDY_pipes_setLeds_PipeOut_deq),
    .pipes_say2_PipeOut_notEmpty(), .RDY_pipes_say2_PipeOut_notEmpty(),
    .pipes_setLeds_PipeOut_first(), .RDY_pipes_setLeds_PipeOut_first(),
    .pipes_setLeds_PipeOut_notEmpty(), .RDY_pipes_setLeds_PipeOut_notEmpty());

  // AdapterToBus
  mkEchoIndicationOutput lEIO(.CLK(CLK), .RST_N(RST_N),
    // to bus
    .EN_portalIfc_indications_0_deq(RULElEIO_sendMessage && indicationId == 8'd0), .RDY_portalIfc_indications_0_deq(lEIO_RDY_portalIfc_indications_0_deq),
    .EN_portalIfc_indications_1_deq(RULElEIO_sendMessage && indicationId == 8'd1), .RDY_portalIfc_indications_1_deq(lEIO_RDY_portalIfc_indications_1_deq),
    .EN_ifc_heard(lEIO_RDY_ifc_heard && lEcho_delay_EMPTY_N), .EN_ifc_heard2(lEIO_RDY_ifc_heard2 && lEcho_delay2_EMPTY_N),
    .portalIfc_messageSize_size_methodNumber({ 8'd0, readyChannel__h1054 }),
    .portalIfc_messageSize_size(lEIO_portalIfc_messageSize_size), .RDY_portalIfc_messageSize_size(),
    .portalIfc_indications_0_first(lEIO_portalIfc_indications_0_first), .RDY_portalIfc_indications_0_first(lEIO_RDY_portalIfc_indications_0_first),
    .portalIfc_indications_0_notEmpty(lEIO_portalIfc_indications_0_notEmpty), .RDY_portalIfc_indications_0_notEmpty(),
    .portalIfc_indications_1_first(lEIO_portalIfc_indications_1_first), .RDY_portalIfc_indications_1_first(lEIO_RDY_portalIfc_indications_1_first),
    .portalIfc_indications_1_notEmpty(lEIO_portalIfc_indications_1_notEmpty), .RDY_portalIfc_indications_1_notEmpty(),
    .portalIfc_intr_status(), .RDY_portalIfc_intr_status(), .portalIfc_intr_channel(), .RDY_portalIfc_intr_channel(),

    // from user
    .ifc_heard2_a(lEcho_heard2_a_b[15:0]), .ifc_heard2_b(lEcho_heard2_a_b[31:16]), .ifc_heard_v(lEcho_heard_v),
    .RDY_ifc_heard(lEIO_RDY_ifc_heard), .RDY_ifc_heard2(lEIO_RDY_ifc_heard2));

  SizedFIFO #(.p1width(32'd32), .p2depth(32'd8), .p3cntr_width(32'd3), .guarded(32'd1)) lEcho_delay(
      .RST(RST_N), .CLK(CLK), .D_IN(lERI_lEcho_say_v),
      .ENQ(lERI_RDY_lEcho_say_v && lERI_RDY_pipes_say_PipeOut_deq && lEcho_delay_FULL_N),
      .DEQ(lEIO_RDY_ifc_heard && lEcho_delay_EMPTY_N), .CLR(0), .D_OUT(lEcho_heard_v),
      .FULL_N(lEcho_delay_FULL_N), .EMPTY_N(lEcho_delay_EMPTY_N));

  SizedFIFO #(.p1width(32'd32), .p2depth(32'd8), .p3cntr_width(32'd3), .guarded(32'd1)) lEcho_delay2(
      .RST(RST_N), .CLK(CLK), .D_IN(lERI_lEcho_say2_a_b),
      .ENQ(lERI_RDY_lEcho_say2_a_b && lERI_RDY_pipes_say2_PipeOut_deq && lEcho_delay2_FULL_N),
      .DEQ(lEIO_RDY_ifc_heard2 && lEcho_delay2_EMPTY_N), .CLR(0), .D_OUT(lEcho_heard2_a_b),
      .FULL_N(lEcho_delay2_FULL_N), .EMPTY_N(lEcho_delay2_EMPTY_N));

  assign _theResult____h1942 = (requests_0_message_enq_v[7:0] == 8'd1) ?
           requests_0_message_enq_v[7:0] : (requests_0_message_enq_v[7:0] - 8'd1);
  assign numWords__h1336 = { 5'd0, lEIO_portalIfc_messageSize_size[15:5] } + ((lEIO_portalIfc_messageSize_size[4:0] == 5'd0) ?  16'd0 : 16'd1);
  assign readyChannel__h1054 = lEIO_portalIfc_indications_0_notEmpty ?  8'd0 :
           (lEIO_portalIfc_indications_1_notEmpty ?  8'd1 : 8'd255);

  always@(posedge CLK)
  begin
    case (indicationId)
    8'd0: indicationData = lEIO_portalIfc_indications_0_first;
    8'd1: indicationData = lEIO_portalIfc_indications_1_first;
    default: indicationData = 32'hAAAAAAAA /* unspecified value */;
    endcase
    case (indicationId)
    8'd0: CCI_methodIdReg_indDeq = lEIO_RDY_portalIfc_indications_0_deq && lEIO_RDY_portalIfc_indications_0_first;
    8'd1: CCI_methodIdReg_indDeq = lEIO_RDY_portalIfc_indications_1_deq && lEIO_RDY_portalIfc_indications_1_first;
    default: CCI_methodIdReg_indDeq = 1'd1;
    endcase
    case (requestId)
    8'd0: CCR_methodIdReg_reqEnq = lERI_RDY_portalIfc_requests_0_enq;
    8'd1: CCR_methodIdReg_reqEnq = lERI_RDY_portalIfc_requests_1_enq;
    8'd2: CCR_methodIdReg_reqEnq = lERI_RDY_portalIfc_requests_2_enq;
    default: CCR_methodIdReg_reqEnq = 1'd1;
    endcase
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
          indicationWords <= RULElEIO_sendHeader ?  numWords__h1336 : (indicationWords - 16'd1);
        if (RULElEIO_sendHeader)
          indicationId <= readyChannel__h1054;

        if (RULElERI_receiveHeader && _theResult____h1942 != 8'd0 || RULElERI_receiveMessage && requestWords == 8'd1)
          requestState <= RULElERI_receiveHeader && _theResult____h1942 != 8'd0;
        if (RULElERI_receiveHeader || RULElERI_receiveMessage)
          requestWords <= RULElERI_receiveHeader ?  _theResult____h1942 : (requestWords - 8'd1);
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
