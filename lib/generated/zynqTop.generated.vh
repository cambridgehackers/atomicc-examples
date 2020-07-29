`ifndef __zynqTop_GENERATED__VH__
`define __zynqTop_GENERATED__VH__

//METASTART; P7Wrap
//METAINTERNAL; pps; PS7;
//METAINTERNAL; pclockTop; ClockTop;
//METAGUARD; MAXIGP0_I$R; 0 != pps$MAXIGP0RREADY;
//METAGUARD; MAXIGP0_I$B; 0 != pps$MAXIGP0BREADY;
//METAGUARD; RULE$init; 1;
//METAINVOKE; RULE$gp0ar__ENA; :MAXIGP0_O$AR__ENA;
//METAGUARD; RULE$gp0ar; !( ( 0 == pps$MAXIGP0ARVALID ) || ( !MAXIGP0_O$AR__RDY ) );
//METAINVOKE; RULE$gp0aw__ENA; :MAXIGP0_O$AW__ENA;
//METAGUARD; RULE$gp0aw; !( ( 0 == pps$MAXIGP0AWVALID ) || ( !MAXIGP0_O$AW__RDY ) );
//METAINVOKE; RULE$gp0w__ENA; :MAXIGP0_O$W__ENA;
//METAGUARD; RULE$gp0w; !( ( 0 == pps$MAXIGP0WVALID ) || ( !MAXIGP0_O$W__RDY ) );
//METARULES; RULE$init; RULE$gp0ar; RULE$gp0aw; RULE$gp0w
//METASTART; ZynqTop
//METAINTERNAL; ps7_ps7_foo; P7Wrap;
//METAINTERNAL; test; AxiTop;
//METAINTERNAL; ps7_fclk_0_c; BUFG;
//METAINTERNAL; ps7_freset_0_r; BUFG;
//METAGUARD; RULE$init; 1;
//METARULES; RULE$init
//METACONNECT; test$MAXIGP0_O$AR__ENA; ps7_ps7_foo$MAXIGP0_O$AR__ENA
//METACONNECT; test$MAXIGP0_O$AR__RDY; ps7_ps7_foo$MAXIGP0_O$AR__RDY
//METACONNECT; test$MAXIGP0_O$AW__ENA; ps7_ps7_foo$MAXIGP0_O$AW__ENA
//METACONNECT; test$MAXIGP0_O$AW__RDY; ps7_ps7_foo$MAXIGP0_O$AW__RDY
//METACONNECT; test$MAXIGP0_O$W__ENA; ps7_ps7_foo$MAXIGP0_O$W__ENA
//METACONNECT; test$MAXIGP0_O$W__RDY; ps7_ps7_foo$MAXIGP0_O$W__RDY
//METACONNECT; test$MAXIGP0_I$R__ENA; ps7_ps7_foo$MAXIGP0_I$R__ENA
//METACONNECT; test$MAXIGP0_I$R__RDY; ps7_ps7_foo$MAXIGP0_I$R__RDY
//METACONNECT; test$MAXIGP0_I$B__ENA; ps7_ps7_foo$MAXIGP0_I$B__ENA
//METACONNECT; test$MAXIGP0_I$B__RDY; ps7_ps7_foo$MAXIGP0_I$B__RDY
`endif
