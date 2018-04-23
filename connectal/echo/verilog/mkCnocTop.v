`define BSV_RESET_VALUE 1'b0
`define BSV_RESET_EDGE negedge
module mkCnocTop(CLK, RST_N,
         requests_0_id, RDY_requests_0_id,
         requests_0_message_enq_v, EN_requests_0_message_enq, RDY_requests_0_message_enq,
         requests_0_message_notFull, RDY_requests_0_message_notFull,
         indications_0_id, RDY_indications_0_id, indications_0_message_first, RDY_indications_0_message_first,
         EN_indications_0_message_deq, RDY_indications_0_message_deq,
         indications_0_message_notEmpty, RDY_indications_0_message_notEmpty);
  input  CLK;
  input  RST_N;
  output [31 : 0] requests_0_id; output RDY_requests_0_id;
  input  [31 : 0] requests_0_message_enq_v; input  EN_requests_0_message_enq; output RDY_requests_0_message_enq;
  output requests_0_message_notFull; output RDY_requests_0_message_notFull;
  output [31 : 0] indications_0_id; output RDY_indications_0_id;
  output [31 : 0] indications_0_message_first; output RDY_indications_0_message_first;
  input  EN_indications_0_message_deq; output RDY_indications_0_message_deq;
  output indications_0_message_notEmpty; output RDY_indications_0_message_notEmpty;
  wire [31 : 0] indications_0_id, indications_0_message_first, requests_0_id;
  wire RDY_indications_0_id, RDY_indications_0_message_deq, RDY_indications_0_message_first, RDY_indications_0_message_notEmpty,
       RDY_requests_0_id, RDY_requests_0_message_enq, RDY_requests_0_message_notFull,
       indications_0_message_notEmpty, requests_0_message_notFull;
  reg lEchoIndicationOutputNoc_bpState;
  wire lEchoIndicationOutputNoc_bpState_D_IN,
       lEchoIndicationOutputNoc_bpState_EN;
  reg [15 : 0] lEchoIndicationOutputNoc_messageWordsReg;
  wire [15 : 0] lEchoIndicationOutputNoc_messageWordsReg_D_IN;
  wire lEchoIndicationOutputNoc_messageWordsReg_EN;
  reg [7 : 0] lEchoIndicationOutputNoc_methodIdReg;
  wire [7 : 0] lEchoIndicationOutputNoc_methodIdReg_D_IN;
  wire lEchoIndicationOutputNoc_methodIdReg_EN;
  reg lEchoRequestInputNoc_bpState;
  wire lEchoRequestInputNoc_bpState_D_IN, lEchoRequestInputNoc_bpState_EN;
  reg [7 : 0] lEchoRequestInputNoc_messageWordsReg;
  wire [7 : 0] lEchoRequestInputNoc_messageWordsReg_D_IN;
  wire lEchoRequestInputNoc_messageWordsReg_EN;
  reg [7 : 0] lEchoRequestInputNoc_methodIdReg;
  wire [7 : 0] lEchoRequestInputNoc_methodIdReg_D_IN;
  wire lEchoRequestInputNoc_methodIdReg_EN;
  wire [31 : 0] lEchoIndicationOutput_ifc_heard_v,
        lEchoIndicationOutput_portalIfc_indications_0_first,
        lEchoIndicationOutput_portalIfc_indications_1_first;
  wire [15 : 0] lEchoIndicationOutput_ifc_heard2_a,
        lEchoIndicationOutput_ifc_heard2_b,
        lEchoIndicationOutput_portalIfc_messageSize_size,
        lEchoIndicationOutput_portalIfc_messageSize_size_methodNumber;
  wire lEchoIndicationOutput_EN_ifc_heard, lEchoIndicationOutput_EN_ifc_heard2,
       lEchoIndicationOutput_EN_portalIfc_indications_0_deq, lEchoIndicationOutput_EN_portalIfc_indications_1_deq,
       lEchoIndicationOutput_RDY_ifc_heard, lEchoIndicationOutput_RDY_ifc_heard2,
       lEchoIndicationOutput_RDY_portalIfc_indications_0_deq, lEchoIndicationOutput_RDY_portalIfc_indications_0_first,
       lEchoIndicationOutput_RDY_portalIfc_indications_1_deq, lEchoIndicationOutput_RDY_portalIfc_indications_1_first,
       lEchoIndicationOutput_portalIfc_indications_0_notEmpty, lEchoIndicationOutput_portalIfc_indications_1_notEmpty;
  wire [31 : 0] lEchoIndicationOutputNoc_fifoMsgSource_D_IN, lEchoIndicationOutputNoc_fifoMsgSource_D_OUT;
  wire lEchoIndicationOutputNoc_fifoMsgSource_DEQ, lEchoIndicationOutputNoc_fifoMsgSource_EMPTY_N,
       lEchoIndicationOutputNoc_fifoMsgSource_ENQ, lEchoIndicationOutputNoc_fifoMsgSource_FULL_N;
  wire [31 : 0] lEchoRequestInput_pipes_say2_PipeOut_first, lEchoRequestInput_pipes_say_PipeOut_first,
        lEchoRequestInput_portalIfc_requests_0_enq_v, lEchoRequestInput_portalIfc_requests_1_enq_v,
        lEchoRequestInput_portalIfc_requests_2_enq_v;
  wire lEchoRequestInput_EN_pipes_say2_PipeOut_deq, lEchoRequestInput_EN_pipes_say_PipeOut_deq,
       lEchoRequestInput_EN_pipes_setLeds_PipeOut_deq, lEchoRequestInput_EN_portalIfc_requests_0_enq,
       lEchoRequestInput_EN_portalIfc_requests_1_enq, lEchoRequestInput_EN_portalIfc_requests_2_enq,
       lEchoRequestInput_RDY_pipes_say2_PipeOut_deq, lEchoRequestInput_RDY_pipes_say2_PipeOut_first,
       lEchoRequestInput_RDY_pipes_say_PipeOut_deq, lEchoRequestInput_RDY_pipes_say_PipeOut_first,
       lEchoRequestInput_RDY_pipes_setLeds_PipeOut_deq, lEchoRequestInput_RDY_portalIfc_requests_0_enq,
       lEchoRequestInput_RDY_portalIfc_requests_1_enq, lEchoRequestInput_RDY_portalIfc_requests_2_enq;
  wire [31 : 0] lEchoRequestInputNoc_fifoMsgSink_D_IN, lEchoRequestInputNoc_fifoMsgSink_D_OUT;
  wire lEchoRequestInputNoc_fifoMsgSink_DEQ, lEchoRequestInputNoc_fifoMsgSink_EMPTY_N,
       lEchoRequestInputNoc_fifoMsgSink_ENQ, lEchoRequestInputNoc_fifoMsgSink_FULL_N;
  wire [31 : 0] lEcho_delay_D_IN, lEcho_delay_D_OUT;
  wire lEcho_delay_DEQ, lEcho_delay_EMPTY_N, lEcho_delay_ENQ, lEcho_delay_FULL_N;
  wire [31 : 0] lEcho_delay2_D_IN, lEcho_delay2_D_OUT;
  wire lEcho_delay2_DEQ, lEcho_delay2_EMPTY_N, lEcho_delay2_ENQ, lEcho_delay2_FULL_N;
  wire WILL_FIRE_RL_lEchoIndicationOutputNoc_sendHeader, WILL_FIRE_RL_lEchoIndicationOutputNoc_sendMessage,
       WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessage, WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessageHeader;
  reg [31 : 0] MUX_lEchoIndicationOutputNoc_fifoMsgSource_enq_1__VAL_2;
  wire [31 : 0] MUX_lEchoIndicationOutputNoc_fifoMsgSource_enq_1__VAL_1;
  wire [15 : 0] MUX_lEchoIndicationOutputNoc_messageWordsReg_write_1__VAL_2;
  wire [7 : 0] MUX_lEchoRequestInputNoc_messageWordsReg_write_1__VAL_2;
  wire MUX_lEchoIndicationOutputNoc_bpState_write_1__SEL_1, MUX_lEchoRequestInputNoc_bpState_write_1__SEL_1;
  reg CASE_lEchoIndicationOutputNoc_methodIdReg_0_lE_ETC__q1,
      CASE_lEchoIndicationOutputNoc_methodIdReg_0_lE_ETC__q2,
      CASE_lEchoRequestInputNoc_methodIdReg_0_lEchoR_ETC__q3;
  wire [15 : 0] methodNumber__h1378, numWords__h1336, roundup__h1335, x__h1485;
  wire [7 : 0] _theResult____h1942, messageWords__h1941, readyChannel__h1054;
  wire CASE_lEchoIndicationOutputNoc_methodIdReg_4_0__ETC___d51, lEchoRequestInputNoc_fifoMsgSink_i_notEmpty__3_ETC___d80;
  assign requests_0_id = 32'd6;
  assign RDY_requests_0_id = 1'd1;
  assign RDY_requests_0_message_enq = lEchoRequestInputNoc_fifoMsgSink_FULL_N;
  assign requests_0_message_notFull = lEchoRequestInputNoc_fifoMsgSink_FULL_N;
  assign RDY_requests_0_message_notFull = 1'd1;
  assign indications_0_id = 32'd5;
  assign RDY_indications_0_id = 1'd1;
  assign indications_0_message_first = lEchoIndicationOutputNoc_fifoMsgSource_D_OUT;
  assign RDY_indications_0_message_first = lEchoIndicationOutputNoc_fifoMsgSource_EMPTY_N;
  assign RDY_indications_0_message_deq = lEchoIndicationOutputNoc_fifoMsgSource_EMPTY_N;
  assign indications_0_message_notEmpty = lEchoIndicationOutputNoc_fifoMsgSource_EMPTY_N;
  assign RDY_indications_0_message_notEmpty = 1'd1;
  mkEchoIndicationOutput lEchoIndicationOutput(.CLK(CLK), .RST_N(RST_N),
    .ifc_heard2_a(lEchoIndicationOutput_ifc_heard2_a), .ifc_heard2_b(lEchoIndicationOutput_ifc_heard2_b),
    .ifc_heard_v(lEchoIndicationOutput_ifc_heard_v),
    .portalIfc_messageSize_size_methodNumber(lEchoIndicationOutput_portalIfc_messageSize_size_methodNumber),
    .EN_portalIfc_indications_0_deq(lEchoIndicationOutput_EN_portalIfc_indications_0_deq),
    .EN_portalIfc_indications_1_deq(lEchoIndicationOutput_EN_portalIfc_indications_1_deq),
    .EN_ifc_heard(lEchoIndicationOutput_EN_ifc_heard), .EN_ifc_heard2(lEchoIndicationOutput_EN_ifc_heard2),
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
    .RDY_ifc_heard(lEchoIndicationOutput_RDY_ifc_heard),
    .RDY_ifc_heard2(lEchoIndicationOutput_RDY_ifc_heard2));
  FIFO2 #(.width(32'd32), .guarded(32'd1)) lEchoIndicationOutputNoc_fifoMsgSource(.RST(RST_N),
           .CLK(CLK), .D_IN(lEchoIndicationOutputNoc_fifoMsgSource_D_IN),
           .ENQ(lEchoIndicationOutputNoc_fifoMsgSource_ENQ),
           .DEQ(lEchoIndicationOutputNoc_fifoMsgSource_DEQ), .CLR(0),
           .D_OUT(lEchoIndicationOutputNoc_fifoMsgSource_D_OUT),
           .FULL_N(lEchoIndicationOutputNoc_fifoMsgSource_FULL_N),
           .EMPTY_N(lEchoIndicationOutputNoc_fifoMsgSource_EMPTY_N));
  mkEchoRequestInput lEchoRequestInput(.CLK(CLK), .RST_N(RST_N),
      .portalIfc_messageSize_size_methodNumber(0),
      .portalIfc_requests_0_enq_v(lEchoRequestInput_portalIfc_requests_0_enq_v),
      .portalIfc_requests_1_enq_v(lEchoRequestInput_portalIfc_requests_1_enq_v),
      .portalIfc_requests_2_enq_v(lEchoRequestInput_portalIfc_requests_2_enq_v),
      .EN_portalIfc_requests_0_enq(lEchoRequestInput_EN_portalIfc_requests_0_enq),
      .EN_portalIfc_requests_1_enq(lEchoRequestInput_EN_portalIfc_requests_1_enq),
      .EN_portalIfc_requests_2_enq(lEchoRequestInput_EN_portalIfc_requests_2_enq),
      .EN_pipes_say_PipeOut_deq(lEchoRequestInput_EN_pipes_say_PipeOut_deq),
      .EN_pipes_say2_PipeOut_deq(lEchoRequestInput_EN_pipes_say2_PipeOut_deq),
      .EN_pipes_setLeds_PipeOut_deq(lEchoRequestInput_EN_pipes_setLeds_PipeOut_deq),
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
         .D_IN(lEchoRequestInputNoc_fifoMsgSink_D_IN), .ENQ(lEchoRequestInputNoc_fifoMsgSink_ENQ),
         .DEQ(lEchoRequestInputNoc_fifoMsgSink_DEQ), .CLR(0),
         .D_OUT(lEchoRequestInputNoc_fifoMsgSink_D_OUT), .FULL_N(lEchoRequestInputNoc_fifoMsgSink_FULL_N),
         .EMPTY_N(lEchoRequestInputNoc_fifoMsgSink_EMPTY_N));
  SizedFIFO #(.p1width(32'd32), .p2depth(32'd8), .p3cntr_width(32'd3),
          .guarded(32'd1)) lEcho_delay(.RST(RST_N), .CLK(CLK), .D_IN(lEcho_delay_D_IN), .ENQ(lEcho_delay_ENQ),
      .DEQ(lEcho_delay_DEQ), .CLR(0), .D_OUT(lEcho_delay_D_OUT),
      .FULL_N(lEcho_delay_FULL_N), .EMPTY_N(lEcho_delay_EMPTY_N));
  SizedFIFO #(.p1width(32'd32), .p2depth(32'd8), .p3cntr_width(32'd3),
          .guarded(32'd1)) lEcho_delay2(.RST(RST_N), .CLK(CLK), .D_IN(lEcho_delay2_D_IN), .ENQ(lEcho_delay2_ENQ),
       .DEQ(lEcho_delay2_DEQ), .CLR(0), .D_OUT(lEcho_delay2_D_OUT),
       .FULL_N(lEcho_delay2_FULL_N), .EMPTY_N(lEcho_delay2_EMPTY_N));
  assign WILL_FIRE_RL_lEchoIndicationOutputNoc_sendHeader = lEchoIndicationOutputNoc_fifoMsgSource_FULL_N && !lEchoIndicationOutputNoc_bpState &&
         (lEchoIndicationOutput_portalIfc_indications_0_notEmpty ||
          lEchoIndicationOutput_portalIfc_indications_1_notEmpty);
  assign WILL_FIRE_RL_lEchoIndicationOutputNoc_sendMessage = lEchoIndicationOutputNoc_fifoMsgSource_FULL_N &&
         CASE_lEchoIndicationOutputNoc_methodIdReg_4_0__ETC___d51 && lEchoIndicationOutputNoc_bpState;
  assign WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessageHeader = lEchoRequestInputNoc_fifoMsgSink_EMPTY_N && !lEchoRequestInputNoc_bpState;
  assign WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessage = lEchoRequestInputNoc_fifoMsgSink_i_notEmpty__3_ETC___d80 && lEchoRequestInputNoc_bpState;
  assign MUX_lEchoIndicationOutputNoc_bpState_write_1__SEL_1 = WILL_FIRE_RL_lEchoIndicationOutputNoc_sendMessage && lEchoIndicationOutputNoc_messageWordsReg == 16'd1;
  assign MUX_lEchoRequestInputNoc_bpState_write_1__SEL_1 = WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessageHeader && _theResult____h1942 != 8'd0;
  assign MUX_lEchoIndicationOutputNoc_fifoMsgSource_enq_1__VAL_1 = { methodNumber__h1378, x__h1485 };
  always@(lEchoIndicationOutputNoc_methodIdReg or lEchoIndicationOutput_portalIfc_indications_0_first or
      lEchoIndicationOutput_portalIfc_indications_1_first)
  begin
    case (lEchoIndicationOutputNoc_methodIdReg)
      8'd0: MUX_lEchoIndicationOutputNoc_fifoMsgSource_enq_1__VAL_2 = lEchoIndicationOutput_portalIfc_indications_0_first;
      8'd1: MUX_lEchoIndicationOutputNoc_fifoMsgSource_enq_1__VAL_2 = lEchoIndicationOutput_portalIfc_indications_1_first;
      default: MUX_lEchoIndicationOutputNoc_fifoMsgSource_enq_1__VAL_2 = 32'hAAAAAAAA /* unspecified value */;
    endcase
  end
  assign MUX_lEchoIndicationOutputNoc_messageWordsReg_write_1__VAL_2 = lEchoIndicationOutputNoc_messageWordsReg - 16'd1;
  assign MUX_lEchoRequestInputNoc_messageWordsReg_write_1__VAL_2 = lEchoRequestInputNoc_messageWordsReg - 8'd1;
  assign lEchoIndicationOutputNoc_bpState_D_IN = !MUX_lEchoIndicationOutputNoc_bpState_write_1__SEL_1;
  assign lEchoIndicationOutputNoc_bpState_EN = WILL_FIRE_RL_lEchoIndicationOutputNoc_sendMessage &&
         lEchoIndicationOutputNoc_messageWordsReg == 16'd1 ||
         WILL_FIRE_RL_lEchoIndicationOutputNoc_sendHeader;
  assign lEchoIndicationOutputNoc_messageWordsReg_D_IN = WILL_FIRE_RL_lEchoIndicationOutputNoc_sendHeader ?  numWords__h1336 :
           MUX_lEchoIndicationOutputNoc_messageWordsReg_write_1__VAL_2;
  assign lEchoIndicationOutputNoc_messageWordsReg_EN = WILL_FIRE_RL_lEchoIndicationOutputNoc_sendHeader ||
         WILL_FIRE_RL_lEchoIndicationOutputNoc_sendMessage;
  assign lEchoIndicationOutputNoc_methodIdReg_D_IN = readyChannel__h1054;
  assign lEchoIndicationOutputNoc_methodIdReg_EN = WILL_FIRE_RL_lEchoIndicationOutputNoc_sendHeader;
  assign lEchoRequestInputNoc_bpState_D_IN = MUX_lEchoRequestInputNoc_bpState_write_1__SEL_1;
  assign lEchoRequestInputNoc_bpState_EN = WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessageHeader &&
         _theResult____h1942 != 8'd0 || WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessage &&
         lEchoRequestInputNoc_messageWordsReg == 8'd1;
  assign lEchoRequestInputNoc_messageWordsReg_D_IN = WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessageHeader ?  _theResult____h1942 :
           MUX_lEchoRequestInputNoc_messageWordsReg_write_1__VAL_2;
  assign lEchoRequestInputNoc_messageWordsReg_EN = WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessageHeader ||
         WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessage;
  assign lEchoRequestInputNoc_methodIdReg_D_IN = lEchoRequestInputNoc_fifoMsgSink_D_OUT[23:16];
  assign lEchoRequestInputNoc_methodIdReg_EN = WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessageHeader;
  assign lEchoIndicationOutput_ifc_heard2_a = lEcho_delay2_D_OUT[15:0];
  assign lEchoIndicationOutput_ifc_heard2_b = lEcho_delay2_D_OUT[31:16];
  assign lEchoIndicationOutput_ifc_heard_v = lEcho_delay_D_OUT;
  assign lEchoIndicationOutput_portalIfc_messageSize_size_methodNumber = methodNumber__h1378;
  assign lEchoIndicationOutput_EN_portalIfc_indications_0_deq = WILL_FIRE_RL_lEchoIndicationOutputNoc_sendMessage &&
         lEchoIndicationOutputNoc_methodIdReg == 8'd0;
  assign lEchoIndicationOutput_EN_portalIfc_indications_1_deq = WILL_FIRE_RL_lEchoIndicationOutputNoc_sendMessage && lEchoIndicationOutputNoc_methodIdReg == 8'd1;
  assign lEchoIndicationOutput_EN_ifc_heard = lEchoIndicationOutput_RDY_ifc_heard && lEcho_delay_EMPTY_N;
  assign lEchoIndicationOutput_EN_ifc_heard2 = lEchoIndicationOutput_RDY_ifc_heard2 && lEcho_delay2_EMPTY_N;
  assign lEchoIndicationOutputNoc_fifoMsgSource_D_IN = WILL_FIRE_RL_lEchoIndicationOutputNoc_sendHeader ?
           MUX_lEchoIndicationOutputNoc_fifoMsgSource_enq_1__VAL_1 :
           MUX_lEchoIndicationOutputNoc_fifoMsgSource_enq_1__VAL_2;
  assign lEchoIndicationOutputNoc_fifoMsgSource_ENQ = WILL_FIRE_RL_lEchoIndicationOutputNoc_sendHeader ||
         WILL_FIRE_RL_lEchoIndicationOutputNoc_sendMessage;
  assign lEchoIndicationOutputNoc_fifoMsgSource_DEQ = EN_indications_0_message_deq;
  assign lEchoRequestInput_portalIfc_requests_0_enq_v = lEchoRequestInputNoc_fifoMsgSink_D_OUT;
  assign lEchoRequestInput_portalIfc_requests_1_enq_v = lEchoRequestInputNoc_fifoMsgSink_D_OUT;
  assign lEchoRequestInput_portalIfc_requests_2_enq_v = lEchoRequestInputNoc_fifoMsgSink_D_OUT;
  assign lEchoRequestInput_EN_portalIfc_requests_0_enq = WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessage && lEchoRequestInputNoc_methodIdReg == 8'd0;
  assign lEchoRequestInput_EN_portalIfc_requests_1_enq = WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessage && lEchoRequestInputNoc_methodIdReg == 8'd1;
  assign lEchoRequestInput_EN_portalIfc_requests_2_enq = WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessage && lEchoRequestInputNoc_methodIdReg == 8'd2;
  assign lEchoRequestInput_EN_pipes_say_PipeOut_deq = lEchoRequestInput_RDY_pipes_say_PipeOut_first &&
         lEchoRequestInput_RDY_pipes_say_PipeOut_deq && lEcho_delay_FULL_N;
  assign lEchoRequestInput_EN_pipes_say2_PipeOut_deq = lEchoRequestInput_RDY_pipes_say2_PipeOut_first &&
         lEchoRequestInput_RDY_pipes_say2_PipeOut_deq && lEcho_delay2_FULL_N;
  assign lEchoRequestInput_EN_pipes_setLeds_PipeOut_deq = lEchoRequestInput_RDY_pipes_setLeds_PipeOut_deq;
  assign lEchoRequestInputNoc_fifoMsgSink_D_IN = requests_0_message_enq_v;
  assign lEchoRequestInputNoc_fifoMsgSink_ENQ = EN_requests_0_message_enq;
  assign lEchoRequestInputNoc_fifoMsgSink_DEQ = WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessage ||
         WILL_FIRE_RL_lEchoRequestInputNoc_receiveMessageHeader;
  assign lEcho_delay_D_IN = lEchoRequestInput_pipes_say_PipeOut_first;
  assign lEcho_delay_ENQ = lEchoRequestInput_RDY_pipes_say_PipeOut_first &&
         lEchoRequestInput_RDY_pipes_say_PipeOut_deq && lEcho_delay_FULL_N;
  assign lEcho_delay_DEQ = lEchoIndicationOutput_RDY_ifc_heard && lEcho_delay_EMPTY_N;
  assign lEcho_delay2_D_IN = lEchoRequestInput_pipes_say2_PipeOut_first;
  assign lEcho_delay2_ENQ = lEchoRequestInput_RDY_pipes_say2_PipeOut_first &&
         lEchoRequestInput_RDY_pipes_say2_PipeOut_deq && lEcho_delay2_FULL_N;
  assign lEcho_delay2_DEQ = lEchoIndicationOutput_RDY_ifc_heard2 && lEcho_delay2_EMPTY_N;
  assign CASE_lEchoIndicationOutputNoc_methodIdReg_4_0__ETC___d51 = CASE_lEchoIndicationOutputNoc_methodIdReg_0_lE_ETC__q1 &&
         CASE_lEchoIndicationOutputNoc_methodIdReg_0_lE_ETC__q2;
  assign _theResult____h1942 = (lEchoRequestInputNoc_fifoMsgSink_D_OUT[7:0] == 8'd1) ?
           lEchoRequestInputNoc_fifoMsgSink_D_OUT[7:0] : messageWords__h1941;
  assign lEchoRequestInputNoc_fifoMsgSink_i_notEmpty__3_ETC___d80 = lEchoRequestInputNoc_fifoMsgSink_EMPTY_N && CASE_lEchoRequestInputNoc_methodIdReg_0_lEchoR_ETC__q3;
  assign messageWords__h1941 = lEchoRequestInputNoc_fifoMsgSink_D_OUT[7:0] - 8'd1;
  assign methodNumber__h1378 = { 8'd0, readyChannel__h1054 };
  assign numWords__h1336 = { 5'd0, lEchoIndicationOutput_portalIfc_messageSize_size[15:5] } + roundup__h1335;
  assign readyChannel__h1054 = lEchoIndicationOutput_portalIfc_indications_0_notEmpty ?  8'd0 :
           (lEchoIndicationOutput_portalIfc_indications_1_notEmpty ?  8'd1 : 8'd255);
  assign roundup__h1335 = (lEchoIndicationOutput_portalIfc_messageSize_size[4:0] == 5'd0) ?  16'd0 : 16'd1;
  assign x__h1485 = numWords__h1336 + 16'd1;
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
        if (lEchoIndicationOutputNoc_bpState_EN)
      lEchoIndicationOutputNoc_bpState <= lEchoIndicationOutputNoc_bpState_D_IN;
    if (lEchoIndicationOutputNoc_messageWordsReg_EN)
      lEchoIndicationOutputNoc_messageWordsReg <= lEchoIndicationOutputNoc_messageWordsReg_D_IN;
    if (lEchoIndicationOutputNoc_methodIdReg_EN)
      lEchoIndicationOutputNoc_methodIdReg <= lEchoIndicationOutputNoc_methodIdReg_D_IN;
    if (lEchoRequestInputNoc_bpState_EN)
      lEchoRequestInputNoc_bpState <= lEchoRequestInputNoc_bpState_D_IN;
    if (lEchoRequestInputNoc_messageWordsReg_EN)
      lEchoRequestInputNoc_messageWordsReg <= lEchoRequestInputNoc_messageWordsReg_D_IN;
    if (lEchoRequestInputNoc_methodIdReg_EN)
      lEchoRequestInputNoc_methodIdReg <= lEchoRequestInputNoc_methodIdReg_D_IN;
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
