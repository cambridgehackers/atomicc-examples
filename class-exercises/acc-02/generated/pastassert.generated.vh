`ifndef __pastassert_GENERATED__VH__
`define __pastassert_GENERATED__VH__

//METASTART; PastAssert
//METAEXCLUSIVE; startSignal__ENA; RULE$decRule__ENA
//METAGUARD; startSignal; counter == 0;
//METAGUARD; busy; 1;
//METAGUARD; RULE$decRule; !( counter == 0 );
//METAINVOKE; RULE$verifyRule__ENA; $past{ startSignal__ENA } && ( F_TESTID == 3 ):$past;$past{ startSignal__ENA } && fPastValid && ( F_TESTID == 4 ):$past;F_TESTID == 3:$past;fPastValid && ( F_TESTID == 4 ):$past;
//METABEFORE; RULE$verifyRule__ENA; :RULE$decRule__ENA; :startSignal__ENA
//METAGUARD; RULE$verifyRule; 1;
//METARULES; RULE$decRule; RULE$verifyRule
`endif
