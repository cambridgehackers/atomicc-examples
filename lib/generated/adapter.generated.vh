`ifndef __adapter_GENERATED__VH__
`define __adapter_GENERATED__VH__

//METASTART; AdapterFromBus
//METAEXTERNAL; out; l_ainterface_OC_PipeInH;
//METAINVOKE; RULEpushValue__ENA; :out$enq__ENA;
//METAEXCLUSIVE; RULEpushValue__ENA; in$enq__ENA
//METAGUARD; RULEpushValue; waitForEnq & out$enq__RDY;
//METAGUARD; in$enq; !waitForEnq;
//METARULES; RULEpushValue
//METASTART; AdapterToBus
//METAEXTERNAL; out; l_ainterface_OC_PipeInB;
//METAINVOKE; RULEcopyRule__ENA; :out$enq__ENA;
//METAEXCLUSIVE; RULEcopyRule__ENA; in$enq__ENA
//METAGUARD; RULEcopyRule; ( remain != 16'd0 ) & out$enq__RDY;
//METAGUARD; in$enq; remain == 16'd0;
//METARULES; RULEcopyRule
`endif
