#include "GeneratedTypes.h"

int FunnelRequest_say ( struct PortalInternal *p, const uint32_t v )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_FunnelRequest_say, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_FunnelRequest_say, "FunnelRequest_say")) return 1;
    p->transport->write(p, &temp_working_addr, v);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_FunnelRequest_say << 16) | 2, -1);
    return 0;
};

FunnelRequestCb FunnelRequestProxyReq = {
    portal_disconnect,
    FunnelRequest_say,
};
FunnelRequestCb *pFunnelRequestProxyReq = &FunnelRequestProxyReq;

const uint32_t FunnelRequest_reqinfo = 0x10008;
