`ifndef __vsimTop_GENERATED__VH__
`define __vsimTop_GENERATED__VH__

//METASTART; Fifo1
//METAEXCLUSIVE; in$enq__ENA; out$deq__ENA
//METAGUARD; in$enq; !full;
//METAGUARD; out$deq; full;
//METABEFORE; out$first; :in$enq__ENA
//METASTART; MuxPipe
//METAEXTERNAL; out; l_ainterface_OC_PipeIn;
//METAINTERNAL; forwardFifo; Fifo1;
//METAINVOKE; RULEfifoRule__ENA; :forwardFifo$out$deq__ENA;:forwardFifo$out$first;:out$enq__ENA;
//METAEXCLUSIVE; RULEfifoRule__ENA; in$enq__ENA
//METAGUARD; RULEfifoRule; forwardFifo$out$deq__RDY & out$enq__RDY;
//METAINVOKE; forward$enq__ENA; :forwardFifo$in$enq__ENA;
//METAGUARD; forward$enq; forwardFifo$in$enq__RDY;
//METAINVOKE; in$enq__ENA; :out$enq__ENA;
//METAGUARD; in$enq; out$enq__RDY;
//METARULES; RULEfifoRule
//METASTART; ResetInverter
//METASTART; VsimTop
//METAINTERNAL; user; UserTop;
//METAINTERNAL; sink_0; VsimReceive;
//METAINTERNAL; source_0; VsimSend;
//METAINVOKE; readUser$enq__ENA; :source_0$beat__ENA;
//METAGUARD; readUser$enq; source_0$beat__RDY;
//METAINVOKE; writeUser$beat__ENA; :user$write$enq__ENA;
//METAGUARD; writeUser$beat; user$write$enq__RDY;
//METACONNECT; readUser$enq__ENA; user$read$enq__ENA
//METACONNECT; readUser$enq__RDY; user$read$enq__RDY
//METACONNECT; sink_0$$beat__ENA; writeUser$beat__ENA
//METACONNECT; sink_0$$beat__RDY; writeUser$beat__RDY
`endif
