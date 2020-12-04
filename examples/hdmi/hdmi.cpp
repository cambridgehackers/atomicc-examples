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

template <int widthAddr, int heightAddr>
class HdmiDataIfc {
    void setXY(__uint(widthAddr) x, __uint(heightAddr) y, bool dataEnable);
};

template <int widthAddr, int heightAddr>
class HdmiData __implements HdmiDataIfc<widthAddr, heightAddr> {
    void setXY(__uint(widthAddr) x, __uint(heightAddr) y, bool dataEnable) {
    }
};
HdmiData<12,13> dummyhdmid;

template <int widthAddr, int heightAddr>
class HdmiSyncIfc {
    __uint(1)          dataEnable();
    __uint(1)          hSync();
    __uint(1)          vSync();
    void setup(__uint(widthAddr) ahEnd, __uint(widthAddr) ahFrontEnd, __uint(widthAddr) ahBackSync, __uint(widthAddr) ahSyncWidth,
        __uint(heightAddr) avEnd, __uint(heightAddr) avFrontEnd, __uint(heightAddr) avBackSync, __uint(heightAddr) avSyncWidth);
    HdmiDataIfc<widthAddr, heightAddr> *data;
};

template <int widthAddr, int heightAddr>
class HdmiSync __implements HdmiSyncIfc<widthAddr, heightAddr> {
    __uint(widthAddr) hEnd, hFrontEnd, hBackSync, hSyncWidth;
    __uint(heightAddr) vEnd, vFrontEnd, vBackSync, vSyncWidth;
    __uint(widthAddr) pixelCount;
    __uint(heightAddr) lineCount;
    bool               run;

    __uint(1)          dataEnableInternal() {
        return run && lineCount >= vBackSync && lineCount <= vFrontEnd
                && pixelCount >= hBackSync && pixelCount <= hFrontEnd;
    }
    __uint(1)          dataEnable() {
        return dataEnableInternal();
    }
    __uint(1)          hSync() {
        return pixelCount < hSyncWidth;
    }
    __uint(1)          vSync() {
        return lineCount < vSyncWidth;
    }
    void setup(__uint(widthAddr) ahEnd, __uint(widthAddr) ahFrontEnd, __uint(widthAddr) ahBackSync, __uint(widthAddr) ahSyncWidth,
        __uint(heightAddr) avEnd, __uint(heightAddr) avFrontEnd, __uint(heightAddr) avBackSync, __uint(heightAddr) avSyncWidth) {
        hEnd = ahEnd;
        hFrontEnd = ahFrontEnd;
        hBackSync = ahBackSync;
        hSyncWidth = ahSyncWidth;
        vEnd = avEnd;
        vFrontEnd = avFrontEnd;
        vBackSync = avBackSync;
        vSyncWidth = avSyncWidth;
        run = true;
    }
    __rule updatePixel if (run) {
        if (pixelCount < hEnd)
          pixelCount = pixelCount + 1;
        else {
          pixelCount = 0;
          if (lineCount == vEnd)
            lineCount = 0;
          else
            lineCount = lineCount + 1;
        }
        this->data->setXY(pixelCount - hBackSync, lineCount - vBackSync, dataEnableInternal());
    }
};

template <int widthAddr, int heightAddr>
class HdmiPatternIfc {
    void setup(__uint(widthAddr) aactivePixels, __uint(heightAddr) aactiveLines, __uint(8) apattern, __uint(20//8+12
) arampStep);
    __uint(36) data();
    HdmiDataIfc<widthAddr, heightAddr> calculate;
};

template <int widthAddr, int heightAddr>
class HdmiPattern __implements HdmiPatternIfc<widthAddr, heightAddr> {
    __uint(36) pixelValue;
    __uint(8+12) rampValue;
    __uint(widthAddr) activePixels;
    __uint(heightAddr) activeLines;
    __uint(8) pattern;
    __uint(8+12) rampStep;
    void setup(__uint(widthAddr) aactivePixels, __uint(heightAddr) aactiveLines, __uint(8) apattern, __uint(20//8+12
) arampStep) {
        activePixels = aactivePixels;
        activeLines = aactiveLines;
        pattern = apattern;
        rampStep = arampStep;
    }
    void calculate.setXY(__uint(widthAddr) x, __uint(heightAddr) y, bool dataEnable) {
       __uint(8) r_out, g_out, b_out;
      if (pattern == 1) { // border
          if (dataEnable && ((y == 0) || (x == 0) || (x == activePixels) || (y == activeLines)))
              r_out = 0xff;
          else
              r_out = 0;
        }
      else if (pattern == 2) { // moireX
        if (dataEnable && (x & 1))
              r_out = 0xff;
          else
              r_out = 0;
        }
      else if (pattern == 3) { // moireY
        if (dataEnable && (y & 1))
              r_out = 0xff;
          else
              r_out = 0;
        }
      else if (pattern == 4) { // Simple RAMP
#define FRACTIONAL_BITS 12
          r_out = __bitsubstr(rampValue, 8+FRACTIONAL_BITS-1, FRACTIONAL_BITS);
          if ((x == activePixels) && dataEnable)
            rampValue = 0;
          else if (dataEnable)
            rampValue = rampValue + rampStep;
        }
      else
        r_out = 0;
      __uint(4) zero = 0;
      g_out = r_out;
      b_out = r_out;
      pixelValue = __bitconcat(r_out, zero, g_out, zero, b_out, zero);
    }
    __uint(36) data() {
        return pixelValue;
    }
};

class HdmiBlockIfc {
    __input  __uint(1)        CLK;
    __input  __uint(1)        nRST;
    __output __uint(36)       adv7511_d;
    __output __uint(1)        adv7511_de;
    __output __uint(1)        adv7511_hs;
    __output __uint(1)        adv7511_vs;
    __async void setup(__uint(16) ahEnd, __uint(16) ahFrontEnd, __uint(8) ahBackSync, __uint(8) ahSyncWidth,
        __uint(16) avEnd, __uint(16) avFrontEnd, __uint(8) avBackSync, __uint(8) avSyncWidth);
};
#define MODE_1080p /* FORMAT 16 */
//#define MODE_720p /* FORMAT 4 */
#ifdef MODE_1080p /* FORMAT 16 */
#define v_total 1125L
#define vFront 4
#define vBack 36L
#define vSyncWidth 5
#define h_total 2200L
#define hFront 88L
#define hBack 148L
#define hSyncWidth 44L
#define PATTERN_RAMP_STEP 0x0222L
#endif
#ifdef MODE_720p /* FORMAT 4 */
#define v_total 750L
#define vFront 5L
#define vBack 20L
#define vSyncWidth 5
#define h_total 1650L
#define hFront 110L
#define hBack 220L
#define hSyncWidth 40L
#define PATTERN_RAMP_STEP 0x0333L // 20'hFFFFF / 1280 act_pixels per line = 20'h0333
#endif
#define PATTERN_TYPE 4    // RAMP
//#define PATTERN_TYPE 1 // BORDER.
// mini
//pixclk=7425 w=697mm h=392mm features=1e
//    npixels=1280 bpixels=370 hsyncoff=110 hsyncwidth=40 hbpxls=0
//    nlines=720 blines=30 vsyncoff=5 vsyncwidth=5 vbpxls=0
//pixclk=2700 w=697mm h=392mm features=18
//    npixels=720 bpixels=138 hsyncoff=16 hsyncwidth=62 hbpxls=0
// visio
//pixclk=14850 w=509mm h=286mm features=1e
//    npixels=1920 bpixels=280 hsyncoff=88 hsyncwidth=44 hbpxls=0
//    nlines=1080 blines=45 vsyncoff=4 vsyncwidth=5 vbpxls=0
//    nlines=480 blines=45 vsyncoff=9 vsyncwidth=6 vbpxls=0
class HdmiBlock __implements HdmiBlockIfc {
    HdmiSync<12, 12> syncBlock;
    HdmiPattern<12, 12> patternBlock;
    __uint(1) dataEnable;
    __uint(1) hSync;
    __uint(1) vSync;
    //bool once;
    __connect syncBlock.data = patternBlock.calculate;
    void setup(__uint(16) ahEnd, __uint(16) ahFrontEnd, __uint(8) ahBackSync, __uint(8) ahSyncWidth,
        __uint(16) avEnd, __uint(16) avFrontEnd, __uint(8) avBackSync, __uint(8) avSyncWidth) {
        syncBlock.setup(h_total - 1, h_total - 1 - hFront, hBack + hSyncWidth, hSyncWidth,
                        v_total - 1, v_total - 1 - vFront, vBack + vSyncWidth, vSyncWidth);
        patternBlock.setup(h_total - 1 - hFront - (hBack + hSyncWidth),
                           v_total - 1 - vFront - (vBack + vSyncWidth), PATTERN_TYPE, PATTERN_RAMP_STEP);
    }
    __rule initHdmi {
        adv7511_d = patternBlock.data();
        adv7511_de = dataEnable;
        adv7511_hs = hSync;
        adv7511_vs = vSync;
        dataEnable = syncBlock.dataEnable();
        hSync = syncBlock.hSync();
        vSync = syncBlock.vSync();
    }
    //__rule init if (!once) {
        //once = true;
    //}
};

class EchoRequest {
    void say(__int(32) v);
    void muxreset(__int(1) v);
    void setLeds(__int(8) v);
    void setup(__uint(16) ahEnd, __uint(16) ahFrontEnd, __uint(8) ahBackSync, __uint(8) ahSyncWidth,
        __uint(16) avEnd, __uint(16) avFrontEnd, __uint(8) avBackSync, __uint(8) avSyncWidth);
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
        adv7511_clk = !hdmi.CLK;
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
    void request.setup(__uint(16) ahEnd, __uint(16) ahFrontEnd, __uint(8) ahBackSync, __uint(8) ahSyncWidth,
        __uint(16) avEnd, __uint(16) avFrontEnd, __uint(8) avBackSync, __uint(8) avSyncWidth) {
        hdmi.setup(ahEnd, ahFrontEnd, ahBackSync, ahSyncWidth, avEnd, avFrontEnd, avBackSync, avSyncWidth);
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
