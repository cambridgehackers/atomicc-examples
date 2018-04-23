`define BSV_RESET_VALUE 1'b0
`define BSV_RESET_EDGE negedge
module mkCnocTop( input  CLK, input  RST_N,
  output [31 : 0] requests_0_id, output RDY_requests_0_id,
  input  [31 : 0] requests_0_message_enq_v, input  EN_requests_0_message_enq, output RDY_requests_0_message_enq,
  output requests_0_message_notFull, output RDY_requests_0_message_notFull,
  output [31 : 0] indications_0_id, output RDY_indications_0_id,
  output [31 : 0] indications_0_message_first, output RDY_indications_0_message_first,
  input  EN_indications_0_message_deq, output RDY_indications_0_message_deq,
  output indications_0_message_notEmpty, output RDY_indications_0_message_notEmpty);

  wire [31 : 0] indications_0_id, indications_0_message_first, requests_0_id;
  wire RDY_indications_0_id, RDY_indications_0_message_deq, RDY_indications_0_message_first, RDY_indications_0_message_notEmpty,
       RDY_requests_0_id, RDY_requests_0_message_enq, RDY_requests_0_message_notFull,
       indications_0_message_notEmpty, requests_0_message_notFull;
  wire [31 : 0] lEchoIndicationOutput_portalIfc_indications_0_first, lEchoIndicationOutput_portalIfc_indications_1_first;
  wire [15 : 0] lEchoIndicationOutput_portalIfc_messageSize_size;
  wire lEchoIndicationOutput_RDY_ifc_heard, lEchoIndicationOutput_RDY_ifc_heard2,
       lEchoIndicationOutput_RDY_portalIfc_indications_0_deq, lEchoIndicationOutput_RDY_portalIfc_indications_0_first,
       lEchoIndicationOutput_RDY_portalIfc_indications_1_deq, lEchoIndicationOutput_RDY_portalIfc_indications_1_first,
       lEchoIndicationOutput_portalIfc_indications_0_notEmpty, lEchoIndicationOutput_portalIfc_indications_1_notEmpty;
  wire lEchoIndicationOutputNoc_fifoMsgSource_EMPTY_N, lEchoIndicationOutputNoc_fifoMsgSource_FULL_N;
  wire [31 : 0] lEchoRequestInput_pipes_say2_PipeOut_first, lEchoRequestInput_pipes_say_PipeOut_first;
  wire lEchoRequestInput_RDY_pipes_say2_PipeOut_deq, lEchoRequestInput_RDY_pipes_say2_PipeOut_first,
       lEchoRequestInput_RDY_pipes_say_PipeOut_deq, lEchoRequestInput_RDY_pipes_say_PipeOut_first,
       lEchoRequestInput_RDY_pipes_setLeds_PipeOut_deq, lEchoRequestInput_RDY_portalIfc_requests_0_enq,
       lEchoRequestInput_RDY_portalIfc_requests_1_enq, lEchoRequestInput_RDY_portalIfc_requests_2_enq;
  wire [31 : 0] lEchoRequestInputNoc_fifoMsgSink_D_OUT;
  wire lEchoRequestInputNoc_fifoMsgSink_EMPTY_N, lEchoRequestInputNoc_fifoMsgSink_FULL_N;
  wire [31 : 0] lEcho_delay_D_OUT;
  wire lEcho_delay_EMPTY_N, lEcho_delay_FULL_N;
  wire [31 : 0] lEcho_delay2_D_OUT;
  wire lEcho_delay2_EMPTY_N, lEcho_delay2_FULL_N;
  wire WILL_FIRE_RL_lEchoIndicationOutputNoc_sendHeader, WILL_FIRE_RL_lEchoIndicationOutputNoc_sendMessage,
       WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessage, ILL_FIRE_RL_lEchoRequestInputNoc_receiveMessageHeader;
  wire [15 : 0] methodNumber__h1378, numWords__h1336, roundup__h1335;
  wire [7 : 0] _theResult____h1942, readyChannel__h1054;

  reg lEchoIndicationOutputNoc_bpState;
  reg [15 : 0] lEchoIndicationOutputNoc_messageWordsReg;
  reg [7 : 0] lEchoIndicationOutputNoc_methodIdReg;
  reg lEchoRequestInputNoc_bpState;
  reg [7 : 0] lEchoRequestInputNoc_messageWordsReg;
  reg [7 : 0] lEchoRequestInputNoc_methodIdReg;
  reg [31 : 0] MUX_lEchoIndicationOutputNoc_fifoMsgSource_enq_1__VAL_2;
  reg CASE_lEchoIndicationOutputNoc_methodIdReg_0_lE_ETC__q1,
      CASE_lEchoIndicationOutputNoc_methodIdReg_0_lE_ETC__q2,
      CASE_lEchoRequestInputNoc_methodIdReg_0_lEchoR_ETC__q3;

  mkEchoIndicationOutput lEchoIndicationOutput(.CLK(CLK), .RST_N(RST_N),
    .ifc_heard2_a(lEcho_delay2_D_OUT[15:0]), .ifc_heard2_b(lEcho_delay2_D_OUT[31:16]), .ifc_heard_v(lEcho_delay_D_OUT),
    .portalIfc_messageSize_size_methodNumber(methodNumber__h1378),
    .EN_portalIfc_indications_0_deq(WILL_FIRE_RL_lEchoIndicationOutputNoc_sendMessage && lEchoIndicationOutputNoc_methodIdReg == 8'd0),
    .EN_portalIfc_indications_1_deq(WILL_FIRE_RL_lEchoIndicationOutputNoc_sendMessage && lEchoIndicationOutputNoc_methodIdReg == 8'd1),
    .EN_ifc_heard(lEchoIndicationOutput_RDY_ifc_heard && lEcho_delay_EMPTY_N), .EN_ifc_heard2(lEchoIndicationOutput_RDY_ifc_heard2 && lEcho_delay2_EMPTY_N),
    .portalIfc_messageSize_size(lEchoIndicationOutput_portalIfc_messageSize_size), .RDY_portalIfc_messageSize_size(),
    .portalIfc_indications_0_first(lEchoIndicationOutput_portalIfc_indications_0_first),
    .RDY_portalIfc_indications_0_first(lEchoIndicationOutput_RDY_portalIfc_indications_0_first),
    .RDY_portalIfc_indications_0_deq(lEchoIndicationOutput_RDY_portalIfc_indications_0_deq),
    .portalIfc_indications_0_notEmpty(lEchoIndicationOutput_portalIfc_indications_0_notEmpty),
    .RDY_portalIfc_indications_0_notEmpty(),
    .portalIfc_indications_1_first(lEchoIndicationOutput_portalIfc_indications_1_first),
    .RDY_portalIfc_indications_1_first(lEchoIndicationOutput_RDY_portalIfc_indications_1_first),
    .RDY_portalIfc_indications_1_deq(lEchoIndicationOutput_RDY_portalIfc_indications_1_deq),
    .portalIfc_indications_1_notEmpty(lEchoIndicationOutput_portalIfc_indications_1_notEmpty),
    .RDY_portalIfc_indications_1_notEmpty(), .portalIfc_intr_status(), .RDY_portalIfc_intr_status(),
    .portalIfc_intr_channel(), .RDY_portalIfc_intr_channel(),
    .RDY_ifc_heard(lEchoIndicationOutput_RDY_ifc_heard), .RDY_ifc_heard2(lEchoIndicationOutput_RDY_ifc_heard2));

  FIFO2 #(.width(32'd32), .guarded(32'd1)) lEchoIndicationOutputNoc_fifoMsgSource(.RST(RST_N), .CLK(CLK),
    .D_IN(WILL_FIRE_RL_lEchoIndicationOutputNoc_sendHeader ?
        { methodNumber__h1378, numWords__h1336 + 16'd1 } : MUX_lEchoIndicationOutputNoc_fifoMsgSource_enq_1__VAL_2),
    .ENQ(WILL_FIRE_RL_lEchoIndicationOutputNoc_sendHeader || WILL_FIRE_RL_lEchoIndicationOutputNoc_sendMessage),
    .DEQ(EN_indications_0_message_deq), .CLR(0), .D_OUT(indications_0_message_first),
    .FULL_N(lEchoIndicationOutputNoc_fifoMsgSource_FULL_N),
    .EMPTY_N(lEchoIndicationOutputNoc_fifoMsgSource_EMPTY_N));

  mkEchoRequestInput lEchoRequestInput(.CLK(CLK), .RST_N(RST_N),
      .portalIfc_messageSize_size_methodNumber(0),
      .portalIfc_requests_0_enq_v(lEchoRequestInputNoc_fifoMsgSink_D_OUT),
      .portalIfc_requests_1_enq_v(lEchoRequestInputNoc_fifoMsgSink_D_OUT),
      .portalIfc_requests_2_enq_v(lEchoRequestInputNoc_fifoMsgSink_D_OUT),
      .EN_portalIfc_requests_0_enq(WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessage && lEchoRequestInputNoc_methodIdReg == 8'd0),
      .EN_portalIfc_requests_1_enq(WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessage && lEchoRequestInputNoc_methodIdReg == 8'd1),
      .EN_portalIfc_requests_2_enq(WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessage && lEchoRequestInputNoc_methodIdReg == 8'd2),
      .EN_pipes_say_PipeOut_deq(lEchoRequestInput_RDY_pipes_say_PipeOut_first &&
         lEchoRequestInput_RDY_pipes_say_PipeOut_deq && lEcho_delay_FULL_N),
      .EN_pipes_say2_PipeOut_deq(lEchoRequestInput_RDY_pipes_say2_PipeOut_first &&
         lEchoRequestInput_RDY_pipes_say2_PipeOut_deq && lEcho_delay2_FULL_N),
      .EN_pipes_setLeds_PipeOut_deq(lEchoRequestInput_RDY_pipes_setLeds_PipeOut_deq),
      .portalIfc_messageSize_size(), .RDY_portalIfc_messageSize_size(),
      .RDY_portalIfc_requests_0_enq(lEchoRequestInput_RDY_portalIfc_requests_0_enq),
      .portalIfc_requests_0_notFull(), .RDY_portalIfc_requests_0_notFull(),
      .RDY_portalIfc_requests_1_enq(lEchoRequestInput_RDY_portalIfc_requests_1_enq),
      .portalIfc_requests_1_notFull(), .RDY_portalIfc_requests_1_notFull(),
      .RDY_portalIfc_requests_2_enq(lEchoRequestInput_RDY_portalIfc_requests_2_enq),
      .portalIfc_requests_2_notFull(), .RDY_portalIfc_requests_2_notFull(),
      .portalIfc_intr_status(), .RDY_portalIfc_intr_status(),
      .portalIfc_intr_channel(), .RDY_portalIfc_intr_channel(),
      .pipes_say_PipeOut_first(lEchoRequestInput_pipes_say_PipeOut_first),
      .RDY_pipes_say_PipeOut_first(lEchoRequestInput_RDY_pipes_say_PipeOut_first),
      .RDY_pipes_say_PipeOut_deq(lEchoRequestInput_RDY_pipes_say_PipeOut_deq),
      .pipes_say_PipeOut_notEmpty(), .RDY_pipes_say_PipeOut_notEmpty(),
      .pipes_say2_PipeOut_first(lEchoRequestInput_pipes_say2_PipeOut_first),
      .RDY_pipes_say2_PipeOut_first(lEchoRequestInput_RDY_pipes_say2_PipeOut_first),
      .RDY_pipes_say2_PipeOut_deq(lEchoRequestInput_RDY_pipes_say2_PipeOut_deq),
      .pipes_say2_PipeOut_notEmpty(), .RDY_pipes_say2_PipeOut_notEmpty(),
      .pipes_setLeds_PipeOut_first(), .RDY_pipes_setLeds_PipeOut_first(),
      .RDY_pipes_setLeds_PipeOut_deq(lEchoRequestInput_RDY_pipes_setLeds_PipeOut_deq),
      .pipes_setLeds_PipeOut_notEmpty(), .RDY_pipes_setLeds_PipeOut_notEmpty());

  FIFO2 #(.width(32'd32), .guarded(32'd1)) lEchoRequestInputNoc_fifoMsgSink(.RST(RST_N), .CLK(CLK),
         .D_IN(requests_0_message_enq_v), .ENQ(EN_requests_0_message_enq),
         .DEQ(WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessage ||
         ILL_FIRE_RL_lEchoRequestInputNoc_receiveMessageHeader), .CLR(0),
         .D_OUT(lEchoRequestInputNoc_fifoMsgSink_D_OUT), .FULL_N(lEchoRequestInputNoc_fifoMsgSink_FULL_N),
         .EMPTY_N(lEchoRequestInputNoc_fifoMsgSink_EMPTY_N));

  SizedFIFO #(.p1width(32'd32), .p2depth(32'd8), .p3cntr_width(32'd3), .guarded(32'd1)) lEcho_delay(
      .RST(RST_N), .CLK(CLK), .D_IN(lEchoRequestInput_pipes_say_PipeOut_first),
      .ENQ(lEchoRequestInput_RDY_pipes_say_PipeOut_first && lEchoRequestInput_RDY_pipes_say_PipeOut_deq && lEcho_delay_FULL_N),
      .DEQ(lEchoIndicationOutput_RDY_ifc_heard && lEcho_delay_EMPTY_N), .CLR(0), .D_OUT(lEcho_delay_D_OUT),
      .FULL_N(lEcho_delay_FULL_N), .EMPTY_N(lEcho_delay_EMPTY_N));

  SizedFIFO #(.p1width(32'd32), .p2depth(32'd8), .p3cntr_width(32'd3), .guarded(32'd1)) lEcho_delay2(
      .RST(RST_N), .CLK(CLK), .D_IN(lEchoRequestInput_pipes_say2_PipeOut_first),
      .ENQ(lEchoRequestInput_RDY_pipes_say2_PipeOut_first && lEchoRequestInput_RDY_pipes_say2_PipeOut_deq && lEcho_delay2_FULL_N),
      .DEQ(lEchoIndicationOutput_RDY_ifc_heard2 && lEcho_delay2_EMPTY_N), .CLR(0), .D_OUT(lEcho_delay2_D_OUT),
      .FULL_N(lEcho_delay2_FULL_N), .EMPTY_N(lEcho_delay2_EMPTY_N));

  assign requests_0_id = 32'd6;
  assign RDY_requests_0_id = 1'd1;
  assign RDY_requests_0_message_enq = lEchoRequestInputNoc_fifoMsgSink_FULL_N;
  assign requests_0_message_notFull = lEchoRequestInputNoc_fifoMsgSink_FULL_N;
  assign RDY_requests_0_message_notFull = 1'd1;
  assign indications_0_id = 32'd5;
  assign RDY_indications_0_id = 1'd1;
  assign RDY_indications_0_message_first = lEchoIndicationOutputNoc_fifoMsgSource_EMPTY_N;
  assign RDY_indications_0_message_deq = lEchoIndicationOutputNoc_fifoMsgSource_EMPTY_N;
  assign indications_0_message_notEmpty = lEchoIndicationOutputNoc_fifoMsgSource_EMPTY_N;
  assign RDY_indications_0_message_notEmpty = 1'd1;
  assign WILL_FIRE_RL_lEchoIndicationOutputNoc_sendHeader = lEchoIndicationOutputNoc_fifoMsgSource_FULL_N && !lEchoIndicationOutputNoc_bpState && (lEchoIndicationOutput_portalIfc_indications_0_notEmpty || lEchoIndicationOutput_portalIfc_indications_1_notEmpty);
  assign WILL_FIRE_RL_lEchoIndicationOutputNoc_sendMessage = lEchoIndicationOutputNoc_fifoMsgSource_FULL_N &&
         CASE_lEchoIndicationOutputNoc_methodIdReg_0_lE_ETC__q1 && CASE_lEchoIndicationOutputNoc_methodIdReg_0_lE_ETC__q2 && lEchoIndicationOutputNoc_bpState;
  assign ILL_FIRE_RL_lEchoRequestInputNoc_receiveMessageHeader = lEchoRequestInputNoc_fifoMsgSink_EMPTY_N && !lEchoRequestInputNoc_bpState;
  assign WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessage = (lEchoRequestInputNoc_fifoMsgSink_EMPTY_N && CASE_lEchoRequestInputNoc_methodIdReg_0_lEchoR_ETC__q3) && lEchoRequestInputNoc_bpState;
  assign _theResult____h1942 = (lEchoRequestInputNoc_fifoMsgSink_D_OUT[7:0] == 8'd1) ?
           lEchoRequestInputNoc_fifoMsgSink_D_OUT[7:0] : (lEchoRequestInputNoc_fifoMsgSink_D_OUT[7:0] - 8'd1);
  assign roundup__h1335 = (lEchoIndicationOutput_portalIfc_messageSize_size[4:0] == 5'd0) ?  16'd0 : 16'd1;
  assign numWords__h1336 = { 5'd0, lEchoIndicationOutput_portalIfc_messageSize_size[15:5] } + roundup__h1335;
  assign readyChannel__h1054 = lEchoIndicationOutput_portalIfc_indications_0_notEmpty ?  8'd0 :
           (lEchoIndicationOutput_portalIfc_indications_1_notEmpty ?  8'd1 : 8'd255);
  assign methodNumber__h1378 = { 8'd0, readyChannel__h1054 };

  always@(lEchoIndicationOutputNoc_methodIdReg or lEchoIndicationOutput_portalIfc_indications_0_first or lEchoIndicationOutput_portalIfc_indications_1_first)
  begin
  case (lEchoIndicationOutputNoc_methodIdReg)
  8'd0: MUX_lEchoIndicationOutputNoc_fifoMsgSource_enq_1__VAL_2 = lEchoIndicationOutput_portalIfc_indications_0_first;
  8'd1: MUX_lEchoIndicationOutputNoc_fifoMsgSource_enq_1__VAL_2 = lEchoIndicationOutput_portalIfc_indications_1_first;
  default: MUX_lEchoIndicationOutputNoc_fifoMsgSource_enq_1__VAL_2 = 32'hAAAAAAAA /* unspecified value */;
  endcase
  end

  always@(lEchoIndicationOutputNoc_methodIdReg or lEchoIndicationOutput_RDY_portalIfc_indications_0_deq or lEchoIndicationOutput_RDY_portalIfc_indications_1_deq)
  begin
  case (lEchoIndicationOutputNoc_methodIdReg)
  8'd0: CASE_lEchoIndicationOutputNoc_methodIdReg_0_lE_ETC__q1 = lEchoIndicationOutput_RDY_portalIfc_indications_0_deq;
  8'd1: CASE_lEchoIndicationOutputNoc_methodIdReg_0_lE_ETC__q1 = lEchoIndicationOutput_RDY_portalIfc_indications_1_deq;
  default: CASE_lEchoIndicationOutputNoc_methodIdReg_0_lE_ETC__q1 = 1'd1;
  endcase
  end
  always@(lEchoIndicationOutputNoc_methodIdReg or lEchoIndicationOutput_RDY_portalIfc_indications_0_first or lEchoIndicationOutput_RDY_portalIfc_indications_1_first)
  begin
  case (lEchoIndicationOutputNoc_methodIdReg)
  8'd0: CASE_lEchoIndicationOutputNoc_methodIdReg_0_lE_ETC__q2 = lEchoIndicationOutput_RDY_portalIfc_indications_0_first;
  8'd1: CASE_lEchoIndicationOutputNoc_methodIdReg_0_lE_ETC__q2 = lEchoIndicationOutput_RDY_portalIfc_indications_1_first;
  default: CASE_lEchoIndicationOutputNoc_methodIdReg_0_lE_ETC__q2 = 1'd1;
  endcase
  end
  always@(lEchoRequestInputNoc_methodIdReg or lEchoRequestInput_RDY_portalIfc_requests_0_enq or
      lEchoRequestInput_RDY_portalIfc_requests_1_enq or lEchoRequestInput_RDY_portalIfc_requests_2_enq)
  begin
  case (lEchoRequestInputNoc_methodIdReg)
  8'd0: CASE_lEchoRequestInputNoc_methodIdReg_0_lEchoR_ETC__q3 = lEchoRequestInput_RDY_portalIfc_requests_0_enq;
  8'd1: CASE_lEchoRequestInputNoc_methodIdReg_0_lEchoR_ETC__q3 = lEchoRequestInput_RDY_portalIfc_requests_1_enq;
  8'd2: CASE_lEchoRequestInputNoc_methodIdReg_0_lEchoR_ETC__q3 = lEchoRequestInput_RDY_portalIfc_requests_2_enq;
  default: CASE_lEchoRequestInputNoc_methodIdReg_0_lEchoR_ETC__q3 = 1'd1;
  endcase
  end
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        lEchoIndicationOutputNoc_bpState <= 1'd0;
        lEchoIndicationOutputNoc_messageWordsReg <= 16'd0;
        lEchoIndicationOutputNoc_methodIdReg <= 8'd0;
        lEchoRequestInputNoc_bpState <= 1'd0;
        lEchoRequestInputNoc_messageWordsReg <= 8'd0;
        lEchoRequestInputNoc_methodIdReg <= 8'd0;
      end
    else
      begin
        if (WILL_FIRE_RL_lEchoIndicationOutputNoc_sendMessage && lEchoIndicationOutputNoc_messageWordsReg == 16'd1 || WILL_FIRE_RL_lEchoIndicationOutputNoc_sendHeader)
          lEchoIndicationOutputNoc_bpState <= !(WILL_FIRE_RL_lEchoIndicationOutputNoc_sendMessage && lEchoIndicationOutputNoc_messageWordsReg == 16'd1);
        if (WILL_FIRE_RL_lEchoIndicationOutputNoc_sendHeader || WILL_FIRE_RL_lEchoIndicationOutputNoc_sendMessage)
          lEchoIndicationOutputNoc_messageWordsReg <= WILL_FIRE_RL_lEchoIndicationOutputNoc_sendHeader ?  numWords__h1336 : (lEchoIndicationOutputNoc_messageWordsReg - 16'd1);
        if (WILL_FIRE_RL_lEchoIndicationOutputNoc_sendHeader)
          lEchoIndicationOutputNoc_methodIdReg <= readyChannel__h1054;
        if (ILL_FIRE_RL_lEchoRequestInputNoc_receiveMessageHeader && _theResult____h1942 != 8'd0 || WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessage && lEchoRequestInputNoc_messageWordsReg == 8'd1)
          lEchoRequestInputNoc_bpState <= ILL_FIRE_RL_lEchoRequestInputNoc_receiveMessageHeader && _theResult____h1942 != 8'd0;
        if (ILL_FIRE_RL_lEchoRequestInputNoc_receiveMessageHeader || WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessage)
          lEchoRequestInputNoc_messageWordsReg <= ILL_FIRE_RL_lEchoRequestInputNoc_receiveMessageHeader ?  _theResult____h1942 : (lEchoRequestInputNoc_messageWordsReg - 8'd1);
        if (ILL_FIRE_RL_lEchoRequestInputNoc_receiveMessageHeader)
          lEchoRequestInputNoc_methodIdReg <= lEchoRequestInputNoc_fifoMsgSink_D_OUT[23:16];
      end
  end
  initial
  begin
    lEchoIndicationOutputNoc_bpState = 1'h0;
    lEchoIndicationOutputNoc_messageWordsReg = 16'hAAAA;
    lEchoIndicationOutputNoc_methodIdReg = 8'hAA;
    lEchoRequestInputNoc_bpState = 1'h0;
    lEchoRequestInputNoc_messageWordsReg = 8'hAA;
    lEchoRequestInputNoc_methodIdReg = 8'hAA;
  end
endmodule  // mkCnocTop
