`ifndef __adapter_GENERATED__VH__
`define __adapter_GENERATED__VH__

//METASTART; AdapterFromBus
//METAEXTERNAL; out; l_ainterface_OC_PipeInH;
//METAINVOKE; RULE$pushValue__ENA; :out$enq__ENA;
//METAEXCLUSIVE; RULE$pushValue__ENA; in$enq__ENA
//METAGUARD; RULE$pushValue; waitForEnq & out$enq__RDY;
//METAGUARD; in$enq; !waitForEnq;
//METARULES; RULE$pushValue
//METASTART; AdapterToBus
//METAEXTERNAL; out; l_ainterface_OC_PipeInB;
//METAINVOKE; RULE$copyRule__ENA; :out$enq__ENA;
//METAEXCLUSIVE; RULE$copyRule__ENA; in$enq__ENA
//METAGUARD; RULE$copyRule; !( ( remain == 16'd0 ) | ( !out$enq__RDY ) );
//METAGUARD; in$enq; remain == 16'd0;
//METARULES; RULE$copyRule
`endif
