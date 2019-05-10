/* Copyright (c) 2014 Quanta Research Cambridge, Inc
 * Copyright (c) 2019 The Connectal Project
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
#include "lpmdef.h"

__module LpmMemory {
    LpmMem ifc;
    int delayCount;
    IPA saved;
    void ifc.req(IPA v) if (delayCount == 0) { delayCount = 4; saved = v; }
    void ifc.resAccept(void) if (delayCount == 1) { delayCount = 0;}
    IPA ifc.resValue(void) if (delayCount == 1) { return saved; }
    LpmMemory() {
        __rule memdelay_rule if (delayCount > 1) { delayCount = delayCount - 1; };
    }
};

LpmMemory test;