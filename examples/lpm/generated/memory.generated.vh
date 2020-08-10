`ifndef __memory_GENERATED__VH__
`define __memory_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __TickIfc_DEF__
`define __TickIfc_DEF__
interface TickIfc;
    logic getTicket;
    logic getTicket__RDY;
    logic allocateTicket__ENA;
    logic allocateTicket__RDY;
    modport server (input  getTicket, allocateTicket__ENA,
                    output getTicket__RDY, allocateTicket__RDY);
    modport client (output getTicket, allocateTicket__ENA,
                    input  getTicket__RDY, allocateTicket__RDY);
endinterface
`endif
`ifndef __PipeIn_OC_0_DEF__
`define __PipeIn_OC_0_DEF__
interface PipeIn_OC_0#(dataWidth = 32, funnelWidth = 99);
    logic enq__ENA;
    logic [dataWidth - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeIn_OC_1_DEF__
`define __PipeIn_OC_1_DEF__
interface PipeIn_OC_1#(dataWidth = 32, funnelWidth = 99);
    logic enq__ENA;
    logic [dataWidth - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __LpmMem_DEF__
`define __LpmMem_DEF__
interface LpmMem;
    logic req__ENA;
    logic [32 - 1:0] req$v;
    logic req__RDY;
    logic resAccept__ENA;
    logic resAccept__RDY;
    logic resValue;
    logic resValue__RDY;
    modport server (input  req__ENA, req$v, resAccept__ENA, resValue,
                    output req__RDY, resAccept__RDY, resValue__RDY);
    modport client (output req__ENA, req$v, resAccept__ENA, resValue,
                    input  req__RDY, resAccept__RDY, resValue__RDY);
endinterface
`endif
`ifndef __PipeIn_DEF__
`define __PipeIn_DEF__
interface PipeIn;
    logic enq__ENA;
    logic [(16 + 128) - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
//METASTART; LpmMemory
//METAEXCLUSIVE; req__ENA; RULE$memdelay_rule__ENA; resAccept__ENA
//METAGUARD; req; delayCount == 0;
//METAEXCLUSIVE; resAccept__ENA; RULE$memdelay_rule__ENA
//METAGUARD; resAccept; delayCount == 1;
//METAGUARD; resValue; delayCount == 1;
//METAGUARD; RULE$memdelay_rule; 0 != ( delayCount > 1 );
//METARULES; RULE$memdelay_rule
`endif
