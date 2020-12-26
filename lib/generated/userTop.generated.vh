`include "atomicclib.vh"

//METASTART; UserTop
//METAINTERNAL; radapter_0; AdapterToBus(width=128,owidth=32);
//METAINTERNAL; out2; Out2InLast(width=32);
//METAINTERNAL; wadapter_0; AdapterFromBus(owidth=32,width=144);
//METAINTERNAL; ctop; l_top;
//METAINVOKE; wad.enq__ENA; :ctop$request.enq__ENA;
//METAGUARD; wad.enq; ctop$request.enq__RDY;
//METAINVOKE; indication.enq__ENA; :radapter_0$in.enq__ENA;
//METAGUARD; indication.enq; radapter_0$in.enq__RDY;
//METACONNECT; wadapter_0$in.enq__ENA; write.enq__ENA
//METACONNECT; wadapter_0$in.enq__RDY; write.enq__RDY
//METACONNECT; out2$in.deq__ENA; radapter_0$out.deq__ENA
//METACONNECT; out2$in.deq__RDY; radapter_0$out.deq__RDY
//METACONNECT; out2$in.first; radapter_0$out.first
//METACONNECT; out2$in.first__RDY; radapter_0$out.first__RDY
//METACONNECT; out2$in.last; radapter_0$out.last
//METACONNECT; out2$in.last__RDY; radapter_0$out.last__RDY
//METACONNECT; read.enq__ENA; out2$out.enq__ENA
//METACONNECT; read.enq__RDY; out2$out.enq__RDY
//METACONNECT; wad.enq__ENA; wadapter_0$out.enq__ENA
//METACONNECT; wad.enq__RDY; wadapter_0$out.enq__RDY
//METACONNECT; indication.enq__ENA; ctop$indication.enq__ENA
//METACONNECT; indication.enq__RDY; ctop$indication.enq__RDY
