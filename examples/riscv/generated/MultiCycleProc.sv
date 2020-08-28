`include "MultiCycleProc.generated.vh"

`default_nettype none
module MultiCycleProc (input wire CLK, input wire nRST,
    Decoder.client dec,
    Executer.client exec,
    RegFile.client rf,
    IMem.client pgm,
    DMem.client dmem);
    reg [32 - 1:0]d2e_addr;
    reg [32 - 1:0]d2e_arithOp;
    reg [32 - 1:0]d2e_dst;
    reg [32 - 1:0]d2e_op;
    reg [32 - 1:0]d2e_src1;
    reg [32 - 1:0]d2e_src2;
    reg [32 - 1:0]d2e_valid;
    reg [32 - 1:0]e2w_addr;
    reg [32 - 1:0]e2w_dst;
    reg [32 - 1:0]e2w_nextPC;
    reg [32 - 1:0]e2w_val;
    reg [32 - 1:0]e2w_valid;
    reg [32 - 1:0]pc;
    wire RULE$decode__ENA;
    wire RULE$decode__RDY;
    ExecResult RULE$execArith$val;
    wire RULE$execArith__ENA;
    wire RULE$execArith__RDY;
    wire RULE$writeBack__RDY;
    // Extra assigments, not to output wires
    assign RULE$decode__ENA = ( d2e_valid == 0 ) && pgm.read__RDY && dec.getOp__RDY && dec.getArithOp__RDY && dec.getSrc1__RDY && dec.getSrc2__RDY && dec.getDst__RDY && dec.getAddr__RDY;
    assign RULE$decode__RDY = ( d2e_valid == 0 ) && pgm.read__RDY && dec.getOp__RDY && dec.getArithOp__RDY && dec.getSrc1__RDY && dec.getSrc2__RDY && dec.getDst__RDY && dec.getAddr__RDY;
    assign RULE$execArith$val = exec.basicExec;
    assign RULE$execArith__ENA = ( d2e_valid == 1 ) && ( e2w_valid == 0 ) && rf.read__RDY && exec.basicExec__RDY;
    assign RULE$execArith__RDY = ( d2e_valid == 1 ) && ( e2w_valid == 0 ) && rf.read__RDY && exec.basicExec__RDY;
    assign RULE$writeBack__RDY = ( e2w_valid == 1 ) && rf.write__RDY;
    assign rf.write$regnum = e2w_dst;
    assign rf.write$regval = e2w_val;
    assign rf.write__ENA = e2w_valid == 1;

    always @( posedge CLK) begin
      if (!nRST) begin
        d2e_addr <= 0;
        d2e_arithOp <= 0;
        d2e_dst <= 0;
        d2e_op <= 0;
        d2e_src1 <= 0;
        d2e_src2 <= 0;
        d2e_valid <= 0;
        e2w_addr <= 0;
        e2w_dst <= 0;
        e2w_nextPC <= 0;
        e2w_val <= 0;
        e2w_valid <= 0;
        pc <= 0;
      end // nRST
      else begin
        if (RULE$decode__ENA && RULE$decode__RDY) begin // RULE$decode__ENA
            d2e_op <= dec.getOp;
            d2e_arithOp <= dec.getArithOp;
            d2e_src1 <= dec.getSrc1;
            d2e_src2 <= dec.getSrc2;
            d2e_dst <= dec.getDst;
            d2e_addr <= dec.getAddr;
            d2e_valid <= 1;
        end; // End of RULE$decode__ENA
        if (RULE$execArith__ENA && RULE$execArith__RDY) begin // RULE$execArith__ENA
            d2e_valid <= 0;
            e2w_dst <= d2e_dst;
            e2w_val <= RULE$execArith$val.data;
            e2w_nextPC <= RULE$execArith$val.nextPC;
            e2w_addr <= RULE$execArith$val.addr;
            e2w_valid <= 1;
        end; // End of RULE$execArith__ENA
        if (RULE$writeBack__RDY) begin // RULE$writeBack__ENA
            e2w_valid <= 0;
            pc <= e2w_nextPC;
        end; // End of RULE$writeBack__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
