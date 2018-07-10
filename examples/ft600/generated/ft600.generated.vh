`ifndef __ft600_GENERATED__VH__
`define __ft600_GENERATED__VH__

//METASTART; Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full ;
//METAGUARD; out$deq; full ;
//METAGUARD; out$first; full ;
//METASTART; ModFt600
//METAINTERNAL; iobufs0; IOBUF;
//METAINTERNAL; iobufs1; IOBUF;
//METAINTERNAL; iobufs2; IOBUF;
//METAINTERNAL; iobufs3; IOBUF;
//METAINTERNAL; iobufs4; IOBUF;
//METAINTERNAL; iobufs5; IOBUF;
//METAINTERNAL; iobufs6; IOBUF;
//METAINTERNAL; iobufs7; IOBUF;
//METAINTERNAL; iobufs8; IOBUF;
//METAINTERNAL; iobufs9; IOBUF;
//METAINTERNAL; iobufs10; IOBUF;
//METAINTERNAL; iobufs11; IOBUF;
//METAINTERNAL; iobufs12; IOBUF;
//METAINTERNAL; iobufs13; IOBUF;
//METAINTERNAL; iobufs14; IOBUF;
//METAINTERNAL; iobufs15; IOBUF;
//METAGUARD; handshake; 1;
//METAGUARD; iobufs; 1;
//METARULES; handshake; iobufs
//METASTART; MuxPipe
//METAEXTERNAL; out; l_ainterface_OC_PipeIn;
//METAINTERNAL; forwardFifo; Fifo1;
//METAINVOKE; fifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:out$enq__ENA;
//METAEXCLUSIVE; fifoRule__ENA; in$enq__ENA
//METAGUARD; fifoRule; forwardFifo$out$first__RDY  & out$enq__RDY  & forwardFifo$out$deq__RDY ;
//METAINVOKE; forward$enq__ENA; :forwardFifo$in$enq__ENA;
//METAGUARD; forward$enq; forwardFifo$in$enq__RDY ;
//METAINVOKE; in$enq__ENA; :out$enq__ENA;
//METAGUARD; in$enq; out$enq__RDY ;
//METARULES; fifoRule
`endif
