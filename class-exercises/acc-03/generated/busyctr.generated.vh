`ifndef __busyctr_GENERATED__VH__
`define __busyctr_GENERATED__VH__

//METASTART; BusyCtr
//METAEXCLUSIVE; startSignal__ENA; RULE$decRule__ENA
//METAGUARD; startSignal; counter == 0;
//METAGUARD; busy; 1;
//METAGUARD; RULE$decRule; counter != 0;
//METAGUARD; RULE$verify0; 1;
//METARULES; RULE$decRule; RULE$verify0
`endif
