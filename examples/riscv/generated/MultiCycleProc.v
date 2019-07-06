`include "MultiCycleProc.generated.vh"

`default_nettype none
module MultiCycleProc (input wire CLK, input wire nRST,
    input wire [32 - 1:0]dec$getAddr,
    output wire [32 - 1:0]dec$getAddr$inst,
    input wire dec$getAddr__RDY,
    input wire [32 - 1:0]dec$getArithOp,
    output wire [32 - 1:0]dec$getArithOp$inst,
    input wire dec$getArithOp__RDY,
    input wire [32 - 1:0]dec$getDst,
    output wire [32 - 1:0]dec$getDst$inst,
    input wire dec$getDst__RDY,
    input wire [32 - 1:0]dec$getOp,
    output wire [32 - 1:0]dec$getOp$inst,
    input wire dec$getOp__RDY,
    input wire [32 - 1:0]dec$getSrc1,
    output wire [32 - 1:0]dec$getSrc1$inst,
    input wire dec$getSrc1__RDY,
    input wire [32 - 1:0]dec$getSrc2,
    output wire [32 - 1:0]dec$getSrc2$inst,
    input wire dec$getSrc2__RDY,
    input wire [((32 + 32) + 32) - 1:0]exec$basicExec,
    output wire [32 - 1:0]exec$basicExec$op,
    output wire [32 - 1:0]exec$basicExec$src1,
    output wire [32 - 1:0]exec$basicExec$src2,
    input wire exec$basicExec__RDY,
    input wire [32 - 1:0]rf$read,
    output wire [32 - 1:0]rf$read$regnum,
    input wire rf$read__RDY,
    output wire rf$write__ENA,
    output wire [32 - 1:0]rf$write$regnum,
    output wire [32 - 1:0]rf$write$regval,
    input wire rf$write__RDY,
    input wire [32 - 1:0]pgm$read,
    output wire [32 - 1:0]pgm$read$pc,
    input wire pgm$read__RDY,
    output wire dmem$request__ENA,
    output wire [32 - 1:0]dmem$request$write_en,
    output wire [32 - 1:0]dmem$request$addr,
    output wire [32 - 1:0]dmem$request$data,
    input wire dmem$request__RDY,
    input wire [32 - 1:0]dmem$response,
    input wire dmem$response__RDY);
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
    wire [((32 + 32) + 32) - 1:0]RULE$execArith$val;
    wire [32 - 1:0]RULE$execArith$val$addr;
    wire [32 - 1:0]RULE$execArith$val$data;
    wire [32 - 1:0]RULE$execArith$val$nextPC;
    wire RULE$execArith__ENA;
    wire RULE$execArith__RDY;
    assign dec$getAddr$inst = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign dec$getArithOp$inst = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign dec$getDst$inst = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign dec$getOp$inst = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign dec$getSrc1$inst = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign dec$getSrc2$inst = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign dmem$request$addr = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign dmem$request$data = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign dmem$request$write_en = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign dmem$request__ENA = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign exec$basicExec$op = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign exec$basicExec$src1 = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign exec$basicExec$src2 = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign pgm$read$pc = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign rf$read$regnum = 0; //MISSING_ASSIGNMENT_FOR_OUTPUT_VALUE
    assign rf$write$regnum = e2w_dst;
    assign rf$write$regval = e2w_val;
    assign rf$write__ENA = e2w_valid == 1;
    // Extra assigments, not to output wires
    assign RULE$decode__ENA = ( d2e_valid == 0 ) & pgm$read__RDY & dec$getOp__RDY & dec$getArithOp__RDY & dec$getSrc1__RDY & dec$getSrc2__RDY & dec$getDst__RDY & dec$getAddr__RDY;
    assign RULE$decode__RDY = ( d2e_valid == 0 ) & pgm$read__RDY & dec$getOp__RDY & dec$getArithOp__RDY & dec$getSrc1__RDY & dec$getSrc2__RDY & dec$getDst__RDY & dec$getAddr__RDY;
    assign RULE$execArith$val = { exec$basicExec[ 32 - 1 + 64 : 64 ] , exec$basicExec[ 32 - 1 + 32 : 32 ] , exec$basicExec[ 32 - 1 : 0 ] };
    assign RULE$execArith$val$addr = exec$basicExec[ 32 - 1 + 32 : 32 ];
    assign RULE$execArith$val$data = exec$basicExec[ 32 - 1 + 64 : 64 ];
    assign RULE$execArith$val$nextPC = exec$basicExec[ 32 - 1 : 0 ];
    assign RULE$execArith__ENA = !( ( 0 == ( ( d2e_valid == 1 ) && ( e2w_valid == 0 ) ) ) | ( !( rf$read__RDY & exec$basicExec__RDY ) ) );
    assign RULE$execArith__RDY = !( ( 0 == ( ( d2e_valid == 1 ) && ( e2w_valid == 0 ) ) ) | ( !( rf$read__RDY & exec$basicExec__RDY ) ) );

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
        if (RULE$decode__ENA & RULE$decode__RDY) begin // RULE$decode__ENA
            d2e_op <= dec$getOp;
            d2e_arithOp <= dec$getArithOp;
            d2e_src1 <= dec$getSrc1;
            d2e_src2 <= dec$getSrc2;
            d2e_dst <= dec$getDst;
            d2e_addr <= dec$getAddr;
            d2e_valid <= 1;
        end; // End of RULE$decode__ENA
        if (RULE$execArith__ENA & RULE$execArith__RDY) begin // RULE$execArith__ENA
            d2e_valid <= 0;
            e2w_dst <= d2e_dst;
            e2w_val <= RULE$execArith$val$data;
            e2w_nextPC <= RULE$execArith$val$nextPC;
            e2w_addr <= RULE$execArith$val$addr;
            e2w_valid <= 1;
        end; // End of RULE$execArith__ENA
        if (( e2w_valid == 1 ) & rf$write__RDY) begin // RULE$writeBack__ENA
            e2w_valid <= 0;
            pc <= e2w_nextPC;
        end; // End of RULE$writeBack__ENA
      end
    end // always @ (posedge CLK)
endmodule 

`default_nettype wire    // set back to default value
