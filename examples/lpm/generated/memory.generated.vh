`ifndef __memory_GENERATED__VH__
`define __memory_GENERATED__VH__

//METASTART; LpmMemory
//METAEXCLUSIVE; ifc$req__ENA; RULE$memdelay_rule__ENA; ifc$resAccept__ENA
//METAGUARD; ifc$req; delayCount == 0;
//METAEXCLUSIVE; ifc$resAccept__ENA; RULE$memdelay_rule__ENA
//METAGUARD; ifc$resAccept; delayCount == 1;
//METAGUARD; ifc$resValue; delayCount == 1;
//METAGUARD; RULE$memdelay_rule; delayCount > 1;
//METARULES; RULE$memdelay_rule
`endif
