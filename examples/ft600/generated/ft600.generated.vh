`ifndef __ft600_GENERATED__VH__
`define __ft600_GENERATED__VH__

//METASTART; l_module_OC_Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full ;
//METAGUARD; out$deq; full ;
//METAGUARD; out$first; full ;
//METASTART; l_module_OC_ModFt600
//METAINTERNAL; iobufs0; l_module_OC_IOBUF;
//METAINTERNAL; iobufs1; l_module_OC_IOBUF;
//METAINTERNAL; iobufs2; l_module_OC_IOBUF;
//METAINTERNAL; iobufs3; l_module_OC_IOBUF;
//METAINTERNAL; iobufs4; l_module_OC_IOBUF;
//METAINTERNAL; iobufs5; l_module_OC_IOBUF;
//METAINTERNAL; iobufs6; l_module_OC_IOBUF;
//METAINTERNAL; iobufs7; l_module_OC_IOBUF;
//METAINTERNAL; iobufs8; l_module_OC_IOBUF;
//METAINTERNAL; iobufs9; l_module_OC_IOBUF;
//METAINTERNAL; iobufs10; l_module_OC_IOBUF;
//METAINTERNAL; iobufs11; l_module_OC_IOBUF;
//METAINTERNAL; iobufs12; l_module_OC_IOBUF;
//METAINTERNAL; iobufs13; l_module_OC_IOBUF;
//METAINTERNAL; iobufs14; l_module_OC_IOBUF;
//METAINTERNAL; iobufs15; l_module_OC_IOBUF;
//METAGUARD; handshake; 1;
//METAGUARD; iobufs; 1;
//METARULES; handshake; iobufs
//METASTART; l_module_OC_MuxPipe
//METAEXTERNAL; out; l_ainterface_OC_PipeIn;
//METAINTERNAL; forwardFifo; l_module_OC_Fifo1;
//METAINVOKE; fifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:out$enq__ENA;
//METAEXCLUSIVE; fifoRule__ENA; in$enq__ENA
//METAGUARD; fifoRule; forwardFifo$out$first__RDY  & out$enq__RDY  & forwardFifo$out$deq__RDY ;
//METAINVOKE; forward$enq__ENA; :forwardFifo$in$enq__ENA;
//METAGUARD; forward$enq; forwardFifo$in$enq__RDY ;
//METAINVOKE; in$enq__ENA; :out$enq__ENA;
//METAGUARD; in$enq; out$enq__RDY ;
//METARULES; fifoRule
`endif