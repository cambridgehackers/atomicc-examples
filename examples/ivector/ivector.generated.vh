`ifndef __ivector_GENERATED__VH__
`define __ivector_GENERATED__VH__

//METASTART; l_class_OC_Fifo1
//METAEXCLUSIVE; out$deq; in$enq
//METAGUARD; out$deq; full;
//METAGUARD; in$enq; full ^ 1;
//METABEFORE; out$first; :in$enq
//METAGUARD; out$first; full;
//METASTART; l_class_OC_Fifo1_OC_3
//METAEXCLUSIVE; out$deq; in$enq
//METAGUARD; out$deq; full;
//METAGUARD; in$enq; full ^ 1;
//METABEFORE; out$first; :in$enq
//METAGUARD; out$first; full;
//METASTART; l_class_OC_FifoPong
//METAINTERNAL; element1; l_class_OC_Fifo1_OC_3;
//METAINTERNAL; element2; l_class_OC_Fifo1_OC_3;
//METAINVOKE; out$deq; pong ^ 1:element1$out$deq;pong:element2$out$deq;
//METAGUARD; out$deq; (element2$out$deq__RDY | (pong ^ 1)) & (element1$out$deq__RDY | pong);
//METAINVOKE; in$enq; pong ^ 1:element1$in$enq;pong:element2$in$enq;
//METAGUARD; in$enq; (element2$in$enq__RDY | (pong ^ 1)) & (element1$in$enq__RDY | pong);
//METAINVOKE; out$first; pong ^ 1:element1$out$first;pong:element2$out$first;
//METAGUARD; out$first; (element2$out$first__RDY | (pong ^ 1)) & (element1$out$first__RDY | pong);
//METASTART; l_class_OC_IVector
//METAINTERNAL; fifo0; l_class_OC_FifoPong;
//METAINTERNAL; fifo1; l_class_OC_FifoPong;
//METAINTERNAL; fifo2; l_class_OC_FifoPong;
//METAINTERNAL; fifo3; l_class_OC_FifoPong;
//METAINTERNAL; fifo4; l_class_OC_FifoPong;
//METAINTERNAL; fifo5; l_class_OC_FifoPong;
//METAINTERNAL; fifo6; l_class_OC_FifoPong;
//METAINTERNAL; fifo7; l_class_OC_FifoPong;
//METAINTERNAL; fifo8; l_class_OC_FifoPong;
//METAINTERNAL; fifo9; l_class_OC_FifoPong;
//METAINTERNAL; fifo10; l_class_OC_FifoPong;
//METAEXTERNAL; ind; l_class_OC_IVectorIndication;
//METAINVOKE; respond0; :fifo0$out$deq;:fifo0$out$first;:ind$heard;
//METAEXCLUSIVE; respond0; respond1; respond2; respond3; respond4; respond5; respond6; respond7; respond8; respond9
//METAGUARD; respond0; (fifo0$out$first__RDY & fifo0$out$deq__RDY) & ind$heard__RDY;
//METAINVOKE; respond1; :fifo1$out$deq;:fifo1$out$first;:ind$heard;
//METAEXCLUSIVE; respond1; respond2; respond3; respond4; respond5; respond6; respond7; respond8; respond9
//METAGUARD; respond1; (fifo1$out$first__RDY & fifo1$out$deq__RDY) & ind$heard__RDY;
//METAINVOKE; respond2; :fifo2$out$deq;:fifo2$out$first;:ind$heard;
//METAEXCLUSIVE; respond2; respond3; respond4; respond5; respond6; respond7; respond8; respond9
//METAGUARD; respond2; (fifo2$out$first__RDY & fifo2$out$deq__RDY) & ind$heard__RDY;
//METAINVOKE; respond3; :fifo3$out$deq;:fifo3$out$first;:ind$heard;
//METAEXCLUSIVE; respond3; respond4; respond5; respond6; respond7; respond8; respond9
//METAGUARD; respond3; (fifo3$out$first__RDY & fifo3$out$deq__RDY) & ind$heard__RDY;
//METAINVOKE; respond4; :fifo4$out$deq;:fifo4$out$first;:ind$heard;
//METAEXCLUSIVE; respond4; respond5; respond6; respond7; respond8; respond9
//METAGUARD; respond4; (fifo4$out$first__RDY & fifo4$out$deq__RDY) & ind$heard__RDY;
//METAINVOKE; respond5; :fifo5$out$deq;:fifo5$out$first;:ind$heard;
//METAEXCLUSIVE; respond5; respond6; respond7; respond8; respond9
//METAGUARD; respond5; (fifo5$out$first__RDY & fifo5$out$deq__RDY) & ind$heard__RDY;
//METAINVOKE; respond6; :fifo6$out$deq;:fifo6$out$first;:ind$heard;
//METAEXCLUSIVE; respond6; respond7; respond8; respond9
//METAGUARD; respond6; (fifo6$out$first__RDY & fifo6$out$deq__RDY) & ind$heard__RDY;
//METAINVOKE; respond7; :fifo7$out$deq;:fifo7$out$first;:ind$heard;
//METAEXCLUSIVE; respond7; respond8; respond9
//METAGUARD; respond7; (fifo7$out$first__RDY & fifo7$out$deq__RDY) & ind$heard__RDY;
//METAINVOKE; respond8; :fifo8$out$deq;:fifo8$out$first;:ind$heard;
//METAEXCLUSIVE; respond8; respond9
//METAGUARD; respond8; (fifo8$out$first__RDY & fifo8$out$deq__RDY) & ind$heard__RDY;
//METAINVOKE; respond9; :fifo9$out$deq;:fifo9$out$first;:ind$heard;
//METAGUARD; respond9; (fifo9$out$first__RDY & fifo9$out$deq__RDY) & ind$heard__RDY;
//METAINVOKE; in$say; :(in$say_meth == 0 ? &fifo0:in$say_meth == 1 ? &fifo1:in$say_meth == 2 ? &fifo2:in$say_meth == 3 ? &fifo3:in$say_meth == 4 ? &fifo4:in$say_meth == 5 ? &fifo5:in$say_meth == 6 ? &fifo6:in$say_meth == 7 ? &fifo7:in$say_meth == 8 ? &fifo8:&fifo9)$in$enq;
//METAGUARD; in$say; ((((((((fifo0$in$enq__RDY & fifo1$in$enq__RDY) & fifo2$in$enq__RDY) & fifo3$in$enq__RDY) & fifo4$in$enq__RDY) & fifo5$in$enq__RDY) & fifo6$in$enq__RDY) & fifo7$in$enq__RDY) & fifo8$in$enq__RDY) & fifo9$in$enq__RDY;
//METARULES; respond0; respond1; respond2; respond3; respond4; respond5; respond6; respond7; respond8; respond9
`endif
