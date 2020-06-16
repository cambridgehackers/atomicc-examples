#include "GeneratedTypes.h"

int BtestRequest_say ( struct PortalInternal *p, const uint32_t v )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_BtestRequest_say, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_BtestRequest_say, "BtestRequest_say")) return 1;
    p->transport->write(p, &temp_working_addr, v);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_BtestRequest_say << 16) | 2, -1);
    return 0;
};

int BtestRequest_say2 ( struct PortalInternal *p, const uint16_t a, const uint16_t b )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_BtestRequest_say2, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_BtestRequest_say2, "BtestRequest_say2")) return 1;
    p->transport->write(p, &temp_working_addr, b|(((unsigned long)a)<<16));
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_BtestRequest_say2 << 16) | 2, -1);
    return 0;
};

int BtestRequest_setLeds ( struct PortalInternal *p, const uint8_t v )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_BtestRequest_setLeds, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_BtestRequest_setLeds, "BtestRequest_setLeds")) return 1;
    p->transport->write(p, &temp_working_addr, v);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_BtestRequest_setLeds << 16) | 2, -1);
    return 0;
};

BtestRequestCb BtestRequestProxyReq = {
    portal_disconnect,
    BtestRequest_say,
    BtestRequest_say2,
    BtestRequest_setLeds,
};
BtestRequestCb *pBtestRequestProxyReq = &BtestRequestProxyReq;

const uint32_t BtestRequest_reqinfo = 0x30008;
