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

int EchoRequest_setup ( struct PortalInternal *p, const uint16_t ahEnd, const uint16_t ahFrontEnd, const uint8_t ahBackSync, const uint8_t ahSyncWidth, const uint16_t avEnd, const uint16_t avFrontEnd, const uint8_t avBackSync, const uint8_t avSyncWidth )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_EchoRequest_setup, 4);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_EchoRequest_setup, "EchoRequest_setup")) return 1;
    p->transport->write(p, &temp_working_addr, ahFrontEnd|(((unsigned long)ahEnd)<<16));
    p->transport->write(p, &temp_working_addr, avEnd|(((unsigned long)ahSyncWidth)<<16)|(((unsigned long)ahBackSync)<<24));
    p->transport->write(p, &temp_working_addr, avSyncWidth|(((unsigned long)avBackSync)<<8)|(((unsigned long)avFrontEnd)<<16));
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_EchoRequest_setup << 16) | 4, -1);
    return 0;
};

EchoRequestCb EchoRequestProxyReq = {
    portal_disconnect,
    EchoRequest_say,
    EchoRequest_setup,
};
EchoRequestCb *pEchoRequestProxyReq = &EchoRequestProxyReq;

const uint32_t EchoRequest_reqinfo = 0x20010;
