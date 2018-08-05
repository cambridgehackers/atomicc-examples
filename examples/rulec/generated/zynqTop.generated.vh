`ifndef __zynqTop_GENERATED__VH__
`define __zynqTop_GENERATED__VH__

//METASTART; ClockTop
//METAINTERNAL; ps7_clockGen_pll; MMCME2_ADV;
//METAINTERNAL; rinverter; ResetInverter;
//METAINTERNAL; clkbuf; BUFG;
//METAINTERNAL; clkbuf0; BUFG;
//METAGUARD; RULEinit; 1;
//METARULES; RULEinit
//METASTART; Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METASTART; Fifo1_OC_10
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METASTART; Fifo1_OC_12
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METASTART; Fifo1_OC_14
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METASTART; Fifo1_OC_16
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METASTART; Fifo1_OC_18
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METASTART; MuxPipe
//METAEXTERNAL; out; l_ainterface_OC_PipeIn;
//METAINTERNAL; forwardFifo; Fifo1;
//METAINVOKE; RULEfifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:out$enq__ENA;
//METAEXCLUSIVE; RULEfifoRule__ENA; in$enq__ENA
//METAGUARD; RULEfifoRule; forwardFifo$out$deq__RDY & out$enq__RDY;
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
//METAGUARD; RULEgp0ar; pps$MAXIGP0ARVALID & MAXIGP0_O$AR__RDY;
//METAINVOKE; RULEgp0aw__ENA; :MAXIGP0_O$AW__ENA;
//METAGUARD; RULEgp0aw; pps$MAXIGP0AWVALID & MAXIGP0_O$AW__RDY;
//METAINVOKE; RULEgp0w__ENA; :MAXIGP0_O$W__ENA;
//METAGUARD; RULEgp0w; pps$MAXIGP0WVALID & MAXIGP0_O$W__RDY;
//METAGUARD; RULEinit; 1;
//METARULES; RULEgp0ar; RULEgp0aw; RULEgp0w; RULEinit
//METASTART; ResetInverter
//METAGUARD; RULEinit; 1;
//METARULES; RULEinit
//METASTART; TestTop
//METAEXTERNAL; MAXIGP0_I; l_ainterface_OC_MaxiI;
//METAINTERNAL; reqArs; Fifo1_OC_10;
//METAINTERNAL; reqAws; Fifo1_OC_10;
//METAINTERNAL; readBeat; Fifo1_OC_12;
//METAINTERNAL; writeBeat; Fifo1_OC_12;
//METAINTERNAL; readData; Fifo1_OC_14;
//METAINTERNAL; writeData; Fifo1_OC_16;
//METAINTERNAL; writeDone; Fifo1_OC_18;
//METAINTERNAL; user; UserTop;
//METAINVOKE; MAXIGP0_O$AR__ENA; :reqArs$in$enq__ENA;
//METAGUARD; MAXIGP0_O$AR; reqArs$in$enq__RDY;
//METAINVOKE; MAXIGP0_O$AW__ENA; :reqAws$in$enq__ENA;
//METAGUARD; MAXIGP0_O$AW; reqAws$in$enq__RDY;
//METAINVOKE; MAXIGP0_O$W__ENA; :writeData$in$enq__ENA;
//METAGUARD; MAXIGP0_O$W; writeData$in$enq__RDY;
//METABEFORE; RULEinit__ENA; :RULElread__ENA; :RULElwrite__ENA; :readUser$enq__ENA
//METAGUARD; RULEinit; 1;
//METAINVOKE; RULElR__ENA; :MAXIGP0_I$R__ENA;:readData$out$deq__ENA;:readData$out$first;
//METAGUARD; RULElR; readData$out$deq__RDY & MAXIGP0_I$R__RDY;
//METAINVOKE; RULElread__ENA; :readBeat$out$deq__ENA;:readBeat$out$first;1:readData$in$enq__ENA;
//METAEXCLUSIVE; RULElread__ENA; readUser$enq__ENA
//METABEFORE; RULElread__ENA; :MAXIGP0_O$AR__ENA; :RULEinit__ENA; :readUser$enq__ENA
//METAINVOKE; RULElreadNext__ENA; :readBeat$in$enq__ENA;RULElreadNext__ENA$readLastNext != 0:reqArs$out$deq__ENA;:reqArs$out$first;
//METAGUARD; RULElreadNext; reqArs$out$deq__RDY & readBeat$in$enq__RDY;
//METAGUARD; RULElread; readBeat$out$deq__RDY & readData$in$enq__RDY;
//METAINVOKE; RULElwrite__ENA; portalWControl == 0:user$write$enq__ENA;:writeBeat$out$deq__ENA;:writeBeat$out$first;:writeData$out$deq__ENA;:writeData$out$first;RULElwrite__ENA$wb$last != 0:writeDone$in$enq__ENA;
//METAINVOKE; RULElwriteNext__ENA; RULElwriteNext__ENA$writeLastNext != 0:reqAws$out$deq__ENA;:reqAws$out$first;:writeBeat$in$enq__ENA;
//METAGUARD; RULElwriteNext; reqAws$out$deq__RDY & writeBeat$in$enq__RDY;
//METAGUARD; RULElwrite; writeBeat$out$deq__RDY & writeData$out$deq__RDY & ( portalWControl | user$write$enq__RDY );
//METAINVOKE; RULEwriteResponse__ENA; :MAXIGP0_I$B__ENA;:writeDone$out$deq__ENA;:writeDone$out$first;
//METAGUARD; RULEwriteResponse; writeDone$out$deq__RDY & MAXIGP0_I$B__RDY;
//METAGUARD; readUser$enq; requestLength == 16'd0;
//METARULES; RULEinit; RULElR; RULElread; RULElreadNext; RULElwrite; RULElwriteNext; RULEwriteResponse
//METACONNECT; readUser$enq__ENA; user$read$enq__ENA
//METACONNECT; readUser$enq__RDY; user$read$enq__RDY
//METASTART; ZynqTopNew
//METAINTERNAL; ps7_ps7_foo; P7Wrap;
//METAINTERNAL; test; TestTop;
//METAINTERNAL; ps7_fclk_0_c; BUFG;
//METAINTERNAL; ps7_freset_0_r; BUFG;
//METAGUARD; RULEinit; 1;
//METARULES; RULEinit
//METACONNECT; test$MAXIGP0_O$AR__ENA; ps7_ps7_foo$MAXIGP0_O$AR__ENA
//METACONNECT; test$MAXIGP0_O$AR__RDY; ps7_ps7_foo$MAXIGP0_O$AR__RDY
//METACONNECT; test$MAXIGP0_O$AW__ENA; ps7_ps7_foo$MAXIGP0_O$AW__ENA
//METACONNECT; test$MAXIGP0_O$AW__RDY; ps7_ps7_foo$MAXIGP0_O$AW__RDY
//METACONNECT; test$MAXIGP0_O$W__ENA; ps7_ps7_foo$MAXIGP0_O$W__ENA
//METACONNECT; test$MAXIGP0_O$W__RDY; ps7_ps7_foo$MAXIGP0_O$W__RDY
//METACONNECT; test$MAXIGP0_I$B__ENA; ps7_ps7_foo$MAXIGP0_I$B__ENA
//METACONNECT; test$MAXIGP0_I$B__RDY; ps7_ps7_foo$MAXIGP0_I$B__RDY
//METACONNECT; test$MAXIGP0_I$R__ENA; ps7_ps7_foo$MAXIGP0_I$R__ENA
//METACONNECT; test$MAXIGP0_I$R__RDY; ps7_ps7_foo$MAXIGP0_I$R__RDY
`endif
