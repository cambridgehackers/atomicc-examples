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
#include "funnel.h"
#include "generated/top_sync.h"
#define IfcNames_EchoIndicationH2S 5

class EchoRequest {
    void say(__int(32) v);
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
    __output __uint(1)        adv7511_clk;
    __output __uint(36)       adv7511_d;
    __output __uint(1)        adv7511_de;
    __output __uint(1)        adv7511_hs;
    __output __uint(1)        adv7511_vs;
};

class Echo __implements EchoIfc {
    //__parameter Bit(12)          HV_OFFSET_0;
    //__parameter Bit(12)          HV_OFFSET_1;
    //__parameter Bit(12)          H_BP;
    //__parameter Bit(12)          H_FP;
    //__parameter Bit(12)          H_SYNC;
    //__parameter Bit(12)          H_TOTAL;
    //__parameter Bit(1)           INTERLACED;
    //__parameter Bit(20)          PATTERN_RAMP_STEP;
    //__parameter Bit(8)           PATTERN_TYPE;
    //__parameter Bit(12)          V_BP_0;
    //__parameter Bit(12)          V_BP_1;
    //__parameter Bit(12)          V_FP_0;
    //__parameter Bit(12)          V_FP_1;
    //__parameter Bit(12)          V_SYNC_0;
    //__parameter Bit(12)          V_SYNC_1;
    //__parameter Bit(12)          V_TOTAL_0;
    //__parameter Bit(12)          V_TOTAL_1;
    //__output Bit(1)           adv7511_clk;
    //__output Bit(36)          adv7511_d;
    //__output Bit(1)           adv7511_de;
    //__output Bit(1)           adv7511_hs;
    //__output Bit(1)           adv7511_vs;
    //__input  Bit(6)           pb;
    top_sync_vg_pattern top_sync;
    __rule initHdmi {
        top_sync.clk_in = __defaultClock;
        top_sync.resetb = __defaultnReset;
        top_sync.pb = 0;
        adv7511_clk = top_sync.adv7511_clk;
        adv7511_d = top_sync.adv7511_d;
        adv7511_de = top_sync.adv7511_de;
        adv7511_hs = top_sync.adv7511_hs;
        adv7511_vs = top_sync.adv7511_vs;
    }
    //__software EchoRequest                     request;
    //__software EchoIndication                 *indication;
    //FunnelBase<4, 32> funnel;
    //__printf;
    //Fifo1<__uint(32)> element2;
    __uint(1) busy, busy_delay;
    __int(32) v_temp, v_delay;
    __int(16) a_temp, b_temp, a_delay, b_delay;
    int v_type;
    void request.say(__int(32) v) if(!busy) {
        printf("request.say %x\n", v);
        v_temp = v;
#if 0
        v_delay = v_temp; /// testing jca
@"_ZN4Echo11request$sayEiACCS32ACCE"(%module.Echo* %this, i32 %v)
      %0 = load i32, i32* %v.addr, align 1
  %v_temp = getelementptr inbounds %module.Echo, %module.Echo* %this1, i32 0, i32 7
  store i32 %0, i32* %v_temp, align 2

      %v_temp2 = getelementptr inbounds %module.Echo, %module.Echo* %this1, i32 0, i32 7
      %1 = load i32, i32* %v_temp2, align 2
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ error
  %v_delay = getelementptr inbounds %module.Echo, %module.Echo* %this1, i32 0, i32 8
  store i32 %1, i32* %v_delay, align 2
#endif
        busy = 1;
        v_type = 1;
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
