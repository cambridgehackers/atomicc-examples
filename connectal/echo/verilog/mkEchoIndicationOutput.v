`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif
module mkEchoIndicationOutput(CLK, RST_N,
            portalIfc_messageSize_size_methodNumber,
            portalIfc_messageSize_size,
            RDY_portalIfc_messageSize_size,
            portalIfc_indications_0_first,
            RDY_portalIfc_indications_0_first,
            EN_portalIfc_indications_0_deq,
            RDY_portalIfc_indications_0_deq,
            portalIfc_indications_0_notEmpty,
            RDY_portalIfc_indications_0_notEmpty,
            portalIfc_indications_1_first,
            RDY_portalIfc_indications_1_first,
            EN_portalIfc_indications_1_deq,
            RDY_portalIfc_indications_1_deq,
            portalIfc_indications_1_notEmpty,
            RDY_portalIfc_indications_1_notEmpty,
            portalIfc_intr_status,
            RDY_portalIfc_intr_status,
            portalIfc_intr_channel,
            RDY_portalIfc_intr_channel,
            ifc_heard_v,
            EN_ifc_heard,
            RDY_ifc_heard,
            ifc_heard2_a,
            ifc_heard2_b,
            EN_ifc_heard2,
            RDY_ifc_heard2);
  input  CLK;
  input  RST_N;
  input  [15 : 0] portalIfc_messageSize_size_methodNumber;
  output [15 : 0] portalIfc_messageSize_size;
  output RDY_portalIfc_messageSize_size;
  output [31 : 0] portalIfc_indications_0_first;
  output RDY_portalIfc_indications_0_first;
  input  EN_portalIfc_indications_0_deq;
  output RDY_portalIfc_indications_0_deq;
  output portalIfc_indications_0_notEmpty;
  output RDY_portalIfc_indications_0_notEmpty;
  output [31 : 0] portalIfc_indications_1_first;
  output RDY_portalIfc_indications_1_first;
  input  EN_portalIfc_indications_1_deq;
  output RDY_portalIfc_indications_1_deq;
  output portalIfc_indications_1_notEmpty;
  output RDY_portalIfc_indications_1_notEmpty;
  output portalIfc_intr_status;
  output RDY_portalIfc_intr_status;
  output [31 : 0] portalIfc_intr_channel;
  output RDY_portalIfc_intr_channel;
  input  [31 : 0] ifc_heard_v;
  input  EN_ifc_heard;
  output RDY_ifc_heard;
  input  [15 : 0] ifc_heard2_a;
  input  [15 : 0] ifc_heard2_b;
  input  EN_ifc_heard2;
  output RDY_ifc_heard2;
  wire [31 : 0] portalIfc_indications_0_first, portalIfc_indications_1_first, portalIfc_intr_channel;
  wire [15 : 0] portalIfc_messageSize_size;
  wire RDY_ifc_heard, RDY_ifc_heard2,
       RDY_portalIfc_indications_0_deq, RDY_portalIfc_indications_0_first, RDY_portalIfc_indications_0_notEmpty,
       RDY_portalIfc_indications_1_deq, RDY_portalIfc_indications_1_first, RDY_portalIfc_indications_1_notEmpty,
       RDY_portalIfc_intr_channel, RDY_portalIfc_intr_status, RDY_portalIfc_messageSize_size,
       portalIfc_indications_0_notEmpty, portalIfc_indications_1_notEmpty, portalIfc_intr_status;
  wire [31 : 0] indicationPipes_methods_heard2_enq_v, indicationPipes_methods_heard_enq_v,
    indicationPipes_portalIfc_indications_0_first, indicationPipes_portalIfc_indications_1_first,
    indicationPipes_portalIfc_intr_channel;
  wire [15 : 0] indicationPipes_portalIfc_messageSize_size,
    indicationPipes_portalIfc_messageSize_size_methodNumber;
  wire indicationPipes_EN_methods_heard2_enq, indicationPipes_EN_methods_heard_enq,
       indicationPipes_EN_portalIfc_indications_0_deq, indicationPipes_EN_portalIfc_indications_1_deq,
       indicationPipes_RDY_methods_heard2_enq, indicationPipes_RDY_methods_heard_enq,
       indicationPipes_RDY_portalIfc_indications_0_deq, indicationPipes_RDY_portalIfc_indications_0_first,
       indicationPipes_RDY_portalIfc_indications_1_deq, indicationPipes_RDY_portalIfc_indications_1_first,
       indicationPipes_portalIfc_indications_0_notEmpty, indicationPipes_portalIfc_indications_1_notEmpty,
       indicationPipes_portalIfc_intr_status;
  assign portalIfc_messageSize_size = indicationPipes_portalIfc_messageSize_size ;
  assign RDY_portalIfc_messageSize_size = 1'd1 ;
  assign portalIfc_indications_0_first = indicationPipes_portalIfc_indications_0_first ;
  assign RDY_portalIfc_indications_0_first = indicationPipes_RDY_portalIfc_indications_0_first ;
  assign RDY_portalIfc_indications_0_deq = indicationPipes_RDY_portalIfc_indications_0_deq ;
  assign portalIfc_indications_0_notEmpty = indicationPipes_portalIfc_indications_0_notEmpty ;
  assign RDY_portalIfc_indications_0_notEmpty = 1'd1 ;
  assign portalIfc_indications_1_first = indicationPipes_portalIfc_indications_1_first ;
  assign RDY_portalIfc_indications_1_first = indicationPipes_RDY_portalIfc_indications_1_first ;
  assign RDY_portalIfc_indications_1_deq = indicationPipes_RDY_portalIfc_indications_1_deq ;
  assign portalIfc_indications_1_notEmpty = indicationPipes_portalIfc_indications_1_notEmpty ;
  assign RDY_portalIfc_indications_1_notEmpty = 1'd1 ;
  assign portalIfc_intr_status = indicationPipes_portalIfc_intr_status ;
  assign RDY_portalIfc_intr_status = 1'd1 ;
  assign portalIfc_intr_channel = indicationPipes_portalIfc_intr_channel ;
  assign RDY_portalIfc_intr_channel = 1'd1 ;
  assign RDY_ifc_heard = indicationPipes_RDY_methods_heard_enq ;
  assign RDY_ifc_heard2 = indicationPipes_RDY_methods_heard2_enq ;
  mkEchoIndicationOutputPipes indicationPipes(.CLK(CLK), .RST_N(RST_N),
      .methods_heard2_enq_v(indicationPipes_methods_heard2_enq_v),
      .methods_heard_enq_v(indicationPipes_methods_heard_enq_v),
      .portalIfc_messageSize_size_methodNumber(indicationPipes_portalIfc_messageSize_size_methodNumber),
      .EN_methods_heard_enq(indicationPipes_EN_methods_heard_enq),
      .EN_methods_heard2_enq(indicationPipes_EN_methods_heard2_enq),
      .EN_portalIfc_indications_0_deq(indicationPipes_EN_portalIfc_indications_0_deq),
      .EN_portalIfc_indications_1_deq(indicationPipes_EN_portalIfc_indications_1_deq),
      .RDY_methods_heard_enq(indicationPipes_RDY_methods_heard_enq),
      .methods_heard_notFull(),
      .RDY_methods_heard_notFull(),
      .RDY_methods_heard2_enq(indicationPipes_RDY_methods_heard2_enq),
      .methods_heard2_notFull(),
      .RDY_methods_heard2_notFull(),
      .portalIfc_messageSize_size(indicationPipes_portalIfc_messageSize_size),
      .RDY_portalIfc_messageSize_size(),
      .portalIfc_indications_0_first(indicationPipes_portalIfc_indications_0_first),
      .RDY_portalIfc_indications_0_first(indicationPipes_RDY_portalIfc_indications_0_first),
      .RDY_portalIfc_indications_0_deq(indicationPipes_RDY_portalIfc_indications_0_deq),
      .portalIfc_indications_0_notEmpty(indicationPipes_portalIfc_indications_0_notEmpty),
      .RDY_portalIfc_indications_0_notEmpty(),
      .portalIfc_indications_1_first(indicationPipes_portalIfc_indications_1_first),
      .RDY_portalIfc_indications_1_first(indicationPipes_RDY_portalIfc_indications_1_first),
      .RDY_portalIfc_indications_1_deq(indicationPipes_RDY_portalIfc_indications_1_deq),
      .portalIfc_indications_1_notEmpty(indicationPipes_portalIfc_indications_1_notEmpty),
      .RDY_portalIfc_indications_1_notEmpty(),
      .portalIfc_intr_status(indicationPipes_portalIfc_intr_status),
      .RDY_portalIfc_intr_status(),
      .portalIfc_intr_channel(indicationPipes_portalIfc_intr_channel),
      .RDY_portalIfc_intr_channel());
  assign indicationPipes_methods_heard2_enq_v = { ifc_heard2_a, ifc_heard2_b } ;
  assign indicationPipes_methods_heard_enq_v = ifc_heard_v ;
  assign indicationPipes_portalIfc_messageSize_size_methodNumber = portalIfc_messageSize_size_methodNumber ;
  assign indicationPipes_EN_methods_heard_enq = EN_ifc_heard ;
  assign indicationPipes_EN_methods_heard2_enq = EN_ifc_heard2 ;
  assign indicationPipes_EN_portalIfc_indications_0_deq = EN_portalIfc_indications_0_deq ;
  assign indicationPipes_EN_portalIfc_indications_1_deq = EN_portalIfc_indications_1_deq ;
endmodule  // mkEchoIndicationOutput
