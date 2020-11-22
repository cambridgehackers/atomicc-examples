/* Copyright (c) 2016 The Connectal Project
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
#include "fifo.h"
#include "VMMCME2_ADV.h"
#include "VBUFG.h"
#include "resetInverter.h"
#include "generated/top_sync.h"

#define IfcNames_EchoIndicationH2S 5

class ClockImageonIfc {
    __input  __uint(1)  CLK;
    __input  __uint(1)  nRST;
    __output __uint(1)  hdmiClock;
    __output __uint(1)  imageonClock;
};

      //.DIVCLK_DIVIDE (11), .CLKFBOUT_MULT_F (49), .CLKOUT0_DIVIDE_F (6), .CLKOUT1_DIVIDE (6), .CLKOUT2_DIVIDE (2.00), .CLKIN1_PERIOD (5.0), .CLKIN2_PERIOD (5),
class ClockImageon __implements ClockImageonIfc {
    MMCME2_ADV#(BANDWIDTH = "OPTIMIZED",
        CLKFBOUT_USE_FINE_PS = "FALSE", CLKOUT0_USE_FINE_PS = "FALSE",
        CLKOUT1_USE_FINE_PS = "FALSE", CLKOUT2_USE_FINE_PS = "FALSE",
        CLKOUT4_CASCADE = "FALSE",
        COMPENSATION = "ZHOLD", STARTUP_WAIT = "FALSE",
        CLKFBOUT_MULT_F = 8.0, CLKFBOUT_PHASE = 0.0,
   //clockParams.clkin1_period      = 6.734007; // 148.5 MHz
        CLKIN1_PERIOD = 10.0, CLKIN2_PERIOD = 6.734007, DIVCLK_DIVIDE = 1,
        CLKOUT0_DIVIDE_F = 8.0, CLKOUT0_DUTY_CYCLE = 0.5, CLKOUT0_PHASE = 0.0,
        CLKOUT1_DIVIDE = 32, CLKOUT1_DUTY_CYCLE = 0.5, CLKOUT1_PHASE = 0.0,
        CLKOUT2_DIVIDE = 1, CLKOUT2_DUTY_CYCLE = 0.5, CLKOUT2_PHASE = 0.0,
        REF_JITTER1 = 1.0e-2, REF_JITTER2 = 1.0e-2
        ) imageon_pll;
    ResetInverter rinverter;
    BUFG fbclockb;
    BUFG hdmi_clockb;
    BUFG imageon_clockb;
    __rule init {
        rinverter.RESET_IN = nRST;
        imageon_pll.CLKIN2 = 0;
        imageon_pll.CLKINSEL = 1;
        imageon_pll.DADDR = 0;
        imageon_pll.DCLK = 0;
        imageon_pll.DEN = 0;
        imageon_pll.DI = 0;
        imageon_pll.DWE = 0;
        imageon_pll.PSCLK = 0;
        imageon_pll.PSEN = 0;
        imageon_pll.PSINCDEC = 0;
        imageon_pll.PWRDWN = 0;
        fbclockb.I = imageon_pll.CLKFBOUT;
        imageon_pll.CLKFBIN = fbclockb.O;
        imageon_pll.RST = rinverter.RESET_OUT;
        imageon_pll.CLKIN1 = __defaultClock;

        hdmi_clockb.I = imageon_pll.CLKOUT0;
        hdmiClock = hdmi_clockb.O;
        imageon_clockb.I = imageon_pll.CLKOUT1;
        imageonClock = imageon_clockb.O;
    };
};

class HdmiBlockIfc {
    __input  __uint(1)        CLK;
    __input  __uint(1)        nRST;
    __output __uint(1)        adv7511_clk;
    __output __uint(36)       adv7511_d;
    __output __uint(1)        adv7511_de;
    __output __uint(1)        adv7511_hs;
    __output __uint(1)        adv7511_vs;
};
class HdmiBlock __implements HdmiBlockIfc {
    top_sync_vg_pattern top_sync;
    __rule initHdmi {
        top_sync.CLK = __defaultClock;
        top_sync.nRST = __defaultnReset;
        adv7511_clk = top_sync.adv7511_clk;
        adv7511_d = top_sync.adv7511_d;
        adv7511_de = top_sync.adv7511_de;
        adv7511_hs = top_sync.adv7511_hs;
        adv7511_vs = top_sync.adv7511_vs;
    }
};
class EchoRequest {
    void say(__int(32) v);
    void muxreset(__int(1) v);
    void say2(__int(16) a, __int(16) b);
    void setLeds(__int(8) v);
};
class EchoIndication {
    void heard(__int(32) v);
    void heard2(__int(16) a, __int(16) b);
    void heard3(__int(16) a, __int(32) b, __int(32) c, __int(16) d);
};

class EchoIfc {
    __software EchoRequest                     request;
    __software EchoIndication                 *indication;
    __input  __uint(1)        CLK;
    __input  __uint(1)        nRST;
    __input  __uint(1)        fmc_video_clk1_v;
    __output __uint(1)        i2c_mux_reset_n;
    __output __uint(1)        adv7511_clk;
    __output __uint(36)       adv7511_d;
    __output __uint(1)        adv7511_de;
    __output __uint(1)        adv7511_hs;
    __output __uint(1)        adv7511_vs;
};

class Echo __implements EchoIfc {
    ClockImageon iclock;
    HdmiBlock    hdmi;
    __uint(1)    i2c_mux_reset_n_reg;
    __rule initHdmi {
        iclock.CLK = fmc_video_clk1_v;
        iclock.nRST = __defaultnReset;

        hdmi.CLK = iclock.hdmiClock;
        hdmi.nRST = __defaultnReset;
        adv7511_clk = hdmi.adv7511_clk;
        adv7511_d = hdmi.adv7511_d;
        adv7511_de = hdmi.adv7511_de;
        adv7511_hs = hdmi.adv7511_hs;
        adv7511_vs = hdmi.adv7511_vs;

        i2c_mux_reset_n = i2c_mux_reset_n_reg;
    }
    __uint(1) busy, busy_delay;
    __int(32) v_temp, v_delay;
    __int(16) a_temp, b_temp, a_delay, b_delay;
    int v_type;
    void request.say(__int(32) v) if(!busy) {
        printf("request.say %x\n", v);
        v_temp = v;
        busy = 1;
        v_type = 1;
    }
    void request.muxreset(__int(1) v) {
        i2c_mux_reset_n_reg = v;
    }
    void request.say2(__int(16) a, __int(16) b) if(!busy) {
        a_temp = a;
        b_temp = b;
        busy = 1;
        v_type = 2;
    }
    void request.setLeds(__int(8) v) {
    }
    __rule delay_rule if((busy != 0 & busy_delay == 0) != 0) {
        busy = 0;
        busy_delay = 1;
        v_delay = v_temp;
        a_delay = a_temp;
        b_delay = b_temp;
    };
    __rule respond_rule if(busy_delay != 0) {
        busy_delay = 0;
        if (v_type == 1)
            indication->heard(v_delay);
        else
            indication->heard2(a_delay, b_delay);
   };
};
