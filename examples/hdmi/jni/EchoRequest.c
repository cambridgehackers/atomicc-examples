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

int EchoRequest_run ( struct PortalInternal *p )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_EchoRequest_run, 1);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_EchoRequest_run, "EchoRequest_run")) return 1;
    p->transport->write(p, &temp_working_addr, 0);
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_EchoRequest_run << 16) | 1, -1);
    return 0;
};

int EchoRequest_setuph ( struct PortalInternal *p, const uint16_t ahEnd, const uint16_t ahFrontEnd, const uint8_t ahBackSync, const uint8_t ahSyncWidth )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_EchoRequest_setuph, 3);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_EchoRequest_setuph, "EchoRequest_setuph")) return 1;
    p->transport->write(p, &temp_working_addr, (ahEnd>>4));
    p->transport->write(p, &temp_working_addr, ahSyncWidth|(((unsigned long)ahBackSync)<<8)|(((unsigned long)ahFrontEnd)<<16)|(((unsigned long)ahEnd)<<28));
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_EchoRequest_setuph << 16) | 3, -1);
    return 0;
};

int EchoRequest_setupv ( struct PortalInternal *p, const uint16_t avEnd, const uint16_t avFrontEnd, const uint8_t avBackSync, const uint8_t avSyncWidth )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_EchoRequest_setupv, 3);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_EchoRequest_setupv, "EchoRequest_setupv")) return 1;
    p->transport->write(p, &temp_working_addr, (avEnd>>4));
    p->transport->write(p, &temp_working_addr, avSyncWidth|(((unsigned long)avBackSync)<<8)|(((unsigned long)avFrontEnd)<<16)|(((unsigned long)avEnd)<<28));
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_EchoRequest_setupv << 16) | 3, -1);
    return 0;
};

int EchoRequest_setupTest ( struct PortalInternal *p, const uint8_t apattern, const uint32_t aramp )
{
    volatile unsigned int* temp_working_addr_start = p->transport->mapchannelReq(p, CHAN_NUM_EchoRequest_setupTest, 2);
    volatile unsigned int* temp_working_addr = temp_working_addr_start;
    if (p->transport->busywait(p, CHAN_NUM_EchoRequest_setupTest, "EchoRequest_setupTest")) return 1;
    p->transport->write(p, &temp_working_addr, aramp|(((unsigned long)apattern)<<20));
    p->transport->send(p, temp_working_addr_start, (CHAN_NUM_EchoRequest_setupTest << 16) | 2, -1);
    return 0;
};

EchoRequestCb EchoRequestProxyReq = {
    portal_disconnect,
    EchoRequest_say,
    EchoRequest_muxreset,
    EchoRequest_run,
    EchoRequest_setuph,
    EchoRequest_setupv,
    EchoRequest_setupTest,
};
EchoRequestCb *pEchoRequestProxyReq = &EchoRequestProxyReq;

const uint32_t EchoRequest_reqinfo = 0x6000c;
