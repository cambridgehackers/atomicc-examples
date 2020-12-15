`ifndef __spi_GENERATED__VH__
`define __spi_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __ClockDivIFC_DEF__
`define __ClockDivIFC_DEF__
interface ClockDivIFC;
    logic  CLK;
    logic  CLK_OUT;
    logic  nRST;
    modport server (input  CLK, nRST,
                    output CLK_OUT);
    modport client (output CLK, nRST,
                    input  CLK_OUT);
endinterface
`endif
`ifndef __SPIMasterIfc_DEF__
`define __SPIMasterIfc_DEF__
interface SPIMasterIfc#(width = 26);
    logic  CLK;
    logic  nRST;
    logic  clock;
    logic  mosi;
    logic  miso;
    modport server (input  miso,
                    output clock, mosi);
    modport client (output miso,
                    input  clock, mosi);
endinterface
`endif
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
`endif
