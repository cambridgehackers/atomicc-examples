`ifndef __memory_GENERATED__VH__
`define __memory_GENERATED__VH__

//METASTART; LpmMemory
//METAEXCLUSIVE; RULE$memdelay_rule__ENA; ifc$req__ENA; ifc$resAccept__ENA
//METAGUARD; RULE$memdelay_rule; delayCount > 1;
//METAEXCLUSIVE; ifc$req__ENA; ifc$resAccept__ENA
//METAGUARD; ifc$req; delayCount == 32'd0;
//METAGUARD; ifc$resAccept; delayCount == 32'd1;
//METAGUARD; ifc$resValue; delayCount == 32'd1;
//METARULES; RULE$memdelay_rule
`endif
