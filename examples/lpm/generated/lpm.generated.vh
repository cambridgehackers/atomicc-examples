`ifndef __lpm_GENERATED__VH__
`define __lpm_GENERATED__VH__

//METASTART; Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; 1;
//METAGUARD; out$deq; 1;
//METAGUARD; out$first; 1;
//METASTART; Fifo1_OC_2
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METAGUARD; out$first; full;
//METASTART; Fifo2
//METAGUARD; in$enq; ( ( windex + 1 ) % 2 ) != rindex;
//METAGUARD; out$deq; rindex != windex;
//METAGUARD; out$first; rindex != windex;
//METASTART; Lpm
//METAEXTERNAL; ind; l_ainterface_OC_LpmIndication;
//METAINTERNAL; inQ; Fifo1_OC_2;
//METAINTERNAL; fifo; Fifo2;
//METAINTERNAL; outQ; Fifo1_OC_2;
//METAINTERNAL; mem; LpmMemory;
//METAINVOKE; enter__ENA; :fifo$in$enq__ENA;:inQ$out$deq__ENA;:inQ$out$first;:mem$ifc$req__ENA;
//METAEXCLUSIVE; enter__ENA; recirc__ENA
//METAGUARD; enter; inQ$out$first__RDY & inQ$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY;
//METAINVOKE; exit_rule__ENA; :fifo$out$deq__ENA;:fifo$out$first;:mem$ifc$resAccept__ENA;:mem$ifc$resValue;:outQ$in$enq__ENA;
//METAEXCLUSIVE; exit_rule__ENA; recirc__ENA
//METAGUARD; exit_rule; fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & outQ$in$enq__RDY;
//METAINVOKE; recirc__ENA; :fifo$in$enq__ENA;:fifo$out$deq__ENA;:fifo$out$first;:mem$ifc$req__ENA;:mem$ifc$resAccept__ENA;:mem$ifc$resValue;
//METAGUARD; recirc; fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY;
//METAINVOKE; request$say__ENA; :inQ$in$enq__ENA;
//METAGUARD; request$say; inQ$in$enq__RDY;
//METAINVOKE; respond__ENA; :ind$heard__ENA;:outQ$out$deq__ENA;:outQ$out$first;
//METAGUARD; respond; outQ$out$first__RDY & outQ$out$deq__RDY & ind$heard__RDY;
//METARULES; enter; exit_rule; recirc; respond
//METAPRIORITY; recirc; enter;exit
//METASTART; LpmMemory
//METAEXCLUSIVE; ifc$req__ENA; ifc$resAccept__ENA; memdelay_rule__ENA
//METAGUARD; ifc$req; delayCount == 32'd0;
//METAEXCLUSIVE; ifc$resAccept__ENA; memdelay_rule__ENA
//METAGUARD; ifc$resAccept; delayCount == 32'd1;
//METAGUARD; ifc$resValue; delayCount == 32'd1;
//METAGUARD; memdelay_rule; ( delayCount > 1 ) != 0;
//METARULES; memdelay_rule
//METASTART; MuxPipe
//METAEXTERNAL; out; l_ainterface_OC_PipeIn;
//METAINTERNAL; forwardFifo; Fifo1;
//METAINVOKE; fifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:out$enq__ENA;
//METAEXCLUSIVE; fifoRule__ENA; in$enq__ENA
//METAGUARD; fifoRule; forwardFifo$out$first__RDY & out$enq__RDY & forwardFifo$out$deq__RDY;
//METAINVOKE; forward$enq__ENA; :forwardFifo$in$enq__ENA;
//METAGUARD; forward$enq; forwardFifo$in$enq__RDY;
//METAINVOKE; in$enq__ENA; :out$enq__ENA;
//METAGUARD; in$enq; out$enq__RDY;
//METARULES; fifoRule
`endif
