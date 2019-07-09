#include "GeneratedTypes.h"

int GrayCounterIfc_IC_width_ND_4_JC__decrement ( struct PortalInternal *p )
{
    unsigned int temp_working_addr_start[1 + 1] = {0, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__decrement << 16) | 1,
    };
    p->transport->send(p, temp_working_addr_start + 2, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__decrement << 16) | 1, -1);
    return 0;
};

int GrayCounterIfc_IC_width_ND_4_JC__flag ( struct PortalInternal *p, const uint32_t v )
{
    unsigned int temp_working_addr_start[2 + 1] = {0, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__flag << 16) | 2,
            (unsigned int)(v)};
    p->transport->send(p, temp_working_addr_start + 2, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__flag << 16) | 2, -1);
    return 0;
};

int GrayCounterIfc_IC_width_ND_4_JC__increment ( struct PortalInternal *p )
{
    unsigned int temp_working_addr_start[1 + 1] = {0, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__increment << 16) | 1,
    };
    p->transport->send(p, temp_working_addr_start + 2, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__increment << 16) | 1, -1);
    return 0;
};

int GrayCounterIfc_IC_width_ND_4_JC__readBin ( struct PortalInternal *p )
{
    unsigned int temp_working_addr_start[1 + 1] = {0, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__readBin << 16) | 1,
    };
    p->transport->send(p, temp_working_addr_start + 2, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__readBin << 16) | 1, -1);
    return 0;
};

int GrayCounterIfc_IC_width_ND_4_JC__readGray ( struct PortalInternal *p )
{
    unsigned int temp_working_addr_start[1 + 1] = {0, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__readGray << 16) | 1,
    };
    p->transport->send(p, temp_working_addr_start + 2, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__readGray << 16) | 1, -1);
    return 0;
};

int GrayCounterIfc_IC_width_ND_4_JC__writeBin ( struct PortalInternal *p, const uint8_t v )
{
    unsigned int temp_working_addr_start[2 + 1] = {0, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__writeBin << 16) | 2,
            (unsigned int)(v)};
    p->transport->send(p, temp_working_addr_start + 2, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__writeBin << 16) | 2, -1);
    return 0;
};

int GrayCounterIfc_IC_width_ND_4_JC__writeGray ( struct PortalInternal *p, const uint8_t v )
{
    unsigned int temp_working_addr_start[2 + 1] = {0, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__writeGray << 16) | 2,
            (unsigned int)(v)};
    p->transport->send(p, temp_working_addr_start + 2, (CHAN_NUM_GrayCounterIfc_IC_width_ND_4_JC__writeGray << 16) | 2, -1);
    return 0;
};

GrayCounterIfc_IC_width_ND_4_JC_Cb GrayCounterIfc_IC_width_ND_4_JC_ProxyReq = {
    portal_disconnect,
    GrayCounterIfc_IC_width_ND_4_JC__decrement,
    GrayCounterIfc_IC_width_ND_4_JC__flag,
    GrayCounterIfc_IC_width_ND_4_JC__increment,
    GrayCounterIfc_IC_width_ND_4_JC__readBin,
    GrayCounterIfc_IC_width_ND_4_JC__readGray,
    GrayCounterIfc_IC_width_ND_4_JC__writeBin,
    GrayCounterIfc_IC_width_ND_4_JC__writeGray,
};
GrayCounterIfc_IC_width_ND_4_JC_Cb *pGrayCounterIfc_IC_width_ND_4_JC_ProxyReq = &GrayCounterIfc_IC_width_ND_4_JC_ProxyReq;

const uint32_t GrayCounterIfc_IC_width_ND_4_JC__reqinfo = 0x70008;
