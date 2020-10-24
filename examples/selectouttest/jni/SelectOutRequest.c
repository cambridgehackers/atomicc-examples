#include "GeneratedTypes.h"

int SelectOutRequest_say ( struct PortalInternal *p, const uint32_t v )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_SelectOutRequest_say, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_SelectOutRequest_say, "SelectOutRequest_say")) return 1;
    p->transport->write(p, &temp_working_addr, v);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_SelectOutRequest_say << 16) | 2, -1);
    return 0;
};

SelectOutRequestCb SelectOutRequestProxyReq = {
    portal_disconnect,
    SelectOutRequest_say,
};
SelectOutRequestCb *pSelectOutRequestProxyReq = &SelectOutRequestProxyReq;

const uint32_t SelectOutRequest_reqinfo = 0x10008;
