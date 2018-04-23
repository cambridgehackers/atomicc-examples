`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif
module mkEchoIndicationOutputPipes(CLK, RST_N,
           methods_heard_enq_v,
           EN_methods_heard_enq,
           RDY_methods_heard_enq,
           methods_heard_notFull,
           RDY_methods_heard_notFull,
           methods_heard2_enq_v,
           EN_methods_heard2_enq,
           RDY_methods_heard2_enq,
           methods_heard2_notFull,
           RDY_methods_heard2_notFull,
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
           RDY_portalIfc_intr_channel);
  input  CLK;
  input  RST_N;
  input  [31 : 0] methods_heard_enq_v;
  input  EN_methods_heard_enq;
  output RDY_methods_heard_enq;
  output methods_heard_notFull;
  output RDY_methods_heard_notFull;
  input  [31 : 0] methods_heard2_enq_v;
  input  EN_methods_heard2_enq;
  output RDY_methods_heard2_enq;
  output methods_heard2_notFull;
  output RDY_methods_heard2_notFull;
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
  wire [31 : 0] portalIfc_indications_0_first, portalIfc_indications_1_first, portalIfc_intr_channel;
  wire [15 : 0] portalIfc_messageSize_size;
  wire RDY_methods_heard2_enq, RDY_methods_heard2_notFull,
       RDY_methods_heard_enq, RDY_methods_heard_notFull,
       RDY_portalIfc_indications_0_deq, RDY_portalIfc_indications_0_first, RDY_portalIfc_indications_0_notEmpty,
       RDY_portalIfc_indications_1_deq, RDY_portalIfc_indications_1_first, RDY_portalIfc_indications_1_notEmpty,
       RDY_portalIfc_intr_channel, RDY_portalIfc_intr_status, RDY_portalIfc_messageSize_size,
       methods_heard2_notFull, methods_heard_notFull,
       portalIfc_indications_0_notEmpty, portalIfc_indications_1_notEmpty, portalIfc_intr_status;
  reg [31 : 0] heard2_responseAdapter_bits;
  wire [31 : 0] heard2_responseAdapter_bits_D_IN;
  wire heard2_responseAdapter_bits_EN;
  reg heard2_responseAdapter_notEmptyReg;
  wire heard2_responseAdapter_notEmptyReg_D_IN, heard2_responseAdapter_notEmptyReg_EN;
  reg [5 : 0] heard2_responseAdapter_shift;
  wire [5 : 0] heard2_responseAdapter_shift_D_IN;
  wire heard2_responseAdapter_shift_EN;
  reg [31 : 0] heard_responseAdapter_bits;
  wire [31 : 0] heard_responseAdapter_bits_D_IN;
  wire heard_responseAdapter_bits_EN;
  reg heard_responseAdapter_notEmptyReg;
  wire heard_responseAdapter_notEmptyReg_D_IN, heard_responseAdapter_notEmptyReg_EN;
  reg [5 : 0] heard_responseAdapter_shift;
  wire [5 : 0] heard_responseAdapter_shift_D_IN;
  wire heard_responseAdapter_shift_EN;
  assign RDY_methods_heard_enq = !heard_responseAdapter_notEmptyReg ;
  assign methods_heard_notFull = !heard_responseAdapter_notEmptyReg ;
  assign RDY_methods_heard_notFull = 1'd1 ;
  assign RDY_methods_heard2_enq = !heard2_responseAdapter_notEmptyReg ;
  assign methods_heard2_notFull = !heard2_responseAdapter_notEmptyReg ;
  assign RDY_methods_heard2_notFull = 1'd1 ;
  assign portalIfc_messageSize_size = 16'd32 ;
  assign RDY_portalIfc_messageSize_size = 1'd1 ;
  assign portalIfc_indications_0_first = heard_responseAdapter_bits ;
  assign RDY_portalIfc_indications_0_first = heard_responseAdapter_notEmptyReg ;
  assign RDY_portalIfc_indications_0_deq = heard_responseAdapter_notEmptyReg ;
  assign portalIfc_indications_0_notEmpty = heard_responseAdapter_notEmptyReg ;
  assign RDY_portalIfc_indications_0_notEmpty = 1'd1 ;
  assign portalIfc_indications_1_first = heard2_responseAdapter_bits ;
  assign RDY_portalIfc_indications_1_first = heard2_responseAdapter_notEmptyReg ;
  assign RDY_portalIfc_indications_1_deq = heard2_responseAdapter_notEmptyReg ;
  assign portalIfc_indications_1_notEmpty = heard2_responseAdapter_notEmptyReg ;
  assign RDY_portalIfc_indications_1_notEmpty = 1'd1 ;
  assign portalIfc_intr_status = heard_responseAdapter_notEmptyReg || heard2_responseAdapter_notEmptyReg ;
  assign RDY_portalIfc_intr_status = 1'd1 ;
  assign portalIfc_intr_channel = heard_responseAdapter_notEmptyReg ?  32'd0 :
         (heard2_responseAdapter_notEmptyReg ? 32'd1 : 32'hFFFFFFFF) ;
  assign RDY_portalIfc_intr_channel = 1'd1 ;
  assign heard2_responseAdapter_bits_D_IN = methods_heard2_enq_v ;
  assign heard2_responseAdapter_bits_EN = EN_methods_heard2_enq ;
  assign heard2_responseAdapter_notEmptyReg_D_IN = !EN_portalIfc_indications_1_deq ;
  assign heard2_responseAdapter_notEmptyReg_EN = EN_portalIfc_indications_1_deq || EN_methods_heard2_enq ;
  assign heard2_responseAdapter_shift_D_IN = 6'h0 ;
  assign heard2_responseAdapter_shift_EN = 1'b0 ;
  assign heard_responseAdapter_bits_D_IN = methods_heard_enq_v ;
  assign heard_responseAdapter_bits_EN = EN_methods_heard_enq ;
  assign heard_responseAdapter_notEmptyReg_D_IN = !EN_portalIfc_indications_0_deq ;
  assign heard_responseAdapter_notEmptyReg_EN = EN_portalIfc_indications_0_deq || EN_methods_heard_enq ;
  assign heard_responseAdapter_shift_D_IN = 6'h0 ;
  assign heard_responseAdapter_shift_EN = 1'b0 ;
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        heard2_responseAdapter_bits <= 32'd0;
        heard2_responseAdapter_notEmptyReg <= 1'd0;
        heard2_responseAdapter_shift <= 6'd0;
        heard_responseAdapter_bits <= 32'd0;
        heard_responseAdapter_notEmptyReg <= 1'd0;
        heard_responseAdapter_shift <= 6'd0;
      end
    else
      begin
        if (heard2_responseAdapter_bits_EN)
          heard2_responseAdapter_bits <= heard2_responseAdapter_bits_D_IN;
        if (heard2_responseAdapter_notEmptyReg_EN)
          heard2_responseAdapter_notEmptyReg <= heard2_responseAdapter_notEmptyReg_D_IN;
        if (heard2_responseAdapter_shift_EN)
          heard2_responseAdapter_shift <= heard2_responseAdapter_shift_D_IN;
        if (heard_responseAdapter_bits_EN)
          heard_responseAdapter_bits <= heard_responseAdapter_bits_D_IN;
        if (heard_responseAdapter_notEmptyReg_EN)
          heard_responseAdapter_notEmptyReg <= heard_responseAdapter_notEmptyReg_D_IN;
        if (heard_responseAdapter_shift_EN)
          heard_responseAdapter_shift <= heard_responseAdapter_shift_D_IN;
      end
  end
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    heard2_responseAdapter_bits = 32'hAAAAAAAA;
    heard2_responseAdapter_notEmptyReg = 1'h0;
    heard2_responseAdapter_shift = 6'h2A;
    heard_responseAdapter_bits = 32'hAAAAAAAA;
    heard_responseAdapter_notEmptyReg = 1'h0;
    heard_responseAdapter_shift = 6'h2A;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
endmodule  // mkEchoIndicationOutputPipes
