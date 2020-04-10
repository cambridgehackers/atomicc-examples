// Copyright (c) 2020 The Connectal Project

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
#ifndef _VMMCME2_ADV_H_
#define _VMMCME2_ADV_H_
class Mmcme2MMCME2_ADV {
    __parameter const char *     BANDWIDTH;
    __input  __uint(1)        CLKFBIN;
    __output __uint(1)        CLKFBOUT;
    __output __uint(1)        CLKFBOUTB;
    __parameter float            CLKFBOUT_MULT_F;
    __parameter float            CLKFBOUT_PHASE;
    __parameter const char *     CLKFBOUT_USE_FINE_PS;
    __output __uint(1)        CLKFBSTOPPED;
    __input  __uint(1)        CLKIN1;
    __parameter float            CLKIN1_PERIOD;
    __input  __uint(1)        CLKIN2;
    __parameter float            CLKIN2_PERIOD;
    __input  __uint(1)        CLKINSEL;
    __output __uint(1)        CLKINSTOPPED;
    __output __uint(1)        CLKOUT0;
    __output __uint(1)        CLKOUT0B;
    __parameter float            CLKOUT0_DIVIDE_F;
    __parameter float            CLKOUT0_DUTY_CYCLE;
    __parameter float            CLKOUT0_PHASE;
    __parameter const char *     CLKOUT0_USE_FINE_PS;
    __output __uint(1)        CLKOUT1;
    __output __uint(1)        CLKOUT1B;
    __parameter int              CLKOUT1_DIVIDE;
    __parameter float            CLKOUT1_DUTY_CYCLE;
    __parameter float            CLKOUT1_PHASE;
    __parameter const char *     CLKOUT1_USE_FINE_PS;
    __output __uint(1)        CLKOUT2;
    __output __uint(1)        CLKOUT2B;
    __parameter int              CLKOUT2_DIVIDE;
    __parameter float            CLKOUT2_DUTY_CYCLE;
    __parameter float            CLKOUT2_PHASE;
    __parameter const char *     CLKOUT2_USE_FINE_PS;
    __output __uint(1)        CLKOUT3;
    __output __uint(1)        CLKOUT3B;
    __parameter int              CLKOUT3_DIVIDE;
    __parameter float            CLKOUT3_DUTY_CYCLE;
    __parameter float            CLKOUT3_PHASE;
    __parameter const char *     CLKOUT3_USE_FINE_PS;
    __output __uint(1)        CLKOUT4;
    __parameter const char *     CLKOUT4_CASCADE;
    __parameter int              CLKOUT4_DIVIDE;
    __parameter float            CLKOUT4_DUTY_CYCLE;
    __parameter float            CLKOUT4_PHASE;
    __parameter const char *     CLKOUT4_USE_FINE_PS;
    __output __uint(1)        CLKOUT5;
    __parameter int              CLKOUT5_DIVIDE;
    __parameter float            CLKOUT5_DUTY_CYCLE;
    __parameter float            CLKOUT5_PHASE;
    __parameter const char *     CLKOUT5_USE_FINE_PS;
    __output __uint(1)        CLKOUT6;
    __parameter int              CLKOUT6_DIVIDE;
    __parameter float            CLKOUT6_DUTY_CYCLE;
    __parameter float            CLKOUT6_PHASE;
    __parameter const char *     CLKOUT6_USE_FINE_PS;
    __parameter const char *     COMPENSATION;
    __input  __uint(7)        DADDR;
    __input  __uint(1)        DCLK;
    __input  __uint(1)        DEN;
    __input  __uint(16)       DI;
    __parameter int              DIVCLK_DIVIDE;
    __output __uint(16)       DO;
    __output __uint(1)        DRDY;
    __input  __uint(1)        DWE;
    __parameter int              IS_CLKINSEL_INVERTED;
    __parameter int              IS_PSEN_INVERTED;
    __parameter int              IS_PSINCDEC_INVERTED;
    __parameter int              IS_PWRDWN_INVERTED;
    __parameter int              IS_RST_INVERTED;
    __output __uint(1)        LOCKED;
    __input  __uint(1)        PSCLK;
    __output __uint(1)        PSDONE;
    __input  __uint(1)        PSEN;
    __input  __uint(1)        PSINCDEC;
    __input  __uint(1)        PWRDWN;
    __parameter float            REF_JITTER1;
    __parameter float            REF_JITTER2;
    __input  __uint(1)        RST;
    __parameter const char *     SS_EN;
    __parameter const char *     SS_MODE;
    __parameter int              SS_MOD_PERIOD;
    __parameter const char *     STARTUP_WAIT;
};
class MMCME2_ADV __implements Mmcme2MMCME2_ADV;
#endif
