`define BSV_RESET_VALUE 1'b0
`define MAX_IN_WIDTH 64
`define MAX_OUT_WIDTH 64

module mkEcho( input  CLK, input  RST_N,
  input  [`MAX_IN_WIDTH -1: 0] in_enq_v, input  EN_in_enq, output RDY_in_enq,
  output [`MAX_OUT_WIDTH -1: 0] out_first, output RDY_out_first,
  input  EN_out_deq, output RDY_out_deq);

  wire indAvail;
  wire [31:0] lEcho_heard_v, lEcho_heard2_a_b;
  wire [`MAX_OUT_WIDTH-1:0] outValue;
  wire [15:0] indId;
  wire lEcho_delay_FULL_N, lEcho_delay2_FULL_N;
  wire lEcho_delay_EMPTY_N, lEcho_delay2_EMPTY_N;

  assign RDY_in_enq = lEcho_delay_FULL_N && lEcho_delay2_FULL_N;
  assign indAvail = lEcho_delay_EMPTY_N || lEcho_delay2_EMPTY_N;
  assign RDY_out_first = indAvail;
  assign RDY_out_deq = indAvail;
  assign indId = lEcho_delay_EMPTY_N ? 0 : 1;
  assign out_first = outValue;
  assign outValue = (indId == 0) ? {16'b0, lEcho_heard_v, indId} : {16'b0, lEcho_heard2_a_b, indId};

  SizedFIFO #(.p1width(32'd32), .p2depth(32'd8), .p3cntr_width(32'd3), .guarded(32'd1)) lEcho_delay(
      .RST(RST_N), .CLK(CLK), .D_IN(in_enq_v[47:16]),
      .ENQ(EN_in_enq && in_enq_v[15:0] == 0 && lEcho_delay_FULL_N),
      .DEQ(EN_out_deq && indId == 0 && lEcho_delay_EMPTY_N), .CLR(0),
      .D_OUT(lEcho_heard_v), .FULL_N(lEcho_delay_FULL_N), .EMPTY_N(lEcho_delay_EMPTY_N));

  SizedFIFO #(.p1width(32'd32), .p2depth(32'd8), .p3cntr_width(32'd3), .guarded(32'd1)) lEcho_delay2(
      .RST(RST_N), .CLK(CLK), .D_IN(in_enq_v[47:16]),
      .ENQ(EN_in_enq && in_enq_v[15:0] == 1 && lEcho_delay2_FULL_N),
      .DEQ((EN_out_deq && indId == 1) && lEcho_delay2_EMPTY_N), .CLR(0),
      .D_OUT(lEcho_heard2_a_b), .FULL_N(lEcho_delay2_FULL_N), .EMPTY_N(lEcho_delay2_EMPTY_N));
  always@(posedge CLK)
  begin
     if (EN_in_enq)
        $display("MKECHO: enq   %x", in_enq_v);
     if (RDY_out_first)
        $display("MKECHO: first %x", outValue);
  end
endmodule

module mkCnocTop( input  CLK, input  RST_N,
  input  [31 : 0] requests_0_message_enq_v, input  EN_requests_0_message_enq, output RDY_requests_0_message_enq,
  output requests_0_message_notFull, output RDY_requests_0_message_notFull,
  output [31 : 0] indications_0_message_first, output RDY_indications_0_message_first,
  input  EN_indications_0_message_deq, output RDY_indications_0_message_deq,
  output indications_0_message_notEmpty, output RDY_indications_0_message_notEmpty);
  wire EIRDY_in_enq, EIRDY_out_first, EIRDY_out_deq;
  wire [`MAX_OUT_WIDTH-1 : 0]indData;

  wire [31 : 0] lEcho_heard_v; wire lEcho_delay_EMPTY_N, lEcho_delay_FULL_N;
  wire [31 : 0] lEcho_heard2_a_b; wire lEcho_delay2_EMPTY_N, lEcho_delay2_FULL_N;
  wire RULElEIO_sendHeader, RULElEIO_sendMessage, RULElERI_receiveMessage, RULElERI_receiveHeader;
  wire RULElEIO_sendPortal, RULElERI_receivePortal;
  reg [1: 0]requestState, indicationState;

  wire indicationAvailable;

  reg [7 : 0] requestWords;
  reg [15 : 0] indicationWords;
  reg [15 : 0] requestPortal, indicationPortal;
  reg [15 : 0] requestId, indicationId;
  wire [31 : 0] indicationData;

  assign RDY_requests_0_message_notFull = 1'd1;
  assign RDY_indications_0_message_notEmpty = 1'd1;
  assign requests_0_message_notFull = EIRDY_in_enq;
  assign RDY_requests_0_message_enq = EIRDY_in_enq;
  assign RDY_indications_0_message_first = indicationAvailable;
  assign RDY_indications_0_message_deq = indicationAvailable;
  assign indications_0_message_notEmpty = indicationAvailable;
  assign indications_0_message_first = indicationData;

  assign RULElERI_receivePortal = EN_requests_0_message_enq && requestState == 0 && requests_0_message_enq_v[32];
  assign RULElERI_receiveHeader = EN_requests_0_message_enq && requestState == 1;
  assign RULElERI_receiveMessage = EN_requests_0_message_enq && requestState == 2 && EIRDY_in_enq;

  assign RULElEIO_sendPortal = EN_indications_0_message_deq && indicationState == 0 && indicationAvailable;
  assign RULElEIO_sendHeader = EN_indications_0_message_deq && indicationState == 1 && indicationAvailable;
  assign RULElEIO_sendMessage = EN_indications_0_message_deq && indicationState == 2 && indicationAvailable;
  assign indicationAvailable = EIRDY_out_first && EIRDY_out_deq;
  assign indicationData = 
    indicationState == 0 ? {        16'd5, 16'd1 + 16'd1 + 16'd1} :
    indicationState == 1 ? {indData[15:0], 16'd1 + 16'd1 } :
                           indData[47:16];

  mkEcho echoInstance(.CLK(CLK), .RST_N(RST_N),
      .in_enq_v({16'b0, requests_0_message_enq_v, requestId}),
      .EN_in_enq(RULElERI_receiveMessage && EIRDY_in_enq), .RDY_in_enq(EIRDY_in_enq),
      .out_first(indData), .RDY_out_first(EIRDY_out_first),
      .EN_out_deq(RULElEIO_sendMessage && EIRDY_out_deq), .RDY_out_deq(EIRDY_out_deq));

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        indicationState <= 0;
        indicationWords <= 16'd0;
        indicationId <= 16'd0;
        requestState <= 0;
        requestWords <= 8'd0;
        requestId <= 16'd0;
      end
    else
      begin
        if (RULElEIO_sendPortal) begin
          $display("CNOCTOP: sendPortal data %x", indicationData);
          indicationState <= 1;
        end
        if (RULElEIO_sendHeader) begin
          $display("CNOCTOP: sendHeader data %x", indicationData);
          indicationState <= 2;
          indicationWords <= 1;
          indicationId <= indData[15:0];
        end
        if (RULElEIO_sendMessage) begin
          $display("CNOCTOP: sendMessage data %x", indicationData);
          indicationWords <= indicationWords - 16'd1;
          if (indicationWords == 16'd1)
            indicationState <= 0;
        end

        if (EN_requests_0_message_enq)
          $display("CNOCTOP: incoming %x", requests_0_message_enq_v);
        if (RULElERI_receivePortal) begin
          requestState <= 1;
          requestPortal <= requests_0_message_enq_v[31:16];
          $display("CNOCTOP: receivePortal");
        end
        if (RULElERI_receiveHeader) begin
          requestState <= 2;
          requestWords <= requests_0_message_enq_v[7:0] - 8'd1;
          $display("CNOCTOP: receiveHeader portal %x datain %x", requestPortal, requests_0_message_enq_v);
          requestId <= requests_0_message_enq_v[31:16];
        end
        if (RULElERI_receiveMessage) begin
          $display("CNOCTOP: receiveMessage id %x, words %x", requestId, requestWords);
          requestWords <= requestWords - 8'd1;
          if (requestWords == 8'd1)
            requestState <= 0;
        end
      end
  end
  initial
  begin
    indicationState = 0;
    indicationWords = 16'hAAAA;
    indicationId = 16'hAAAA;
    requestState = 0;
    requestWords = 8'hAA;
    requestId = 16'hAAAA;
  end
endmodule  // mkCnocTop
