`include "atomicc.generated.vh"
`default_nettype none
module WbPriArbiter #(
    parameter integer OPT_ZERO_ON_IDLE = 0,
    parameter integer F_OPT_CLK2FFLOGIC = 1)(
    input wire acyc,
    input wire bcyc,
    input wire ocyc,
    input wire a$stb__ENA,
    input wire a$stb$we,
    input wire [32 - 1:0]a$stb$addr,
    input wire [32 - 1:0]a$stb$data,
    input wire [32/8 - 1:0]a$stb$sel,
    output wire a$stb__RDY,
    output wire a$ack,
    output wire a$ack__RDY,
    output wire a$stall,
    output wire a$stall__RDY,
    output wire a$err,
    output wire a$err__RDY,
    input wire b$stb__ENA,
    input wire b$stb$we,
    input wire [32 - 1:0]b$stb$addr,
    input wire [32 - 1:0]b$stb$data,
    input wire [32/8 - 1:0]b$stb$sel,
    output wire b$stb__RDY,
    output wire b$ack,
    output wire b$ack__RDY,
    output wire b$stall,
    output wire b$stall__RDY,
    output wire b$err,
    output wire b$err__RDY,
    output wire o$stb__ENA,
    output wire o$stb$we,
    output wire [32 - 1:0]o$stb$addr,
    output wire [32 - 1:0]o$stb$data,
    output wire [32/8 - 1:0]o$stb$sel,
    input wire o$stb__RDY,
    input wire o$ack,
    input wire o$ack__RDY,
    input wire o$stall,
    input wire o$stall__RDY,
    input wire o$err,
    input wire o$err__RDY);
    reg r_a_owner;
    logic CLK;
    logic nRST;
    assign a$ack = o$ack && r_a_owner;
    assign a$ack__RDY = o$ack__RDY;
    assign a$err = o$err && r_a_owner;
    assign a$err__RDY = o$err__RDY;
    assign a$stall = o$stall || ( !r_a_owner );
    assign a$stall__RDY = o$stall__RDY;
    assign a$stb__RDY = acyc && o$stb__RDY;
    assign b$ack = ( !r_a_owner ) && o$ack;
    assign b$ack__RDY = o$ack__RDY;
    assign b$err = ( !r_a_owner ) && o$err;
    assign b$err__RDY = o$err__RDY;
    assign b$stall = o$stall || r_a_owner;
    assign b$stall__RDY = o$stall__RDY;
    assign b$stb__RDY = ( !acyc ) && o$stb__RDY;
    assign o$stb$we = ( a$stb__ENA && ( a$stb$we || ( b$stb__ENA && b$stb$we ) ) ) || ( ( !a$stb__ENA ) && b$stb__ENA && b$stb$we );
    assign o$stb__ENA = a$stb__ENA | b$stb__ENA;
    always_comb begin
    o$stb$addr = 0;
    unique case(1'b1)
    a$stb__ENA: o$stb$addr = a$stb$addr;
    b$stb__ENA: o$stb$addr = b$stb$addr;
    default:;
    endcase
    end
    always_comb begin
    o$stb$data = 0;
    unique case(1'b1)
    a$stb__ENA: o$stb$data = a$stb$data;
    b$stb__ENA: o$stb$data = b$stb$data;
    default:;
    endcase
    end
    always_comb begin
    o$stb$sel = 0;
    unique case(1'b1)
    a$stb__ENA: o$stb$sel = a$stb$sel;
    b$stb__ENA: o$stb$sel = b$stb$sel;
    default:;
    endcase
    end

    always @( posedge CLK) begin
      if (!nRST) begin
        r_a_owner <= 0;
      end // nRST
      else begin
        if (acyc && o$stb__RDY && a$stb__ENA) begin // a$stb__ENA
            r_a_owner <= 1'd1;
        end; // End of a$stb__ENA
        if (( !acyc ) && o$stb__RDY && b$stb__ENA) begin // b$stb__ENA
            r_a_owner <= 1'd0;
        end; // End of b$stb__ENA
      end
    end // always @ (posedge CLK)
endmodule

`default_nettype wire    // set back to default value
