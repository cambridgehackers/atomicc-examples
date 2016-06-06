`ifndef __lpm_GENERATED__VH__
`define __lpm_GENERATED__VH__

`define l_class_OC_Fifo1_RULE_COUNT (0)

//METAEXCLUSIVE; out$deq; in$enq
//METAGUARD; out$deq; full;
//METAGUARD; in$enq; full ^ 1;
//METABEFORE; out$first; :in$enq
//METAGUARD; out$first; full;
`define l_class_OC_LpmMemory_RULE_COUNT (1)

//METAEXCLUSIVE; memdelay; req; resAccept
//METABEFORE; memdelay; :req; :resAccept
//METAGUARD; memdelay; delayCount > 1;
//METAEXCLUSIVE; req; resAccept
//METAGUARD; req; delayCount == 0;
//METAGUARD; resAccept; delayCount == 1;
//METABEFORE; resValue; :req
//METAGUARD; resValue; delayCount == 1;
//METARULES; memdelay
`define l_class_OC_Fifo1_OC_0_RULE_COUNT (0)

//METAEXCLUSIVE; out$deq; in$enq
//METAGUARD; out$deq; full;
//METAGUARD; in$enq; full ^ 1;
//METABEFORE; out$first; :in$enq
//METAGUARD; out$first; full;
`define l_class_OC_Fifo2_RULE_COUNT (0)

//METAGUARD; out$deq; rindex != windex;
//METAGUARD; in$enq; ((windex + 1) % 2) != rindex;
//METABEFORE; out$first; :out$deq
//METAGUARD; out$first; rindex != windex;
`define l_class_OC_Lpm_RULE_COUNT (4 + `l_class_OC_Fifo1_OC_0_RULE_COUNT + `l_class_OC_Fifo2_RULE_COUNT + `l_class_OC_Fifo1_OC_0_RULE_COUNT + `l_class_OC_LpmMemory_RULE_COUNT)

//METAINVOKE; enter; :fifo$in$enq;:inQ$out$deq;:inQ$out$first;:mem$req;
//METAEXCLUSIVE; enter; recirc
//METAGUARD; enter; ((inQ$out$first__RDY & inQ$out$deq__RDY) & fifo$in$enq__RDY) & mem$req__RDY;
//METAINVOKE; exit; :fifo$out$deq;:fifo$out$first;:mem$resAccept;:mem$resValue;:outQ$in$enq;
//METAEXCLUSIVE; exit; recirc
//METAGUARD; exit; (((fifo$out$first__RDY & mem$resValue__RDY) & mem$resAccept__RDY) & fifo$out$deq__RDY) & outQ$in$enq__RDY;
//METAINVOKE; recirc; :fifo$in$enq;:fifo$out$deq;:fifo$out$first;:mem$req;:mem$resAccept;:mem$resValue;
//METAGUARD; recirc; ((((fifo$out$first__RDY & mem$resValue__RDY) & mem$resAccept__RDY) & fifo$out$deq__RDY) & fifo$in$enq__RDY) & mem$req__RDY;
//METAINVOKE; respond; :indication$heard;:outQ$out$deq;:outQ$out$first;
//METAGUARD; respond; (outQ$out$first__RDY & outQ$out$deq__RDY) & indication$heard__READY;
//METAINVOKE; say; :inQ$in$enq;
//METAGUARDV; say; inQ$in$enq__RDY;
//METARULES; enter; exit; recirc; respond
//METAPRIORITY; recirc; enter;exit
//METAINTERNAL; inQ; l_class_OC_Fifo1_OC_0;
//METAINTERNAL; fifo; l_class_OC_Fifo2;
//METAINTERNAL; outQ; l_class_OC_Fifo1_OC_0;
//METAINTERNAL; mem; l_class_OC_LpmMemory;
//METAEXTERNAL; indication; l_class_OC_LpmIndication;
`define l_class_OC_foo_RULE_COUNT (0)

//METAGUARDV; indication$heard; 1;
`endif