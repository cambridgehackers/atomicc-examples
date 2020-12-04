#include "GeneratedTypes.h"

const uint32_t EchoIndication_reqinfo = 0x20010;
const char * EchoIndication_methodSignatures()
{
    return "{\"heard\": [\"long\"], \"heards\": [\"long\", \"long\", \"long\", \"long\", \"long\", \"long\", \"long\", \"long\"]}";
}

int EchoIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd)
{
    static int runaway = 0;
    int   tmp __attribute__ ((unused));
    int tmpfd __attribute__ ((unused));
    EchoIndicationData tempdata __attribute__ ((unused));
    memset(&tempdata, 0, sizeof(tempdata));
    volatile unsigned int* temp_working_addr = p->transport->mapchannelInd(p, channel);
    switch (channel) {
    case CHAN_NUM_EchoIndication_heard: {
        p->transport->recv(p, temp_working_addr, 1, &tmpfd);
        tmp = p->transport->read(p, &temp_working_addr);
        tempdata.heard.v = (uint32_t)(((tmp)&0xfffffffful));
        ((EchoIndicationCb *)p->cb)->heard(p, tempdata.heard.v);
      } break;
    case CHAN_NUM_EchoIndication_heards: {
        p->transport->recv(p, temp_working_addr, 3, &tmpfd);
        tmp = p->transport->read(p, &temp_working_addr);
        tempdata.heards.ahFrontEnd = (uint16_t)(((tmp)&0xfffful));
        tempdata.heards.ahEnd = (uint16_t)(((tmp>>16)&0xfffful));
        tmp = p->transport->read(p, &temp_working_addr);
        tempdata.heards.avEnd = (uint16_t)(((tmp)&0xfffful));
        tempdata.heards.ahSyncWidth = (uint8_t)(((tmp>>16)&0xfful));
        tempdata.heards.ahBackSync = (uint8_t)(((tmp>>24)&0xfful));
        tmp = p->transport->read(p, &temp_working_addr);
        tempdata.heards.avSyncWidth = (uint8_t)(((tmp)&0xfful));
        tempdata.heards.avBackSync = (uint8_t)(((tmp>>8)&0xfful));
        tempdata.heards.avFrontEnd = (uint16_t)(((tmp>>16)&0xfffful));
        ((EchoIndicationCb *)p->cb)->heards(p, tempdata.heards.ahEnd, tempdata.heards.ahFrontEnd, tempdata.heards.ahBackSync, tempdata.heards.ahSyncWidth, tempdata.heards.avEnd, tempdata.heards.avFrontEnd, tempdata.heards.avBackSync, tempdata.heards.avSyncWidth);
      } break;
    default:
        PORTAL_PRINTF("EchoIndication_handleMessage: unknown channel 0x%x\n", channel);
        if (runaway++ > 10) {
            PORTAL_PRINTF("EchoIndication_handleMessage: too many bogus indications, exiting\n");
#ifndef __KERNEL__
            exit(-1);
#endif
        }
        return 0;
    }
    return 0;
}
