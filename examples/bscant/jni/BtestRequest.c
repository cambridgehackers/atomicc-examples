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

BtestRequestCb BtestRequestProxyReq = {
    portal_disconnect,
    BtestRequest_say,
};
BtestRequestCb *pBtestRequestProxyReq = &BtestRequestProxyReq;

const uint32_t BtestRequest_reqinfo = 0x10008;
