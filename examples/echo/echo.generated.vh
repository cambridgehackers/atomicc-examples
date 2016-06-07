`ifndef __echo_GENERATED__VH__
`define __echo_GENERATED__VH__

//METASTART; l_class_OC_Echo
//METAINVOKE; respond_rule; :fifo$out$deq;:fifo$out$first;:ind$heard;
//METAGUARD; respond_rule; (fifo$out$first__RDY & fifo$out$deq__RDY) & ind$heard__RDY;
//METAINVOKE; say; :fifo$in$enq;
//METAGUARD; say; fifo$in$enq__RDY;
//METARULES; respond_rule
//METAINTERNAL; fifo; l_class_OC_Fifo1;
//METAEXTERNAL; ind; l_class_OC_EchoIndication;
`endif
