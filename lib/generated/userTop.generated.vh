`ifndef __userTop_GENERATED__VH__
`define __userTop_GENERATED__VH__

//METASTART; UserTop
//METAEXTERNAL; read; PipeInB;
//METAINTERNAL; radapter_0; AdapterToBus;
//METAINTERNAL; wadapter_0; AdapterFromBus;
//METAINTERNAL; ctop; l_top;
//METAINVOKE; wad$enq__ENA; :ctop$request$enq__ENA;
//METAGUARD; wad$enq; ctop$request$enq__RDY;
//METAINVOKE; indication$enq__ENA; :radapter_0$in$enq__ENA;
//METAGUARD; indication$enq; radapter_0$in$enq__RDY;
//METACONNECT; ctop$indication$enq__ENA; indication$enq__ENA
//METACONNECT; ctop$indication$enq__RDY; indication$enq__RDY
//METACONNECT; wadapter_0$out$enq__ENA; wad$enq__ENA
//METACONNECT; wadapter_0$out$enq__RDY; wad$enq__RDY
//METACONNECT; write$enq__ENA; wadapter_0$in$enq__ENA
//METACONNECT; write$enq__RDY; wadapter_0$in$enq__RDY
//METACONNECT; read$enq__ENA; radapter_0$out$enq__ENA
//METACONNECT; read$enq__RDY; radapter_0$out$enq__RDY
`endif
