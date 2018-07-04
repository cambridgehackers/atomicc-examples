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
//#define BOARD_zybo
#include "atomicc.h"
#include "adapter.h"
#include "VMMCME2_ADV.h"

//typedef __int(32) aint32;
typedef __int(16) aint16;
//typedef __int(8) aint8;
#define aint32 __int(32)
//#define aint16 __int(16)
#define aint8 __int(8)
__interface EchoRequest {
    void say(aint32 v);
    void say2(aint16 a, aint16 b);
    //void say3(aint32 a, aint32 b, aint32 c);
    void zsay4(void);
    void setLeds(aint8 v);
    //__input int readme;
    //__output int writeme;
    //__inout int readwriteme;
};

__interface CNCONNECTNET2 {
    __input  __int(1)         IN1;
    __input  __int(1)         IN2;
    __output __int(1)         OUT1;
    __output __int(1)         OUT2;
};
__module CONNECTNET2 {
    CNCONNECTNET2 _;
    CONNECTNET2() {
        __rule assign {
            _.OUT1 = _.IN1;
            _.OUT2 = _.IN2;
        }
    }
};
CONNECTNET2 cntest;

__interface EchoIndication {
    void heard(aint32 v);
    void heard2(aint16 a, aint16 b);
    void heard3(__int(16) a, __int(32) b, __int(32) c, __int(16) d);
};
typedef __serialize(EchoRequest) fooReq;
typedef __serialize(EchoIndication) fooInd;

__module Echo {
    __software EchoRequest                     request;
    __software EchoIndication                 *indication;
    //__printf;
    int busy;
    aint32 v_temp, v_delay;
    aint16 a_temp, b_temp, a_delay, b_delay;
    __int(18) xxx;
    int busy_delay;
    int v_type;
    MMCME2_ADV#( BANDWIDTH = "OPTIMIZED",
        CLKFBOUT_USE_FINE_PS = "FALSE", CLKOUT0_USE_FINE_PS = "FALSE",
        CLKOUT1_USE_FINE_PS = "FALSE", CLKOUT2_USE_FINE_PS = "FALSE",
        CLKOUT3_USE_FINE_PS = "FALSE", CLKOUT4_USE_FINE_PS = "FALSE",
        CLKOUT5_USE_FINE_PS = "FALSE", CLKOUT6_USE_FINE_PS = "FALSE",
        CLKOUT4_CASCADE = "FALSE",
        COMPENSATION = "ZHOLD", STARTUP_WAIT = "FALSE",
        CLKFBOUT_MULT_F = 10.0, CLKFBOUT_PHASE = 0.0,
        CLKIN1_PERIOD = 10.0, CLKIN2_PERIOD = 0.0, DIVCLK_DIVIDE = 1,
        CLKOUT0_DIVIDE_F = 5.0, CLKOUT0_DUTY_CYCLE = 0.5, CLKOUT0_PHASE = 0.0,
        CLKOUT1_DIVIDE = 10, CLKOUT1_DUTY_CYCLE = 0.5, CLKOUT1_PHASE = 0.0,
        CLKOUT2_DIVIDE = 10, CLKOUT2_DUTY_CYCLE = 0.5, CLKOUT2_PHASE = 0.0,
        CLKOUT3_DIVIDE = 10, CLKOUT3_DUTY_CYCLE = 0.5, CLKOUT3_PHASE = 0.0,
        CLKOUT4_DIVIDE = 10, CLKOUT4_DUTY_CYCLE = 0.5, CLKOUT4_PHASE = 0.0,
        CLKOUT5_DIVIDE = 10, CLKOUT5_DUTY_CYCLE = 0.5, CLKOUT5_PHASE = 0.0,
        CLKOUT6_DIVIDE = 10, CLKOUT6_DUTY_CYCLE = 0.5, CLKOUT6_PHASE = 0.0,
        REF_JITTER1 = 1.0e-2, REF_JITTER2 = 1.0e-2) mmcm;
    void request.say(aint32 v) if(!busy) {
printf("[%s:%d]Echo\n", __FUNCTION__, 1);
        v_temp = v;
xxx = v;
        busy = 1;
        v_type = 1;
    }
    void request.say2(aint16 a, aint16 b) if(!busy) {
printf("[%s:%d]Echo\n", __FUNCTION__, 2);
        a_temp = a;
        b_temp = b;
        busy = 1;
        v_type = 2;
    }
#if 0
    void request.say3(aint32 a, aint32 b, aint32 c) if (!busy) {
printf("[%s:%d]Echo\n", __FUNCTION__, 3);
    }
#endif
    void request.zsay4(void) {
printf("[%s:%d]Echo\n", __FUNCTION__, 4);
    }
    void request.setLeds(aint8 v) {
    }
    Echo() {
        __rule delay_rule if((busy != 0 & busy_delay == 0) != 0) {
printf("[delay_rule:%d]Echo\n", 5);
             busy = 0;
             busy_delay = 1;
             v_delay = v_temp;
             a_delay = a_temp;
             b_delay = b_temp;
           };
        __rule respond_rule if(busy_delay != 0) {
printf("[respond_rule:%d]Echo\n", 6);
             busy_delay = 0;
             if (v_type == 1)
             indication->heard(v_delay);
             else
             indication->heard2(a_delay, b_delay);
           };
#ifdef BOARD_zybo
        __rule init {
        mmcm._.CLKIN2 = 0;
        mmcm._.CLKINSEL = 1;
        mmcm._.DADDR = 0;
        mmcm._.DCLK = 0;
        mmcm._.DEN = 0;
        mmcm._.DI = 0;
        mmcm._.DWE = 0;
        mmcm._.PSCLK = 0;
        mmcm._.PSEN = 0;
        mmcm._.PSINCDEC = 0;
        mmcm._.PWRDWN = 0;
#if 0
        mmcm._.CLKIN1 = CLK;
        mmcm._.RST = ps7_clockGen_pll_reset_RESET_OUT;
        mmcm._.CLKFBIN = ps7_clockGen_pll_clkfbbuf_O;
        mmcm._.CLKFBOUT = ps7_clockGen_pll_CLKFBOUT;
        mmcm._.CLKOUT0 = ps7_clockGen_pll_CLKOUT0;
        mmcm._.CLKOUT0B = ps7_clockGen_pll_CLKOUT0B;
#else
        mmcm._.CLKIN1 = 1;
        mmcm._.RST = 1;
        mmcm._.CLKFBIN = 1;
        mmcm._.CLKFBOUT = 1;
        mmcm._.CLKOUT0 = 1;
        mmcm._.CLKOUT0B = 1;
#endif
        };
#endif
    }
};

Echo test;
typedef __int(32) BusType;
AdapterFromBus<BusType, NOCData> fooFrom;
AdapterToBus<NOCData, BusType> fooTo;
