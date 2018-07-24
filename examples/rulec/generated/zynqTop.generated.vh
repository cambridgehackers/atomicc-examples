`ifndef __zynqTop_GENERATED__VH__
`define __zynqTop_GENERATED__VH__

//METASTART; ClockTop
//METAINTERNAL; ps7_clockGen_pll; MMCME2_ADV;
//METAINTERNAL; rinverter; ResetInverter;
//METAINTERNAL; clkbuf; BUFG;
//METAINTERNAL; clkbuf0; BUFG;
//METAGUARD; RULEinit$100; 1;
//METAGUARD; RULEinit; 1;
//METARULES; RULEinit; RULEinit$100
//METASTART; Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METAGUARD; out$first; full;
//METASTART; Fifo1_OC_10
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METAGUARD; out$first; full;
//METASTART; Fifo1_OC_12
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METAGUARD; out$first; full;
//METASTART; Fifo1_OC_14
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METAGUARD; out$first; full;
//METASTART; Fifo1_OC_16
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METAGUARD; out$first; full;
//METASTART; Fifo1_OC_18
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METAGUARD; out$first; full;
//METASTART; MuxPipe
//METAEXTERNAL; out; l_ainterface_OC_PipeIn;
//METAINTERNAL; forwardFifo; Fifo1;
//METAINVOKE; RULEfifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:out$enq__ENA;
//METAEXCLUSIVE; RULEfifoRule__ENA; in$enq__ENA
//METAGUARD; RULEfifoRule; forwardFifo$out$first__RDY & out$enq__RDY & forwardFifo$out$deq__RDY;
//METAINVOKE; forward$enq__ENA; :forwardFifo$in$enq__ENA;
//METAGUARD; forward$enq; forwardFifo$in$enq__RDY;
//METAINVOKE; in$enq__ENA; :out$enq__ENA;
//METAGUARD; in$enq; out$enq__RDY;
//METARULES; RULEfifoRule
//METASTART; P7Wrap
//METAEXTERNAL; MAXIGP0_O; l_ainterface_OC_MaxiO;
//METAINTERNAL; pps; PS7;
//METAINTERNAL; pclockTop; ClockTop;
//METAGUARD; MAXIGP0_I$B; pps$MAXIGP0BREADY;
//METAGUARD; MAXIGP0_I$R; pps$MAXIGP0RREADY;
//METAINVOKE; RULEgp0ar__ENA; :MAXIGP0_O$AR__ENA;
//METAEXCLUSIVE; RULEgp0ar__ENA; RULEgp0ar$100__ENA
//METAINVOKE; RULEgp0ar$100__ENA; :MAXIGP0_O$AR__ENA;
//METAGUARD; RULEgp0ar$100; pps$MAXIGP0ARVALID & MAXIGP0_O$AR__RDY;
//METAGUARD; RULEgp0ar; pps$MAXIGP0ARVALID & MAXIGP0_O$AR__RDY;
//METAINVOKE; RULEgp0aw__ENA; :MAXIGP0_O$AW__ENA;
//METAEXCLUSIVE; RULEgp0aw__ENA; RULEgp0aw$100__ENA
//METAINVOKE; RULEgp0aw$100__ENA; :MAXIGP0_O$AW__ENA;
//METAGUARD; RULEgp0aw$100; pps$MAXIGP0AWVALID & MAXIGP0_O$AW__RDY;
//METAGUARD; RULEgp0aw; pps$MAXIGP0AWVALID & MAXIGP0_O$AW__RDY;
//METAINVOKE; RULEgp0w__ENA; :MAXIGP0_O$W__ENA;
//METAEXCLUSIVE; RULEgp0w__ENA; RULEgp0w$100__ENA
//METAINVOKE; RULEgp0w$100__ENA; :MAXIGP0_O$W__ENA;
//METAGUARD; RULEgp0w$100; pps$MAXIGP0WVALID & MAXIGP0_O$W__RDY;
//METAGUARD; RULEgp0w; pps$MAXIGP0WVALID & MAXIGP0_O$W__RDY;
//METAGUARD; RULEinit$100; 1;
//METAGUARD; RULEinit; 1;
//METARULES; RULEgp0ar; RULEgp0ar$100; RULEgp0aw; RULEgp0aw$100; RULEgp0w; RULEgp0w$100; RULEinit; RULEinit$100
//METASTART; ResetInverter
//METAGUARD; RULEinit$100; 1;
//METAGUARD; RULEinit; 1;
//METARULES; RULEinit; RULEinit$100
//METASTART; TestTop
//METAEXTERNAL; MAXIGP0_I; l_ainterface_OC_MaxiI;
//METAINTERNAL; reqArs; Fifo1_OC_10;
//METAINTERNAL; reqAws; Fifo1_OC_10;
//METAINTERNAL; readBeat; Fifo1_OC_12;
//METAINTERNAL; writeBeat; Fifo1_OC_12;
//METAINTERNAL; readData; Fifo1_OC_14;
//METAINTERNAL; readBus; Fifo1_OC_16;
//METAINTERNAL; writeData; Fifo1_OC_16;
//METAINTERNAL; writeDone; Fifo1_OC_18;
//METAINTERNAL; user; UserTop;
//METAINVOKE; MAXIGP0_O$AR__ENA; :reqArs$in$enq__ENA;
//METAGUARD; MAXIGP0_O$AR; reqArs$in$enq__RDY;
//METAINVOKE; MAXIGP0_O$AW__ENA; :reqAws$in$enq__ENA;
//METAGUARD; MAXIGP0_O$AW; reqAws$in$enq__RDY;
//METAINVOKE; MAXIGP0_O$W__ENA; :writeData$in$enq__ENA;
//METAGUARD; MAXIGP0_O$W; writeData$in$enq__RDY;
//METABEFORE; RULEinit__ENA; :RULElwrite__ENA
//METAGUARD; RULEinit; 1;
//METAINVOKE; RULElR__ENA; :MAXIGP0_I$R__ENA;:readData$out$deq__ENA;:readData$out$first;
//METAGUARD; RULElR; readData$out$first__RDY & readData$out$deq__RDY & MAXIGP0_I$R__RDY;
//METAINVOKE; RULElread__ENA; :readBeat$out$deq__ENA;:readBeat$out$first;( RULElread__ENA$temp$ac$addr == 0 ) & ( selectRIndReq != 0 ):readBus$out$deq__ENA;( RULElread__ENA$temp$ac$addr == 0 ) & ( selectRIndReq != 0 ):readBus$out$first;:readData$in$enq__ENA;
//METAINVOKE; RULElreadNext__ENA; :readBeat$in$enq__ENA;( ( readFirst == 0 ) ? ( RULElreadNext__ENA$temp$count == 4 ) : readLast ) != 0:reqArs$out$deq__ENA;:reqArs$out$first;
//METAGUARD; RULElreadNext; reqArs$out$first__RDY & readBeat$in$enq__RDY & ( ( ( ( !readFirst ) ? ( RULElreadNext__ENA$temp$count == 10'd4 ) : readLast ) == 0 ) | reqArs$out$deq__RDY );
//METAGUARD; RULElread; readBeat$out$first__RDY & readBeat$out$deq__RDY & ( ( RULElread__ENA$temp$ac$addr != 5'd0 ) | ( !selectRIndReq ) | readBus$out$first__RDY ) & ( ( RULElread__ENA$temp$ac$addr != 5'd0 ) | ( !selectRIndReq ) | readBus$out$deq__RDY ) & readData$in$enq__RDY;
//METAINVOKE; RULElwrite__ENA; ( portalWControl == 0 ) & ( RULElwrite__ENA$wb$last == 0 ):user$write$enq__ENA;RULElwrite__ENA$wb$last == 0:writeBeat$out$deq__ENA;:writeBeat$out$first;RULElwrite__ENA$wb$last == 0:writeData$out$deq__ENA;RULElwrite__ENA$wb$last == 0:writeData$out$first;RULElwrite__ENA$wb$last != 0:writeDone$in$enq__ENA;
//METAINVOKE; RULElwriteNext__ENA; ( ( writeFirst == 0 ) ? ( RULElwriteNext__ENA$temp$count == 4 ) : writeLast ) != 0:reqAws$out$deq__ENA;:reqAws$out$first;:writeBeat$in$enq__ENA;
//METAGUARD; RULElwriteNext; reqAws$out$first__RDY & writeBeat$in$enq__RDY & ( ( ( ( !writeFirst ) ? ( RULElwriteNext__ENA$temp$count == 10'd4 ) : writeLast ) == 0 ) | reqAws$out$deq__RDY );
//METAGUARD; RULElwrite; writeBeat$out$first__RDY & ( ( !RULElwrite__ENA$wb$last ) | writeDone$in$enq__RDY ) & ( RULElwrite__ENA$wb$last | writeBeat$out$deq__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$first__RDY ) & ( RULElwrite__ENA$wb$last | writeData$out$deq__RDY ) & ( portalWControl | RULElwrite__ENA$wb$last | user$write$enq__RDY );
//METAINVOKE; RULEwriteResponse__ENA; :MAXIGP0_I$B__ENA;:writeDone$out$deq__ENA;:writeDone$out$first;
//METAGUARD; RULEwriteResponse; writeDone$out$first__RDY & MAXIGP0_I$B__RDY & writeDone$out$deq__RDY;
//METAINVOKE; readUser$enq__ENA; :readBus$in$enq__ENA;
//METAGUARD; readUser$enq; readBus$in$enq__RDY;
//METARULES; RULEinit; RULElR; RULElread; RULElreadNext; RULElwrite; RULElwriteNext; RULEwriteResponse
//METACONNECT; readUser$enq__ENA; user$read$enq__ENA
//METACONNECT; readUser$enq__RDY; user$read$enq__RDY
//METASTART; ZynqTop
//METAEXTERNAL; MAXIGP0_O; l_ainterface_OC_MaxiO;
//METAINTERNAL; zt; P7Wrap;
//METACONNECT; MAXIGP0_O$AR__ENA; zt$MAXIGP0_O$AR__ENA
//METACONNECT; MAXIGP0_O$AR__RDY; zt$MAXIGP0_O$AR__RDY
//METACONNECT; MAXIGP0_O$AW__ENA; zt$MAXIGP0_O$AW__ENA
//METACONNECT; MAXIGP0_O$AW__RDY; zt$MAXIGP0_O$AW__RDY
//METACONNECT; MAXIGP0_O$W__ENA; zt$MAXIGP0_O$W__ENA
//METACONNECT; MAXIGP0_O$W__RDY; zt$MAXIGP0_O$W__RDY
//METACONNECT; MAXIGP0_I$B__ENA; zt$MAXIGP0_I$B__ENA
//METACONNECT; MAXIGP0_I$B__RDY; zt$MAXIGP0_I$B__RDY
//METACONNECT; MAXIGP0_I$R__ENA; zt$MAXIGP0_I$R__ENA
//METACONNECT; MAXIGP0_I$R__RDY; zt$MAXIGP0_I$R__RDY
//METASTART; ZynqTopNew
//METAINTERNAL; zt; P7Wrap;
//METAINTERNAL; test; TestTop;
//METACONNECT; test$MAXIGP0_O$AR__ENA; zt$MAXIGP0_O$AR__ENA
//METACONNECT; test$MAXIGP0_O$AR__RDY; zt$MAXIGP0_O$AR__RDY
//METACONNECT; test$MAXIGP0_O$AW__ENA; zt$MAXIGP0_O$AW__ENA
//METACONNECT; test$MAXIGP0_O$AW__RDY; zt$MAXIGP0_O$AW__RDY
//METACONNECT; test$MAXIGP0_O$W__ENA; zt$MAXIGP0_O$W__ENA
//METACONNECT; test$MAXIGP0_O$W__RDY; zt$MAXIGP0_O$W__RDY
//METACONNECT; test$MAXIGP0_I$B__ENA; zt$MAXIGP0_I$B__ENA
//METACONNECT; test$MAXIGP0_I$B__RDY; zt$MAXIGP0_I$B__RDY
//METACONNECT; test$MAXIGP0_I$R__ENA; zt$MAXIGP0_I$R__ENA
//METACONNECT; test$MAXIGP0_I$R__RDY; zt$MAXIGP0_I$R__RDY
`endif
