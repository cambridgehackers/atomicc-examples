`ifndef __memory_GENERATED__VH__
`define __memory_GENERATED__VH__

//METASTART; LpmMemory
//METAEXCLUSIVE; req__ENA; RULE$memdelay_rule__ENA; resAccept__ENA
//METAGUARD; req; delayCount == 0;
//METAEXCLUSIVE; resAccept__ENA; RULE$memdelay_rule__ENA
//METAGUARD; resAccept; delayCount == 1;
//METAGUARD; resValue; delayCount == 1;
//METAGUARD; RULE$memdelay_rule; delayCount > 1;
//METARULES; RULE$memdelay_rule
`endif
