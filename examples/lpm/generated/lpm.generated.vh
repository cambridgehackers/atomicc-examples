`ifndef __lpm_GENERATED__VH__
`define __lpm_GENERATED__VH__

//METASTART; Lpm
//METAEXTERNAL; outQ; l_ainterface_OC_PipeIn;
//METAINTERNAL; compBuf; BufTicket;
//METAINTERNAL; inQ; Fifo1Base$__PARAM__$width$32;
//METAINTERNAL; fifo; FifoB1Base$__PARAM__$width$23;
//METAINTERNAL; mem; LpmMemory;
//METAINVOKE; RULE$enter__ENA; :compBuf$tickIfc$allocateTicket__ENA;:compBuf$tickIfc$getTicket;:fifo$in$enq__ENA;:inQ$out$deq__ENA;:inQ$out$first;:mem$ifc$req__ENA;
//METAEXCLUSIVE; RULE$enter__ENA; RULE$recirc__ENA
//METAGUARD; RULE$enter; ( RULE$recirc__ENA == 0 ) & inQ$out$first__RDY & compBuf$tickIfc$getTicket__RDY & compBuf$tickIfc$allocateTicket__RDY & inQ$out$deq__RDY & fifo$in$enq__RDY & mem$ifc$req__RDY;
//METAINVOKE; RULE$exitr__ENA; :fifo$out$deq__ENA;:fifo$out$first;:mem$ifc$resAccept__ENA;:mem$ifc$resValue;:outQ$enq__ENA;
//METAEXCLUSIVE; RULE$exitr__ENA; RULE$recirc__ENA
//METAGUARD; RULE$exitr; ( mem$ifc$resValue == 32'd1 ) & ( RULE$recirc__ENA == 0 ) & mem$ifc$resValue__RDY & fifo$out$first__RDY & mem$ifc$resAccept__RDY & fifo$out$deq__RDY & outQ$enq__RDY;
//METAINVOKE; RULE$recirc__ENA; :fifo$in$enq__ENA;:fifo$out$deq__ENA;:fifo$out$first;:mem$ifc$req__ENA;:mem$ifc$resAccept__ENA;:mem$ifc$resValue;
//METAGUARD; RULE$recirc; ( mem$ifc$resValue != 32'd1 ) & mem$ifc$resValue__RDY & fifo$out$first__RDY & mem$ifc$resAccept__RDY & mem$ifc$req__RDY & fifo$out$deq__RDY & fifo$in$enq__RDY;
//METAINVOKE; request$enter__ENA; :inQ$in$enq__ENA;
//METAGUARD; request$enter; inQ$in$enq__RDY;
//METARULES; RULE$enter; RULE$exitr; RULE$recirc
`endif
