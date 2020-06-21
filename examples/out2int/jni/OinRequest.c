#include "GeneratedTypes.h"

int OinRequest_say ( struct PortalInternal *p, const uint32_t v )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_OinRequest_say, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_OinRequest_say, "OinRequest_say")) return 1;
    p->transport->write(p, &temp_working_addr, v);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_OinRequest_say << 16) | 2, -1);
    return 0;
};

OinRequestCb OinRequestProxyReq = {
    portal_disconnect,
    OinRequest_say,
};
OinRequestCb *pOinRequestProxyReq = &OinRequestProxyReq;

const uint32_t OinRequest_reqinfo = 0x10008;
