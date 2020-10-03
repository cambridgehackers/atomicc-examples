#include "GeneratedTypes.h"

int BtestRequest_read ( struct PortalInternal *p, const uint32_t addr )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_BtestRequest_read, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_BtestRequest_read, "BtestRequest_read")) return 1;
    p->transport->write(p, &temp_working_addr, addr);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_BtestRequest_read << 16) | 2, -1);
    return 0;
};

int BtestRequest_write ( struct PortalInternal *p, const uint32_t addr, const uint32_t data )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_BtestRequest_write, 3);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_BtestRequest_write, "BtestRequest_write")) return 1;
    p->transport->write(p, &temp_working_addr, addr);
    p->transport->write(p, &temp_working_addr, data);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_BtestRequest_write << 16) | 3, -1);
    return 0;
};

BtestRequestCb BtestRequestProxyReq = {
    portal_disconnect,
    BtestRequest_read,
    BtestRequest_write,
};
BtestRequestCb *pBtestRequestProxyReq = &BtestRequestProxyReq;

const uint32_t BtestRequest_reqinfo = 0x2000c;
