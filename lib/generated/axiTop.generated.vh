`ifndef __axiTop_GENERATED__VH__
`define __axiTop_GENERATED__VH__
`include "atomicclib.vh"

`ifndef __ReadResp_DEF__
`define __ReadResp_DEF__
typedef struct packed {
    logic [6 - 1:0] id;
    logic [32 - 1:0] data;
} ReadResp;
`endif
`ifndef __ZynqInterruptT_DEF__
`define __ZynqInterruptT_DEF__
interface ZynqInterruptT;
    logic  interrupt;
    logic  CLK;
    logic  nRST;
    modport server (output interrupt);
    modport client (input  interrupt);
endinterface
`endif
`ifndef __MaxiO_DEF__
`define __MaxiO_DEF__
interface MaxiO;
    logic AR__ENA;
    logic [32 - 1:0] AR$addr;
    logic [12 - 1:0] AR$id;
    logic [4 - 1:0] AR$len;
    logic AR__RDY;
    logic AW__ENA;
    logic [32 - 1:0] AW$addr;
    logic [12 - 1:0] AW$id;
    logic [4 - 1:0] AW$len;
    logic AW__RDY;
    logic W__ENA;
    logic [32 - 1:0] W$data;
    logic [12 - 1:0] W$id;
    logic  W$last;
    logic W__RDY;
    modport server (input  AR__ENA, AR$addr, AR$id, AR$len, AW__ENA, AW$addr, AW$id, AW$len, W__ENA, W$data, W$id, W$last,
                    output AR__RDY, AW__RDY, W__RDY);
    modport client (output AR__ENA, AR$addr, AR$id, AR$len, AW__ENA, AW$addr, AW$id, AW$len, W__ENA, W$data, W$id, W$last,
                    input  AR__RDY, AW__RDY, W__RDY);
endinterface
`endif
`ifndef __MaxiI_DEF__
`define __MaxiI_DEF__
interface MaxiI;
    logic R__ENA;
    logic [32 - 1:0] R$data;
    logic [12 - 1:0] R$id;
    logic  R$last;
    logic [2 - 1:0] R$resp;
    logic R__RDY;
    logic B__ENA;
    logic [12 - 1:0] B$id;
    logic [2 - 1:0] B$resp;
    logic B__RDY;
    modport server (input  R__ENA, R$data, R$id, R$last, R$resp, B__ENA, B$id, B$resp,
                    output R__RDY, B__RDY);
    modport client (output R__ENA, R$data, R$id, R$last, R$resp, B__ENA, B$id, B$resp,
                    input  R__RDY, B__RDY);
endinterface
`endif
`ifndef __PipeIn_OC_7_DEF__
`define __PipeIn_OC_7_DEF__
interface PipeIn_OC_7#(width = 32);
    logic enq__ENA;
    logic [width - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeOut_OC_8_DEF__
`define __PipeOut_OC_8_DEF__
interface PipeOut_OC_8#(width = 32);
    logic deq__ENA;
    logic deq__RDY;
    logic first;
    logic first__RDY;
    modport server (input  deq__ENA, first,
                    output deq__RDY, first__RDY);
    modport client (output deq__ENA, first,
                    input  deq__RDY, first__RDY);
endinterface
`endif
`ifndef __PipeIn_OC_14_DEF__
`define __PipeIn_OC_14_DEF__
interface PipeIn_OC_14#(width = 38);
    logic enq__ENA;
    logic [width - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeOut_OC_15_DEF__
`define __PipeOut_OC_15_DEF__
interface PipeOut_OC_15#(width = 38);
    logic deq__ENA;
    logic deq__RDY;
    logic first;
    logic first__RDY;
    modport server (input  deq__ENA, first,
                    output deq__RDY, first__RDY);
    modport client (output deq__ENA, first,
                    input  deq__RDY, first__RDY);
endinterface
`endif
`ifndef __PipeIn_OC_2_DEF__
`define __PipeIn_OC_2_DEF__
interface PipeIn_OC_2#(width = 6);
    logic enq__ENA;
    logic [width - 1:0] enq$v;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v,
                    input  enq__RDY);
endinterface
`endif
`ifndef __PipeOut_DEF__
`define __PipeOut_DEF__
interface PipeOut#(width = 6);
    logic deq__ENA;
    logic deq__RDY;
    logic first;
    logic first__RDY;
    modport server (input  deq__ENA, first,
                    output deq__RDY, first__RDY);
    modport client (output deq__ENA, first,
                    input  deq__RDY, first__RDY);
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
`ifndef __PipeInB_DEF__
`define __PipeInB_DEF__
interface PipeInB#(width = 32);
    logic enq__ENA;
    logic [width - 1:0] enq$v;
    logic  enq$last;
    logic enq__RDY;
    modport server (input  enq__ENA, enq$v, enq$last,
                    output enq__RDY);
    modport client (output enq__ENA, enq$v, enq$last,
                    input  enq__RDY);
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
//METASTART; AxiTop
//METAINTERNAL; reqArs; Fifo1Base(width=6);
//METAINTERNAL; reqAws; Fifo1Base(width=6);
//METAINTERNAL; writeDone; Fifo1Base(width=6);
//METAINTERNAL; requestValue; Fifo1Base(width=32);
//METAINTERNAL; readData; Fifo1Base(width=38);
//METAINTERNAL; writeData; Fifo1Base(width=32);
//METAINTERNAL; user; UserTop;
//METAINVOKE; MAXIGP0_O$AR__ENA; :reqArs$in$enq__ENA;
//METAEXCLUSIVE; MAXIGP0_O$AR__ENA; RULE$lread__ENA
//METAGUARD; MAXIGP0_O$AR; reqArs$in$enq__RDY;
//METAINVOKE; MAXIGP0_O$AW__ENA; :reqAws$in$enq__ENA;
//METAEXCLUSIVE; MAXIGP0_O$AW__ENA; RULE$lwrite__ENA
//METAGUARD; MAXIGP0_O$AW; reqAws$in$enq__RDY;
//METAINVOKE; MAXIGP0_O$W__ENA; :writeData$in$enq__ENA;
//METAGUARD; MAXIGP0_O$W; writeData$in$enq__RDY;
//METAINVOKE; readUser$enq__ENA; :requestValue$in$enq__ENA;
//METAGUARD; readUser$enq; requestValue$in$enq__RDY;
//METABEFORE; RULE$init__ENA; :RULE$lwrite__ENA
//METAGUARD; RULE$init; 1;
//METAINVOKE; RULE$lread__ENA; 1:readData$in$enq__ENA;readCount == 0:reqArs$out$deq__ENA;:reqArs$out$first;!( portalRControl || ( !( readAddr == 0 ) ) ):requestValue$out$deq__ENA;!( portalRControl || ( !( readAddr == 0 ) ) ):requestValue$out$first;
//METABEFORE; RULE$lread__ENA; :MAXIGP0_O$AR__ENA
//METAGUARD; RULE$lread; reqArs$out$first__RDY && ( ( portalRControl && readData$in$enq__RDY && ( reqArs$out$deq__RDY || ( !( readCount == 0 ) ) ) ) || ( ( !portalRControl ) && readData$in$enq__RDY && ( ( requestValue$out$first__RDY && ( ( requestValue$out$deq__RDY && ( reqArs$out$deq__RDY || ( !( readCount == 0 ) ) ) ) || ( ( !requestValue$out$deq__RDY ) && ( !( ( readAddr == 0 ) || ( !( reqArs$out$deq__RDY || ( !( readCount == 0 ) ) ) ) ) ) ) ) ) || ( ( !requestValue$out$first__RDY ) && ( !( ( readAddr == 0 ) || ( !( reqArs$out$deq__RDY || ( !( readCount == 0 ) ) ) ) ) ) ) ) ) );
//METAINVOKE; RULE$lreadData__ENA; :MAXIGP0_I$R__ENA;:readData$out$deq__ENA;:readData$out$first;
//METAGUARD; RULE$lreadData; readData$out$first__RDY && MAXIGP0_I$R__RDY && readData$out$deq__RDY;
//METAINVOKE; RULE$lwrite__ENA; writeCount == 0:reqAws$out$deq__ENA;:reqAws$out$first;!portalWControl:user$write$enq__ENA;:writeData$out$deq__ENA;:writeData$out$first;writeCount == 0:writeDone$in$enq__ENA;
//METABEFORE; RULE$lwrite__ENA; :MAXIGP0_O$AW__ENA
//METAGUARD; RULE$lwrite; reqAws$out$first__RDY && writeData$out$first__RDY && ( ( portalWControl && writeData$out$deq__RDY && ( ( writeDone$in$enq__RDY && ( reqAws$out$deq__RDY || ( !( writeCount == 0 ) ) ) ) || ( ( !writeDone$in$enq__RDY ) && ( !( writeCount == 0 ) ) ) ) ) || ( ( !portalWControl ) && writeData$out$deq__RDY && ( ( writeDone$in$enq__RDY && ( ( ( writeCount == 0 ) && user$write$enq__RDY && reqAws$out$deq__RDY ) || ( ( !( writeCount == 0 ) ) && user$write$enq__RDY ) ) ) || ( ( !writeDone$in$enq__RDY ) && ( !( ( writeCount == 0 ) || ( !user$write$enq__RDY ) ) ) ) ) ) );
//METAINVOKE; RULE$writeResponse__ENA; :MAXIGP0_I$B__ENA;:writeDone$out$deq__ENA;:writeDone$out$first;
//METAGUARD; RULE$writeResponse; writeDone$out$first__RDY && MAXIGP0_I$B__RDY && writeDone$out$deq__RDY;
//METARULES; RULE$init; RULE$lread; RULE$lreadData; RULE$lwrite; RULE$writeResponse
//METACONNECT; readUser$enq__ENA; user$read$enq__ENA
//METACONNECT; readUser$enq__RDY; user$read$enq__RDY
`endif
