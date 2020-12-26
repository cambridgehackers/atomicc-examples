`include "atomicclib.vh"

//METASTART; SelectOut
//METAINTERNAL; in__deq__RDY_orCC; SelectIndex(funnelWidth=20,width=14);
//METAINTERNAL; in__first_orCC; SelectIndex(funnelWidth=20,width=14);
//METAINTERNAL; in__first__RDY_orCC; SelectIndex(funnelWidth=20,width=14);
//METAGUARD; select; 1'd1;
//METAINVOKE; out.deq__ENA; :in[__inst$Genvar1].deq__ENA;
//METAGUARD; out.deq; indexValid && in__deq__RDY_or1;
//METAGUARD; out.first; in__first__RDY_or1;
