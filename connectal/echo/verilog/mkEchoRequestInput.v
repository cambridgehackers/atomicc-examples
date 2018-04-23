  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
module mkEchoRequestInput(CLK, RST_N,
        portalIfc_messageSize_size_methodNumber,
        portalIfc_messageSize_size, RDY_portalIfc_messageSize_size,
        portalIfc_requests_0_enq_v, EN_portalIfc_requests_0_enq, RDY_portalIfc_requests_0_enq,
        portalIfc_requests_0_notFull, RDY_portalIfc_requests_0_notFull,
        portalIfc_requests_1_enq_v, EN_portalIfc_requests_1_enq, RDY_portalIfc_requests_1_enq,
        portalIfc_requests_1_notFull, RDY_portalIfc_requests_1_notFull,
        portalIfc_requests_2_enq_v, EN_portalIfc_requests_2_enq, RDY_portalIfc_requests_2_enq,
        portalIfc_requests_2_notFull, RDY_portalIfc_requests_2_notFull,
        portalIfc_intr_status, RDY_portalIfc_intr_status,
        portalIfc_intr_channel, RDY_portalIfc_intr_channel,
        pipes_say_PipeOut_first, RDY_pipes_say_PipeOut_first,
        EN_pipes_say_PipeOut_deq, RDY_pipes_say_PipeOut_deq,
        pipes_say_PipeOut_notEmpty, RDY_pipes_say_PipeOut_notEmpty,
        pipes_say2_PipeOut_first, RDY_pipes_say2_PipeOut_first,
        EN_pipes_say2_PipeOut_deq, RDY_pipes_say2_PipeOut_deq,
        pipes_say2_PipeOut_notEmpty, RDY_pipes_say2_PipeOut_notEmpty,
        pipes_setLeds_PipeOut_first, RDY_pipes_setLeds_PipeOut_first,
        EN_pipes_setLeds_PipeOut_deq, RDY_pipes_setLeds_PipeOut_deq,
        pipes_setLeds_PipeOut_notEmpty, RDY_pipes_setLeds_PipeOut_notEmpty);
  input  CLK;
  input  RST_N;
  input  [15 : 0] portalIfc_messageSize_size_methodNumber;
  output [15 : 0] portalIfc_messageSize_size; output RDY_portalIfc_messageSize_size;
  input  [31 : 0] portalIfc_requests_0_enq_v;
  input  EN_portalIfc_requests_0_enq; output RDY_portalIfc_requests_0_enq;
  output portalIfc_requests_0_notFull; output RDY_portalIfc_requests_0_notFull;
  input  [31 : 0] portalIfc_requests_1_enq_v;
  input  EN_portalIfc_requests_1_enq; output RDY_portalIfc_requests_1_enq;
  output portalIfc_requests_1_notFull; output RDY_portalIfc_requests_1_notFull;
  input  [31 : 0] portalIfc_requests_2_enq_v;
  input  EN_portalIfc_requests_2_enq; output RDY_portalIfc_requests_2_enq;
  output portalIfc_requests_2_notFull; output RDY_portalIfc_requests_2_notFull;
  output portalIfc_intr_status; output RDY_portalIfc_intr_status;
  output [31 : 0] portalIfc_intr_channel; output RDY_portalIfc_intr_channel;
  output [31 : 0] pipes_say_PipeOut_first; output RDY_pipes_say_PipeOut_first;
  input  EN_pipes_say_PipeOut_deq; output RDY_pipes_say_PipeOut_deq;
  output pipes_say_PipeOut_notEmpty; output RDY_pipes_say_PipeOut_notEmpty;
  output [31 : 0] pipes_say2_PipeOut_first; output RDY_pipes_say2_PipeOut_first;
  input  EN_pipes_say2_PipeOut_deq; output RDY_pipes_say2_PipeOut_deq;
  output pipes_say2_PipeOut_notEmpty; output RDY_pipes_say2_PipeOut_notEmpty;
  output [7 : 0] pipes_setLeds_PipeOut_first; output RDY_pipes_setLeds_PipeOut_first;
  input  EN_pipes_setLeds_PipeOut_deq; output RDY_pipes_setLeds_PipeOut_deq;
  output pipes_setLeds_PipeOut_notEmpty; output RDY_pipes_setLeds_PipeOut_notEmpty;
  reg [15 : 0] portalIfc_messageSize_size;
  wire [31 : 0] pipes_say2_PipeOut_first, pipes_say_PipeOut_first, portalIfc_intr_channel;
  wire [7 : 0] pipes_setLeds_PipeOut_first;
  wire RDY_pipes_say2_PipeOut_deq, RDY_pipes_say2_PipeOut_first,
       RDY_pipes_say2_PipeOut_notEmpty, RDY_pipes_say_PipeOut_deq,
       RDY_pipes_say_PipeOut_first, RDY_pipes_say_PipeOut_notEmpty,
       RDY_pipes_setLeds_PipeOut_deq, RDY_pipes_setLeds_PipeOut_first,
       RDY_pipes_setLeds_PipeOut_notEmpty, RDY_portalIfc_intr_channel,
       RDY_portalIfc_intr_status, RDY_portalIfc_messageSize_size,
       RDY_portalIfc_requests_0_enq, RDY_portalIfc_requests_0_notFull,
       RDY_portalIfc_requests_1_enq, RDY_portalIfc_requests_1_notFull,
       RDY_portalIfc_requests_2_enq, RDY_portalIfc_requests_2_notFull,
       pipes_say2_PipeOut_notEmpty, pipes_say_PipeOut_notEmpty,
       pipes_setLeds_PipeOut_notEmpty, portalIfc_intr_status,
       portalIfc_requests_0_notFull, portalIfc_requests_1_notFull, portalIfc_requests_2_notFull;
  reg [31 : 0] say2_requestAdapter_fbnbuff;
  wire [31 : 0] say2_requestAdapter_fbnbuff_D_IN;
  wire say2_requestAdapter_fbnbuff_EN;
  reg [31 : 0] say_requestAdapter_fbnbuff;
  wire [31 : 0] say_requestAdapter_fbnbuff_D_IN;
  wire say_requestAdapter_fbnbuff_EN;
  reg [31 : 0] setLeds_requestAdapter_fbnbuff;
  wire [31 : 0] setLeds_requestAdapter_fbnbuff_D_IN;
  wire setLeds_requestAdapter_fbnbuff_EN;
  wire [31 : 0] say2_requestAdapter_fifo_D_IN, say2_requestAdapter_fifo_D_OUT;
  wire say2_requestAdapter_fifo_DEQ, say2_requestAdapter_fifo_EMPTY_N,
       say2_requestAdapter_fifo_ENQ, say2_requestAdapter_fifo_FULL_N;
  wire [31 : 0] say_requestAdapter_fifo_D_IN, say_requestAdapter_fifo_D_OUT;
  wire say_requestAdapter_fifo_DEQ, say_requestAdapter_fifo_EMPTY_N,
       say_requestAdapter_fifo_ENQ, say_requestAdapter_fifo_FULL_N;
  wire [7 : 0] setLeds_requestAdapter_fifo_D_IN,
         setLeds_requestAdapter_fifo_D_OUT;
  wire setLeds_requestAdapter_fifo_DEQ, setLeds_requestAdapter_fifo_EMPTY_N,
       setLeds_requestAdapter_fifo_ENQ, setLeds_requestAdapter_fifo_FULL_N;
  always@(portalIfc_messageSize_size_methodNumber)
  begin
    case (portalIfc_messageSize_size_methodNumber)
      16'd0, 16'd1: portalIfc_messageSize_size = 16'd32;
      default: portalIfc_messageSize_size = 16'd8;
    endcase
  end
  assign RDY_portalIfc_messageSize_size = 1'd1 ;
  assign RDY_portalIfc_requests_0_enq = say_requestAdapter_fifo_FULL_N ;
  assign portalIfc_requests_0_notFull = say_requestAdapter_fifo_FULL_N ;
  assign RDY_portalIfc_requests_0_notFull = 1'd1 ;
  assign RDY_portalIfc_requests_1_enq = say2_requestAdapter_fifo_FULL_N ;
  assign portalIfc_requests_1_notFull = say2_requestAdapter_fifo_FULL_N ;
  assign RDY_portalIfc_requests_1_notFull = 1'd1 ;
  assign RDY_portalIfc_requests_2_enq = setLeds_requestAdapter_fifo_FULL_N ;
  assign portalIfc_requests_2_notFull = setLeds_requestAdapter_fifo_FULL_N ;
  assign RDY_portalIfc_requests_2_notFull = 1'd1 ;
  assign portalIfc_intr_status = 1'd0 ;
  assign RDY_portalIfc_intr_status = 1'd1 ;
  assign portalIfc_intr_channel = 32'hFFFFFFFF ;
  assign RDY_portalIfc_intr_channel = 1'd1 ;
  assign pipes_say_PipeOut_first = say_requestAdapter_fifo_D_OUT ;
  assign RDY_pipes_say_PipeOut_first = say_requestAdapter_fifo_EMPTY_N ;
  assign RDY_pipes_say_PipeOut_deq = say_requestAdapter_fifo_EMPTY_N ;
  assign pipes_say_PipeOut_notEmpty = say_requestAdapter_fifo_EMPTY_N ;
  assign RDY_pipes_say_PipeOut_notEmpty = 1'd1 ;
  assign pipes_say2_PipeOut_first = say2_requestAdapter_fifo_D_OUT ;
  assign RDY_pipes_say2_PipeOut_first = say2_requestAdapter_fifo_EMPTY_N ;
  assign RDY_pipes_say2_PipeOut_deq = say2_requestAdapter_fifo_EMPTY_N ;
  assign pipes_say2_PipeOut_notEmpty = say2_requestAdapter_fifo_EMPTY_N ;
  assign RDY_pipes_say2_PipeOut_notEmpty = 1'd1 ;
  assign pipes_setLeds_PipeOut_first = setLeds_requestAdapter_fifo_D_OUT ;
  assign RDY_pipes_setLeds_PipeOut_first = setLeds_requestAdapter_fifo_EMPTY_N ;
  assign RDY_pipes_setLeds_PipeOut_deq = setLeds_requestAdapter_fifo_EMPTY_N ;
  assign pipes_setLeds_PipeOut_notEmpty = setLeds_requestAdapter_fifo_EMPTY_N ;
  assign RDY_pipes_setLeds_PipeOut_notEmpty = 1'd1 ;
  FIFO1 #(.width(32'd32), .guarded(32'd1)) say2_requestAdapter_fifo(.RST(RST_N), .CLK(CLK),
      .D_IN(say2_requestAdapter_fifo_D_IN), .ENQ(say2_requestAdapter_fifo_ENQ),
      .DEQ(say2_requestAdapter_fifo_DEQ), .CLR(0),
      .D_OUT(say2_requestAdapter_fifo_D_OUT), .FULL_N(say2_requestAdapter_fifo_FULL_N),
      .EMPTY_N(say2_requestAdapter_fifo_EMPTY_N));
  FIFO1 #(.width(32'd32), .guarded(32'd1)) say_requestAdapter_fifo(.RST(RST_N), .CLK(CLK),
      .D_IN(say_requestAdapter_fifo_D_IN), .ENQ(say_requestAdapter_fifo_ENQ),
      .DEQ(say_requestAdapter_fifo_DEQ), .CLR(0),
      .D_OUT(say_requestAdapter_fifo_D_OUT), .FULL_N(say_requestAdapter_fifo_FULL_N),
      .EMPTY_N(say_requestAdapter_fifo_EMPTY_N));
  FIFO1 #(.width(32'd8), .guarded(32'd1)) setLeds_requestAdapter_fifo(.RST(RST_N), .CLK(CLK),
      .D_IN(setLeds_requestAdapter_fifo_D_IN), .ENQ(setLeds_requestAdapter_fifo_ENQ),
      .DEQ(setLeds_requestAdapter_fifo_DEQ), .CLR(0),
      .D_OUT(setLeds_requestAdapter_fifo_D_OUT), .FULL_N(setLeds_requestAdapter_fifo_FULL_N),
      .EMPTY_N(setLeds_requestAdapter_fifo_EMPTY_N));
  assign say2_requestAdapter_fbnbuff_D_IN = portalIfc_requests_1_enq_v ;
  assign say2_requestAdapter_fbnbuff_EN = EN_portalIfc_requests_1_enq ;
  assign say_requestAdapter_fbnbuff_D_IN = portalIfc_requests_0_enq_v ;
  assign say_requestAdapter_fbnbuff_EN = EN_portalIfc_requests_0_enq ;
  assign setLeds_requestAdapter_fbnbuff_D_IN = portalIfc_requests_2_enq_v ;
  assign setLeds_requestAdapter_fbnbuff_EN = EN_portalIfc_requests_2_enq ;
  assign say2_requestAdapter_fifo_D_IN = portalIfc_requests_1_enq_v ;
  assign say2_requestAdapter_fifo_ENQ = EN_portalIfc_requests_1_enq ;
  assign say2_requestAdapter_fifo_DEQ = EN_pipes_say2_PipeOut_deq ;
  assign say_requestAdapter_fifo_D_IN = portalIfc_requests_0_enq_v ;
  assign say_requestAdapter_fifo_ENQ = EN_portalIfc_requests_0_enq ;
  assign say_requestAdapter_fifo_DEQ = EN_pipes_say_PipeOut_deq ;
  assign setLeds_requestAdapter_fifo_D_IN = portalIfc_requests_2_enq_v[7:0] ;
  assign setLeds_requestAdapter_fifo_ENQ = EN_portalIfc_requests_2_enq ;
  assign setLeds_requestAdapter_fifo_DEQ = EN_pipes_setLeds_PipeOut_deq ;
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        say2_requestAdapter_fbnbuff <= 32'd0;
        say_requestAdapter_fbnbuff <= 32'd0;
        setLeds_requestAdapter_fbnbuff <= 32'd0;
      end
    else
      begin
        if (say2_requestAdapter_fbnbuff_EN)
          say2_requestAdapter_fbnbuff <= say2_requestAdapter_fbnbuff_D_IN;
        if (say_requestAdapter_fbnbuff_EN)
          say_requestAdapter_fbnbuff <= say_requestAdapter_fbnbuff_D_IN;
        if (setLeds_requestAdapter_fbnbuff_EN)
          setLeds_requestAdapter_fbnbuff <= setLeds_requestAdapter_fbnbuff_D_IN;
      end
  end
  `ifdef BSV_NO_INITIAL_BLOCKS
alksjdlkasjd
lkasjdlkasd
asdasd
ddd
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    say2_requestAdapter_fbnbuff = 32'hAAAAAAAA;
    say_requestAdapter_fbnbuff = 32'hAAAAAAAA;
    setLeds_requestAdapter_fbnbuff = 32'hAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
endmodule  // mkEchoRequestInput
