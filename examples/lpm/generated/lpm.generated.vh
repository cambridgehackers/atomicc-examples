`ifndef __lpm_GENERATED__VH__
`define __lpm_GENERATED__VH__

//METASTART; Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METAGUARD; out$first; full;
//METASTART; Fifo1_OC_4
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METAGUARD; out$first; full;
//METASTART; Fifo2
//METAGUARD; in$enq; ( ( windex + 1 ) % 2 ) != rindex;
//METAGUARD; out$deq; rindex != windex;
//METABEFORE; out$first; :in$enq__ENA; :out$deq__ENA
//METAGUARD; out$first; rindex != windex;
//METASTART; Lpm
//METAEXTERNAL; ind; l_ainterface_OC_LpmIndication;
//METAINTERNAL; inQ; Fifo1_OC_4;
//METAINTERNAL; fifo; Fifo2;
//METAINTERNAL; outQ; Fifo1_OC_4;
//METAINTERNAL; mem; LpmMemory;
//METAINVOKE; RULEenter__ENA; :fifo$in$enq__ENA;:inQ$out$deq__ENA;:inQ$out$first;:mem$ifc$req__ENA;
//METAEXCLUSIVE; RULEenter__ENA; RULErecirc__ENA
//METAGUARD; RULEenter; inQ$out$first__RDY & inQ$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY;
//METAINVOKE; RULEexit_rule__ENA; :fifo$out$deq__ENA;:fifo$out$first;:mem$ifc$resAccept__ENA;:mem$ifc$resValue;:outQ$in$enq__ENA;
//METAEXCLUSIVE; RULEexit_rule__ENA; RULErecirc__ENA
//METAGUARD; RULEexit_rule; fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & outQ$in$enq__RDY;
//METAINVOKE; RULErecirc__ENA; :fifo$in$enq__ENA;:fifo$out$deq__ENA;:fifo$out$first;:mem$ifc$req__ENA;:mem$ifc$resAccept__ENA;:mem$ifc$resValue;
//METAGUARD; RULErecirc; fifo$out$first__RDY & mem$ifc$resValue__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY;
//METAINVOKE; RULErespond__ENA; :ind$heard__ENA;:outQ$out$deq__ENA;:outQ$out$first;
//METAGUARD; RULErespond; outQ$out$first__RDY & outQ$out$deq__RDY & ind$heard__RDY;
//METAINVOKE; request$say__ENA; :inQ$in$enq__ENA;
//METAGUARD; request$say; inQ$in$enq__RDY;
//METARULES; RULEenter; RULEexit_rule; RULErecirc; RULErespond
//METAPRIORITY; recirc; enter;exit
//METASTART; LpmMemory
//METAEXCLUSIVE; RULEmemdelay_rule__ENA; ifc$req__ENA; ifc$resAccept__ENA
//METAGUARD; RULEmemdelay_rule; delayCount > 1;
//METAEXCLUSIVE; ifc$req__ENA; ifc$resAccept__ENA
//METAGUARD; ifc$req; delayCount == 32'd0;
//METAGUARD; ifc$resAccept; delayCount == 32'd1;
//METABEFORE; ifc$resValue; :ifc$req__ENA
//METAGUARD; ifc$resValue; delayCount == 32'd1;
//METARULES; RULEmemdelay_rule
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
`endif
