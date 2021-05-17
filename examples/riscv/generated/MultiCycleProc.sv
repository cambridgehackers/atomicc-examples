`include "atomicc.generated.vh"
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
    logic RULE$decode__ENA;
    logic RULE$decode__RDY;
    logic RULE$execArith__ENA;
    logic RULE$execArith__RDY;
    logic RULE$writeBack__ENA;
    ExecResult _RULE$execArith$val;
    // Extra assigments, not to output wires
    assign RULE$decode__ENA = ( d2e_valid == 0 ) && pgm.read__RDY && dec.getOp__RDY && dec.getArithOp__RDY && dec.getSrc1__RDY && dec.getSrc2__RDY && dec.getDst__RDY && dec.getAddr__RDY;
    assign RULE$decode__RDY = ( d2e_valid == 0 ) && pgm.read__RDY && dec.getOp__RDY && dec.getArithOp__RDY && dec.getSrc1__RDY && dec.getSrc2__RDY && dec.getDst__RDY && dec.getAddr__RDY;
    assign RULE$execArith__ENA = ( d2e_valid == 1 ) && ( e2w_valid == 0 ) && rf.read__RDY && exec.basicExec__RDY;
    assign RULE$execArith__RDY = ( d2e_valid == 1 ) && ( e2w_valid == 0 ) && rf.read__RDY && exec.basicExec__RDY;
    assign RULE$writeBack__ENA = ( e2w_valid == 1 ) && rf.write__RDY;
    assign _RULE$execArith$val = exec.basicExec;
    assign rf.write$regnum = e2w_dst;
    assign rf.write$regval = e2w_val;
    assign rf.write__ENA = e2w_valid == 1;

    always @( posedge CLK) begin
      if (!nRST) begin
        d2e_addr <= 32'd0;
        d2e_arithOp <= 32'd0;
        d2e_dst <= 32'd0;
        d2e_op <= 32'd0;
        d2e_src1 <= 32'd0;
        d2e_src2 <= 32'd0;
        d2e_valid <= 32'd0;
        e2w_addr <= 32'd0;
        e2w_dst <= 32'd0;
        e2w_nextPC <= 32'd0;
        e2w_val <= 32'd0;
        e2w_valid <= 32'd0;
        pc <= 32'd0;
      end // nRST
      else begin
        if (RULE$decode__RDY && RULE$decode__ENA) begin // RULE$decode__ENA
            d2e_op <= dec.getOp;
            d2e_arithOp <= dec.getArithOp;
            d2e_src1 <= dec.getSrc1;
            d2e_src2 <= dec.getSrc2;
            d2e_dst <= dec.getDst;
            d2e_addr <= dec.getAddr;
            d2e_valid <= 32'd1;
        end; // End of RULE$decode__ENA
        if (RULE$execArith__RDY && RULE$execArith__ENA) begin // RULE$execArith__ENA
            d2e_valid <= 32'd0;
            e2w_dst <= d2e_dst;
            e2w_val <= _RULE$execArith$val.data;
            e2w_nextPC <= _RULE$execArith$val.nextPC;
            e2w_addr <= _RULE$execArith$val.addr;
            e2w_valid <= 32'd1;
        end; // End of RULE$execArith__ENA
        if (( e2w_valid == 1 ) && rf.write__RDY && RULE$writeBack__ENA) begin // RULE$writeBack__ENA
            e2w_valid <= 32'd0;
            pc <= e2w_nextPC;
        end; // End of RULE$writeBack__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
