#include "GeneratedTypes.h"

int GrayCounterIfc_IC_width_ND_4_JC__increment ( struct PortalInternal *p )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__increment, 1);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__increment, "GrayCounterIfc_IC_width_ND_4_JC__increment")) return 1;
    p->transport->write(p, &temp_working_addr, 0);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__increment << 16) | 1, -1);
    return 0;
};

int GrayCounterIfc_IC_width_ND_4_JC__decrement ( struct PortalInternal *p )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__decrement, 1);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__decrement, "GrayCounterIfc_IC_width_ND_4_JC__decrement")) return 1;
    p->transport->write(p, &temp_working_addr, 0);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__decrement << 16) | 1, -1);
    return 0;
};

int GrayCounterIfc_IC_width_ND_4_JC__readGray ( struct PortalInternal *p )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__readGray, 1);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__readGray, "GrayCounterIfc_IC_width_ND_4_JC__readGray")) return 1;
    p->transport->write(p, &temp_working_addr, 0);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__readGray << 16) | 1, -1);
    return 0;
};

int GrayCounterIfc_IC_width_ND_4_JC__writeGray ( struct PortalInternal *p, const uint16_t v )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__writeGray, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__writeGray, "GrayCounterIfc_IC_width_ND_4_JC__writeGray")) return 1;
    p->transport->write(p, &temp_working_addr, v);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__writeGray << 16) | 2, -1);
    return 0;
};

int GrayCounterIfc_IC_width_ND_4_JC__readBin ( struct PortalInternal *p )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__readBin, 1);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__readBin, "GrayCounterIfc_IC_width_ND_4_JC__readBin")) return 1;
    p->transport->write(p, &temp_working_addr, 0);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__readBin << 16) | 1, -1);
    return 0;
};

int GrayCounterIfc_IC_width_ND_4_JC__writeBin ( struct PortalInternal *p, const uint16_t v )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__writeBin, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__writeBin, "GrayCounterIfc_IC_width_ND_4_JC__writeBin")) return 1;
    p->transport->write(p, &temp_working_addr, v);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__writeBin << 16) | 2, -1);
    return 0;
};

GrayCounterIfc_IC_width_ND_4_JC_Cb GrayCounterIfc_IC_width_ND_4_JC_ProxyReq = {
    portal_disconnect,
    GrayCounterIfc_IC_width_ND_4_JC__increment,
    GrayCounterIfc_IC_width_ND_4_JC__decrement,
    GrayCounterIfc_IC_width_ND_4_JC__readGray,
    GrayCounterIfc_IC_width_ND_4_JC__writeGray,
    GrayCounterIfc_IC_width_ND_4_JC__readBin,
    GrayCounterIfc_IC_width_ND_4_JC__writeBin,
};
GrayCounterIfc_IC_width_ND_4_JC_Cb *pGrayCounterIfc_IC_width_ND_4_JC_ProxyReq = &GrayCounterIfc_IC_width_ND_4_JC_ProxyReq;

const uint32_t GrayCounterIfc_IC_width_ND_4_JC__reqinfo = 0x60008;
