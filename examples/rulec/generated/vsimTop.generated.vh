`ifndef __vsimTop_GENERATED__VH__
`define __vsimTop_GENERATED__VH__

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
