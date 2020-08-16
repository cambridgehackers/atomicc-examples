`ifndef __userTop_GENERATED__VH__
`define __userTop_GENERATED__VH__
`include "atomicclib.vh"

//METASTART; UserTop
//METAINTERNAL; radapter_0; AdapterToBus(width=32);
//METAINTERNAL; wadapter_0; AdapterFromBus(width=32);
//METAINTERNAL; ctop; l_top;
//METACONNECT; wadapter_0$in.enq__ENA; write.enq__ENA
//METACONNECT; wadapter_0$in.enq__RDY; write.enq__RDY
//METACONNECT; read.enq__ENA; radapter_0$out.enq__ENA
//METACONNECT; read.enq__RDY; radapter_0$out.enq__RDY
//METACONNECT; ctop$request.enq__ENA; wadapter_0$out.enq__ENA
//METACONNECT; ctop$request.enq__RDY; wadapter_0$out.enq__RDY
//METACONNECT; ctop$indication.enq__ENA; radapter_0$in.enq__ENA
//METACONNECT; ctop$indication.enq__RDY; radapter_0$in.enq__RDY
`endif
