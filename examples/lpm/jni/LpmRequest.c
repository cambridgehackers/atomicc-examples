#include "GeneratedTypes.h"

int LpmRequest_enter ( struct PortalInternal *p, const uint32_t data )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_LpmRequest_enter, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_LpmRequest_enter, "LpmRequest_enter")) return 1;
    p->transport->write(p, &temp_working_addr, data);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_LpmRequest_enter << 16) | 2, -1);
    return 0;
};

int LpmRequest_write ( struct PortalInternal *p, const uint32_t addr, const uint32_t data )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_LpmRequest_write, 3);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_LpmRequest_write, "LpmRequest_write")) return 1;
    p->transport->write(p, &temp_working_addr, addr);
    p->transport->write(p, &temp_working_addr, data);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_LpmRequest_write << 16) | 3, -1);
    return 0;
};

LpmRequestCb LpmRequestProxyReq = {
    portal_disconnect,
    LpmRequest_enter,
    LpmRequest_write,
};
LpmRequestCb *pLpmRequestProxyReq = &LpmRequestProxyReq;

const uint32_t LpmRequest_reqinfo = 0x2000c;
