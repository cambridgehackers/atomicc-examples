/* Copyright (c) 2020 The Connectal Project
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
#include "externalPin.h"
#include "syncBit.h"

#define IfcNames_EchoIndicationH2S 5

class ClockImageonIfc {
    __input  __uint(1)  CLK;
    __input  __uint(1)  nRST;
    __output __uint(1)  hdmiClock;
    __output __uint(1)  hdminReset;
    __output __uint(1)  imageonClock;
    __output __uint(1)  imageonnReset;
};

#define WidthFraction 20 // 12 + 8
      //.DIVCLK_DIVIDE (11), .CLKFBOUT_MULT_F (49), .CLKOUT0_DIVIDE_F (6), .CLKOUT1_DIVIDE (6), .CLKOUT2_DIVIDE (2.00), .CLKIN1_PERIOD (5.0), .CLKIN2_PERIOD (5),
class ClockImageon __implements ClockImageonIfc {
    MMCME2_ADV#(BANDWIDTH = "OPTIMIZED",
        CLKFBOUT_USE_FINE_PS = "FALSE", CLKOUT0_USE_FINE_PS = "FALSE",
        CLKOUT1_USE_FINE_PS = "FALSE", CLKOUT2_USE_FINE_PS = "FALSE",
        CLKOUT4_CASCADE = "FALSE",
        COMPENSATION = "ZHOLD", STARTUP_WAIT = "FALSE",
        CLKFBOUT_MULT_F = 8.0, CLKFBOUT_PHASE = 0.0,
        CLKIN1_PERIOD = 6.734007, // 148.5 MHz
        CLKIN2_PERIOD = 6.734007, DIVCLK_DIVIDE = 1,
        CLKOUT0_DIVIDE_F = 8.0, CLKOUT0_DUTY_CYCLE = 0.5, CLKOUT0_PHASE = 0.0,
        CLKOUT1_DIVIDE = 32, CLKOUT1_DUTY_CYCLE = 0.5, CLKOUT1_PHASE = 0.0, // 37.125 MHz
        CLKOUT2_DIVIDE = 1, CLKOUT2_DUTY_CYCLE = 0.5, CLKOUT2_PHASE = 0.0,  // 148.5
        REF_JITTER1 = 1.0e-2, REF_JITTER2 = 1.0e-2
        ) imageon_pll;
    ResetInverter rinverter;
    BUFG fbclockb;
    BUFG hdmi_clockb;
    BUFG imageon_clockb;
    SyncBit hdmiSync;
    SyncBit imageonSync;
    __rule init {
        rinverter.RESET_IN = nRST;
        imageon_pll.CLKIN1 = __defaultClock;
        imageon_pll.CLKIN2 = 0;
        imageon_pll.RST = rinverter.RESET_OUT;
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

        hdmi_clockb.I = imageon_pll.CLKOUT0;
        hdmiClock = hdmi_clockb.O;
        hdmiSync.CLK = hdmi_clockb.O;
        hdmiSync.in = __defaultnReset;
        hdminReset = hdmiSync.out;

        imageon_clockb.I = imageon_pll.CLKOUT1;
        imageonClock = imageon_clockb.O;
        imageonSync.CLK = imageon_clockb.O;
        imageonSync.in = __defaultnReset;
        imageonnReset = imageonSync.out;
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

class HdmiImageonIfc {
    __input  __uint(1)  CLK;
    __input  __uint(1)  nRST;
};

class HdmiImageon __implements HdmiImageonIfc {
};

template <int widthAddr, int heightAddr>
class HdmiSyncIfc {
    __uint(1)          dataEnable();
    __uint(1)          hSync();
    __uint(1)          vSync();
    void setup(__uint(widthAddr) ahEnd, __uint(widthAddr) ahFrontEnd, __uint(widthAddr) ahBackSync, __uint(widthAddr) ahSyncWidth,
        __uint(heightAddr) avEnd, __uint(heightAddr) avFrontEnd, __uint(heightAddr) avBackSync, __uint(heightAddr) avSyncWidth);
    void run(void);
    HdmiDataIfc<widthAddr, heightAddr> *data;
};

template <int widthAddr, int heightAddr>
class HdmiSync __implements HdmiSyncIfc<widthAddr, heightAddr> {
    __uint(widthAddr) hEnd, hFrontEnd, hBackSync, hSyncWidth;
    __uint(heightAddr) vEnd, vFrontEnd, vBackSync, vSyncWidth;
    __uint(widthAddr) pixelCount;
    __uint(heightAddr) lineCount;
    bool               runFlag;

    __uint(1)          dataEnableInternal() {
        return runFlag && lineCount >= vBackSync && lineCount <= vFrontEnd
                && pixelCount >= hBackSync && pixelCount <= hFrontEnd;
    }
    __uint(1)          dataEnable() {
        return dataEnableInternal();
    }
    __uint(1)          hSync() {
        return runFlag && pixelCount < hSyncWidth;
    }
    __uint(1)          vSync() {
        return runFlag && lineCount < vSyncWidth;
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
    }
    void run(void) {
        runFlag = true;
    }
    __rule updatePixel if (runFlag) {
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
    void setup(__uint(widthAddr) aactivePixels, __uint(heightAddr) aactiveLines, __uint(8) apattern, __uint(WidthFraction) arampStep);
    __uint(36) data();
    HdmiDataIfc<widthAddr, heightAddr> calculate;
};

template <int widthAddr, int heightAddr>
class HdmiPattern __implements HdmiPatternIfc<widthAddr, heightAddr> {
    __uint(36) pixelValue;
    __uint(WidthFraction) rampValue;
    __uint(widthAddr) activePixels;
    __uint(heightAddr) activeLines;
    __uint(8) pattern;
    __uint(WidthFraction) rampStep;
    void setup(__uint(widthAddr) aactivePixels, __uint(heightAddr) aactiveLines, __uint(8) apattern, __uint(WidthFraction) arampStep) {
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
    __async void setup(__uint(16) ahEnd, __uint(16) ahFrontEnd, __uint(8) ahBackSync, __uint(8) ahSyncWidth,
        __uint(16) avEnd, __uint(16) avFrontEnd, __uint(8) avBackSync, __uint(8) avSyncWidth,
        __uint(8) apattern, __uint(WidthFraction) aramp);
    __async void run(void);
};
#define PATTERN_RAMP_STEP 0x0222L
//#define PATTERN_RAMP_STEP 0x0333L // 20'hFFFFF / 1280 act_pixels per line = 20'h0333
#define PATTERN_TYPE 4    // RAMP
//#define PATTERN_TYPE 1 // BORDER.
class HdmiBlock __implements HdmiBlockIfc {
    HdmiSync<12, 12> syncBlock;
    HdmiPattern<12, 12> patternBlock;
    __uint(1) dataEnable;
    __uint(1) hSync;
    __uint(1) vSync;
    __connect syncBlock.data = patternBlock.calculate;
    ExternalPin<36> adv7511_d_pin;
    ExternalPin<1> adv7511_de_pin;
    ExternalPin<1> adv7511_hs_pin;
    ExternalPin<1> adv7511_vs_pin;
    ExternalPin<1> adv7511_clk_pin;

    void setup(__uint(16) ahEnd, __uint(16) ahFrontEnd, __uint(8) ahBackSync, __uint(8) ahSyncWidth,
        __uint(16) avEnd, __uint(16) avFrontEnd, __uint(8) avBackSync, __uint(8) avSyncWidth,
        __uint(8) apattern, __uint(WidthFraction) aramp) {
        patternBlock.setup(ahFrontEnd - ahBackSync, avFrontEnd - avBackSync, PATTERN_TYPE, PATTERN_RAMP_STEP);
        syncBlock.setup(ahEnd, ahFrontEnd, ahBackSync, ahSyncWidth, avEnd, avFrontEnd, avBackSync, avSyncWidth);
    }
    void run(void) {
        syncBlock.run();
    }
    __rule initHdmi {
        adv7511_d_pin.in = patternBlock.data();
        adv7511_de_pin.in = dataEnable;
        adv7511_hs_pin.in = hSync;
        adv7511_vs_pin.in = vSync;
        adv7511_clk_pin.in = !__defaultClock;
        dataEnable = syncBlock.dataEnable();
        hSync = syncBlock.hSync();
        vSync = syncBlock.vSync();
    }
};

class EchoRequest {
    void say(__int(32) v);
    void muxreset(__int(1) v);
    void run(void);
    void setuph(__uint(12) ahEnd, __uint(12) ahFrontEnd, __uint(8) ahBackSync, __uint(8) ahSyncWidth);
    void setupv(__uint(12) avEnd, __uint(12) avFrontEnd, __uint(8) avBackSync, __uint(8) avSyncWidth);
    void setupTest(__uint(8) apattern, __uint(WidthFraction) aramp);
};
class EchoIndication {
    void heard(__int(32) v, __int(32) hdmiCounter, __int(32) imageonCounter);
};

class EchoIfc {
    __software EchoRequest                     request;
    __software EchoIndication                 *indication;
};

class Echo __implements EchoIfc {
    ExternalPin<1> fmc_video_clk1_v_pin;
    ExternalPin<1> i2c_mux_reset_n_pin;
    ClockImageon iclock;
    __clock("iclock.hdmiClock", "iclock.hdminReset") HdmiBlock    hdmi;
    HdmiImageon  imageon;
    BUFG videoClock;
    __uint(48) counter;
    __clock("iclock.hdmiClock", "iclock.hdminReset") __uint(48) hdmiCounter;
    __clock("iclock.imageonClock", "iclock.imageonnReset") __uint(48) imageonCounter;
    __uint(32) imageonCounter1, imageonCounter2;
    __uint(32) hdmiCounter1, hdmiCounter2;
    __rule updateRuleI {
        imageonCounter++;
    }
    __rule updateRuleH {
        hdmiCounter++;
    }
    __rule updateRule {
        counter++;
    }

    __uint(1)    i2c_mux_reset_n_reg;
    __rule initHdmi {
        videoClock.I = fmc_video_clk1_v_pin.out;
        iclock.CLK = videoClock.O;
        iclock.nRST = __defaultnReset;

        //hdmi.CLK = iclock.hdmiClock;
        //hdmi.nRST = __defaultnReset;
        imageon.CLK = iclock.imageonClock;
        imageon.nRST = __defaultnReset;
        //adv7511_clk = !iclock.hdmiClock;

        i2c_mux_reset_n_pin.in = i2c_mux_reset_n_reg;
    }
    __uint(1) busy, busy_delay;
    __int(32) v_temp, v_delay;
    bool callSetup;
    __uint(16) jhEnd;
    __uint(16) jhFrontEnd;
    __uint(8) jhBackSync;
    __uint(8) jhSyncWidth;
    __uint(16) jvEnd;
    __uint(16) jvFrontEnd;
    __uint(8) jvBackSync;
    __uint(8) jvSyncWidth;
    __uint(8) jpattern;
    __uint(WidthFraction) jrampStep;
    int v_type;
    void request.say(__int(32) v) if(!busy) {
        printf("request.say %x\n", v);
        switch(v) {
        default: v_temp = 99999999; break;
        }
        busy = 1;
        v_type = 1;
        hdmiCounter1 = __bitsubstr(hdmiCounter, 48-1, 16);
        imageonCounter1 = __bitsubstr(imageonCounter, 48-1, 16);
    }
    void request.muxreset(__int(1) v) {
        i2c_mux_reset_n_reg = v;
    }
    void request.setuph(__uint(12) ahEnd, __uint(12) ahFrontEnd, __uint(8) ahBackSync, __uint(8) ahSyncWidth) {
        jhEnd = ahEnd;
        jhFrontEnd = ahFrontEnd;
        jhBackSync = ahBackSync;
        jhSyncWidth = ahSyncWidth;
    }
    void request.setupv(__uint(12) avEnd, __uint(12) avFrontEnd, __uint(8) avBackSync, __uint(8) avSyncWidth) {
        jvEnd = avEnd;
        jvFrontEnd = avFrontEnd;
        jvBackSync = avBackSync;
        jvSyncWidth = avSyncWidth;
    }
    void request.setupTest(__uint(8) apattern, __uint(WidthFraction) aramp) {
        callSetup = true;
        jpattern = apattern;
        jrampStep = aramp;
    }
    void request.run() {
        hdmi.run();
    }
    __rule callSetupRule if (callSetup) {
        hdmi.setup(jhEnd, jhFrontEnd, jhBackSync, jhSyncWidth, jvEnd, jvFrontEnd, jvBackSync, jvSyncWidth, jpattern, jrampStep);
        callSetup = false;
    }
    __rule delay_rule if((busy != 0 & busy_delay == 0) != 0) {
        busy = 0;
        busy_delay = 1;
        v_delay = v_temp;
        hdmiCounter2 = hdmiCounter1;
        imageonCounter2 = imageonCounter1;
    };
    __rule respond_rule if(busy_delay != 0) {
        busy_delay = 0;
        indication->heard(__bitsubstr(counter, 48-1, 16), hdmiCounter2, imageonCounter2);
   };
};
