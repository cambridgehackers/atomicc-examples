`ifndef __clock_GENERATED__VH__
`define __clock_GENERATED__VH__

//METASTART; Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METAGUARD; out$first; full;
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
//METAGUARD; RULEhandshake; 1;
//METAGUARD; RULEiobufs_0; 1;
//METAGUARD; RULEiobufs_10; 1;
//METAGUARD; RULEiobufs_11; 1;
//METAGUARD; RULEiobufs_12; 1;
//METAGUARD; RULEiobufs_13; 1;
//METAGUARD; RULEiobufs_14; 1;
//METAGUARD; RULEiobufs_15; 1;
//METAGUARD; RULEiobufs_1; 1;
//METAGUARD; RULEiobufs_2; 1;
//METAGUARD; RULEiobufs_3; 1;
//METAGUARD; RULEiobufs_4; 1;
//METAGUARD; RULEiobufs_5; 1;
//METAGUARD; RULEiobufs_6; 1;
//METAGUARD; RULEiobufs_7; 1;
//METAGUARD; RULEiobufs_8; 1;
//METAGUARD; RULEiobufs_9; 1;
//METARULES; RULEhandshake; RULEiobufs_0; RULEiobufs_1; RULEiobufs_10; RULEiobufs_11; RULEiobufs_12; RULEiobufs_13; RULEiobufs_14; RULEiobufs_15; RULEiobufs_2; RULEiobufs_3; RULEiobufs_4; RULEiobufs_5; RULEiobufs_6; RULEiobufs_7; RULEiobufs_8; RULEiobufs_9
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
