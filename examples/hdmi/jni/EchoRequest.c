#include "GeneratedTypes.h"

int EchoRequest_say ( struct PortalInternal *p, const uint32_t v )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_EchoRequest_say, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_EchoRequest_say, "EchoRequest_say")) return 1;
    p->transport->write(p, &temp_working_addr, v);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_EchoRequest_say << 16) | 2, -1);
    return 0;
};

int EchoRequest_muxreset ( struct PortalInternal *p, const uint8_t v )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_EchoRequest_muxreset, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_EchoRequest_muxreset, "EchoRequest_muxreset")) return 1;
    p->transport->write(p, &temp_working_addr, v);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_EchoRequest_muxreset << 16) | 2, -1);
    return 0;
};

int EchoRequest_say2 ( struct PortalInternal *p, const uint16_t a, const uint16_t b )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_EchoRequest_say2, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_EchoRequest_say2, "EchoRequest_say2")) return 1;
    p->transport->write(p, &temp_working_addr, b|(((unsigned long)a)<<16));
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_EchoRequest_say2 << 16) | 2, -1);
    return 0;
};

int EchoRequest_setLeds ( struct PortalInternal *p, const uint8_t v )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_EchoRequest_setLeds, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_EchoRequest_setLeds, "EchoRequest_setLeds")) return 1;
    p->transport->write(p, &temp_working_addr, v);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_EchoRequest_setLeds << 16) | 2, -1);
    return 0;
};

EchoRequestCb EchoRequestProxyReq = {
    portal_disconnect,
    EchoRequest_say,
    EchoRequest_muxreset,
    EchoRequest_say2,
    EchoRequest_setLeds,
};
EchoRequestCb *pEchoRequestProxyReq = &EchoRequestProxyReq;

const uint32_t EchoRequest_reqinfo = 0x40008;
