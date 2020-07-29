`ifndef __pastassert_GENERATED__VH__
`define __pastassert_GENERATED__VH__

//METASTART; PastAssert
//METAEXCLUSIVE; startSignal__ENA; RULE$decRule__ENA
//METAGUARD; startSignal; counter == 0;
//METAGUARD; busy; 1;
//METAGUARD; RULE$decRule; counter != 0;
//METABEFORE; RULE$verifyRule__ENA; :RULE$decRule__ENA; :startSignal__ENA
//METAGUARD; RULE$verifyRule; 1;
//METARULES; RULE$decRule; RULE$verifyRule
`endif
