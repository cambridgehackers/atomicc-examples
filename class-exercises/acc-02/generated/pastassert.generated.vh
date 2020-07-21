`ifndef __pastassert_GENERATED__VH__
`define __pastassert_GENERATED__VH__

//METASTART; PastAssert
//METAEXCLUSIVE; startSignal__ENA; RULE$decRule__ENA
//METAGUARD; startSignal; counter == 0;
//METAGUARD; busy; 1;
//METAGUARD; RULE$decRule; !( counter == 0 );
//METAGUARD; RULE$verify0; 1;
//METAGUARD; RULE$verify1a; F_TESTID == 1;
//METAGUARD; RULE$verify1b; F_TESTID == 1;
//METAGUARD; RULE$verify2a; F_TESTID == 2;
//METAGUARD; RULE$verify2b; F_TESTID == 2;
//METAINVOKE; RULE$verify3a__ENA; :$past;$past{ startSignal__ENA }:$past;
//METAEXCLUSIVE; RULE$verify3a__ENA; RULE$verify4b__ENA
//METABEFORE; RULE$verify3a__ENA; :RULE$decRule__ENA; :startSignal__ENA
//METAGUARD; RULE$verify3a; ( F_TESTID == 3 ) && $past__RDY;
//METAGUARD; RULE$verify4a; F_TESTID == 4;
//METAINVOKE; RULE$verify4b__ENA; $past{ startSignal__ENA } && fPastValid:$past;fPastValid:$past;
//METABEFORE; RULE$verify4b__ENA; :RULE$decRule__ENA; :startSignal__ENA
//METAGUARD; RULE$verify4b; ( F_TESTID == 4 ) && ( $past__RDY || ( !fPastValid ) );
//METARULES; RULE$decRule; RULE$verify0; RULE$verify1a; RULE$verify1b; RULE$verify2a; RULE$verify2b; RULE$verify3a; RULE$verify4a; RULE$verify4b
`endif
