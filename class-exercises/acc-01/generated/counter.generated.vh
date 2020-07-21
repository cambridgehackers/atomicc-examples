`ifndef __counter_GENERATED__VH__
`define __counter_GENERATED__VH__

//METASTART; Counter
//METAEXCLUSIVE; startSignal__ENA; RULE$decRule__ENA
//METAGUARD; startSignal; counter == 0;
//METAGUARD; busy; 1;
//METAGUARD; RULE$decRule; !( counter == 0 );
//METAGUARD; RULE$init; 1;
//METARULES; RULE$decRule; RULE$init
`endif
