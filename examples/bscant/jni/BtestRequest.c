#include "GeneratedTypes.h"

int BtestRequest_say ( struct PortalInternal *p, const uint32_t v, const uint8_t seqno )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_BtestRequest_say, 3);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_BtestRequest_say, "BtestRequest_say")) return 1;
    p->transport->write(p, &temp_working_addr, (v>>24));
    p->transport->write(p, &temp_working_addr, seqno|(((unsigned long)v)<<8));
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_BtestRequest_say << 16) | 3, -1);
    return 0;
};

BtestRequestCb BtestRequestProxyReq = {
    portal_disconnect,
    BtestRequest_say,
};
BtestRequestCb *pBtestRequestProxyReq = &BtestRequestProxyReq;

const uint32_t BtestRequest_reqinfo = 0x1000c;
