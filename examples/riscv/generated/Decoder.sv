interface Decoder;
    logic [32 - 1:0] getOp;
    logic [32 - 1:0] getOp$inst;
    logic getOp__RDY;
    logic [32 - 1:0] getArithOp;
    logic [32 - 1:0] getArithOp$inst;
    logic getArithOp__RDY;
    logic [32 - 1:0] getSrc1;
    logic [32 - 1:0] getSrc1$inst;
    logic getSrc1__RDY;
    logic [32 - 1:0] getSrc2;
    logic [32 - 1:0] getSrc2$inst;
    logic getSrc2__RDY;
    logic [32 - 1:0] getDst;
    logic [32 - 1:0] getDst$inst;
    logic getDst__RDY;
    logic [32 - 1:0] getAddr;
    logic [32 - 1:0] getAddr$inst;
    logic getAddr__RDY;
    modport server (input  getOp$inst, getArithOp$inst, getSrc1$inst, getSrc2$inst, getDst$inst, getAddr$inst,
                    output getOp, getOp__RDY, getArithOp, getArithOp__RDY, getSrc1, getSrc1__RDY, getSrc2, getSrc2__RDY, getDst, getDst__RDY, getAddr, getAddr__RDY);
    modport client (output getOp$inst, getArithOp$inst, getSrc1$inst, getSrc2$inst, getDst$inst, getAddr$inst,
                    input  getOp, getOp__RDY, getArithOp, getArithOp__RDY, getSrc1, getSrc1__RDY, getSrc2, getSrc2__RDY, getDst, getDst__RDY, getAddr, getAddr__RDY);
endinterface
