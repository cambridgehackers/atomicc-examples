#include "GeneratedTypes.h"

int BscanTRequest_say ( struct PortalInternal *p, const uint32_t v )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_BscanTRequest_say, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_BscanTRequest_say, "BscanTRequest_say")) return 1;
    p->transport->write(p, &temp_working_addr, v);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_BscanTRequest_say << 16) | 2, -1);
    return 0;
};

int BscanTRequest_say2 ( struct PortalInternal *p, const uint16_t a, const uint16_t b )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_BscanTRequest_say2, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_BscanTRequest_say2, "BscanTRequest_say2")) return 1;
    p->transport->write(p, &temp_working_addr, b|(((unsigned long)a)<<16));
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_BscanTRequest_say2 << 16) | 2, -1);
    return 0;
};

int BscanTRequest_setLeds ( struct PortalInternal *p, const uint8_t v )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_BscanTRequest_setLeds, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_BscanTRequest_setLeds, "BscanTRequest_setLeds")) return 1;
    p->transport->write(p, &temp_working_addr, v);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_BscanTRequest_setLeds << 16) | 2, -1);
    return 0;
};

BscanTRequestCb BscanTRequestProxyReq = {
    portal_disconnect,
    BscanTRequest_say,
    BscanTRequest_say2,
    BscanTRequest_setLeds,
};
BscanTRequestCb *pBscanTRequestProxyReq = &BscanTRequestProxyReq;

const uint32_t BscanTRequest_reqinfo = 0x30008;
