`ifndef __userTop_GENERATED__VH__
`define __userTop_GENERATED__VH__

//METASTART; UserTop
//METAINTERNAL; radapter_0; AdapterToBus(width=32);
//METAINTERNAL; wadapter_0; AdapterFromBus(width=32);
//METAINTERNAL; ctop; l_top;
//METAINVOKE; wad$enq__ENA; :ctop$request$enq__ENA;
//METAGUARD; wad$enq; ctop$request$enq__RDY;
//METAINVOKE; indication$enq__ENA; :radapter_0$in$enq__ENA;
//METAGUARD; indication$enq; radapter_0$in$enq__RDY;
//METACONNECT; write$enq__ENA; wadapter_0$in$enq__ENA
//METACONNECT; write$enq__RDY; wadapter_0$in$enq__RDY
//METACONNECT; read$enq__ENA; radapter_0$out$enq__ENA
//METACONNECT; read$enq__RDY; radapter_0$out$enq__RDY
//METACONNECT; wad$enq__ENA; wadapter_0$out$enq__ENA
//METACONNECT; wad$enq__RDY; wadapter_0$out$enq__RDY
//METACONNECT; indication$enq__ENA; ctop$indication$enq__ENA
//METACONNECT; indication$enq__RDY; ctop$indication$enq__RDY
`endif
