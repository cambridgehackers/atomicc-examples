interface Executer;
    ExecResult basicExec;
    logic [32 - 1:0] basicExec$op;
    logic [32 - 1:0] basicExec$src1;
    logic [32 - 1:0] basicExec$src2;
    logic basicExec__RDY;
    modport server (input  basicExec$op, basicExec$src1, basicExec$src2,
                    output basicExec, basicExec__RDY);
    modport client (output basicExec$op, basicExec$src1, basicExec$src2,
                    input  basicExec, basicExec__RDY);
endinterface
