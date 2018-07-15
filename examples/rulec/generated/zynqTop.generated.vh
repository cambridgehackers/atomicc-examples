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
//METASTART; ResetInverter
//METAGUARD; RULEinit; 1;
//METARULES; RULEinit
//METASTART; ZynqTop
//METAEXTERNAL; MAXIGP0_O; l_ainterface_OC_MaxiO;
//METAINTERNAL; pps; PS7;
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
`endif
