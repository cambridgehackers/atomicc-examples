`include "atomicclib.vh"

//METASTART; SPIMaster
//METAINTERNAL; clockDivider; ClockDiv;
//METAINTERNAL; spi; SPIMasterInternal(width=26);
//METAGUARD; request.enq; 1'd1;
//METAGUARD; spiresponse.enq; 1'd1;
//METAGUARD; RULE$init; 1'd1;
//METARULES; RULE$init
//METACONNECT; spiresponse.enq__ENA; spi$response.enq__ENA
//METACONNECT; spiresponse.enq__RDY; spi$response.enq__RDY
//METASTART; SPIMasterInternal
//METAINVOKE; RULE$running__ENA; countreg == 1:response.enq__ENA;
//METAEXCLUSIVE; RULE$running__ENA; request.enq__ENA
//METAGUARD; RULE$running; ( ( countreg > 0 ) != 0 ) && ( response.enq__RDY || ( countreg != 1 ) );
//METAGUARD; request.enq; countreg == 0;
//METABEFORE; RULE$init__ENA; :RULE$running__ENA; :request.enq__ENA
//METAGUARD; RULE$init; 1'd1;
//METARULES; RULE$running; RULE$init
