
`define TopAppendPort	,/*comma separator*/			\
   output wire pmoda__J1,					\
   output wire pmoda__J2,					\
   output wire pmoda__J3,					\
   output wire pmoda__J4,					\
   output wire pmoda__J7,					\
   output wire pmoda__J8,					\
   output wire pmoda__J9,					\
   output wire io_vita_clk_pll,					\
   output wire io_vita_reset_n,					\
   output wire io_vita_trigger_0__read,				\
   output wire io_vita_trigger_1__read,				\
   output wire io_vita_trigger_2__read,				\
   input wire  [1 : 0] io_vita_monitor_v,			\
   output wire spi_mosi,					\
   output wire spi_sel_n,					\
   input wire  spi_miso_v,					\
   output wire i2c_mux_reset_n,					\
   input wire  serpins_io_vita_sync_p_v,			\
   input wire  serpins_io_vita_sync_n_v,			\
   input wire  [3 : 0] serpins_io_vita_data_p_v,		\
   input wire  [3 : 0] serpins_io_vita_data_n_v,		\
   input wire  serpins_io_vita_clk_p_v,				\
   input wire  serpins_io_vita_clk_n_v,				\
   output wire CLK_spi_clock,					\
   input wire  fmc_video_clk1_v,				\
   output wire hdmi_vsync,					\
   output wire hdmi_hsync,					\
   output wire hdmi_de,						\
   output wire [15 : 0] hdmi_data,				\
   output wire CLK_hdmi_clock_if

`define TopAppendCode \
reg foo; \
    always @( posedge CLK) begin \
      if (!nRST) begin \
        foo <= 0; \
      end // nRST \
      else begin \
        foo <= !foo; \
      end; \
    end; \
reg foohdmi; \
    always @( posedge CLK_hdmi_clock_if) begin \
      if (!nRST) begin \
        foohdmi <= 0; \
      end // nRST \
      else begin \
        foohdmi <= !foohdmi; \
      end; \
    end; \
    assign pmoda__J1 = foo;						\
    assign pmoda__J2 = foohdmi;				\
    /*assign pmoda__J3 = fmc_video_clk1_v;*/				\
    assign pmoda__J4 = hdmi_vsync;					\
    assign pmoda__J7 = hdmi_hsync;					\
    assign pmoda__J8 = hdmi_de;						\
    assign pmoda__J9 = hdmi_data[0];					\
    assign test.user.ctop.bozoclock = fmc_video_clk1_v;			\
    assign i2c_mux_reset_n = test.user.ctop.DUT__Echo.i2c_mux_reset_n;	\
    assign io_vita_clk_pll = 0;						\
    assign io_vita_trigger_0__read = 0;					\
    assign spi_mosi = 0;						\
    assign spi_sel_n = 0;						\
    assign CLK_spi_clock = 0;						\
    assign hdmi_vsync = test.user.ctop.DUT__Echo.hdmi.adv7511_vs_pin.in;\
    assign hdmi_hsync = test.user.ctop.DUT__Echo.hdmi.adv7511_hs_pin.in;\
    assign hdmi_de = test.user.ctop.DUT__Echo.hdmi.adv7511_de_pin.in;	\
    assign hdmi_data = test.user.ctop.DUT__Echo.hdmi.adv7511_d_pin.in;	\
    assign CLK_hdmi_clock_if = test.user.ctop.DUT__Echo.hdmi.adv7511_clk_pin.in;
