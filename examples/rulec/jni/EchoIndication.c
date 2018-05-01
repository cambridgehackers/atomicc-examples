#include "GeneratedTypes.h"

const uint32_t EchoIndication_reqinfo = 0x20008;
const char * EchoIndication_methodSignatures()
{
    return "{\"heard2\": [\"long\", \"long\"], \"heard\": [\"long\"]}";
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
    case CHAN_NUM_EchoIndication_heard2: {
        
        p->transport->recv(p, temp_working_addr, 1, &tmpfd);
        tmp = p->transport->read(p, &temp_working_addr);
        tempdata.heard2.b = (uint16_t)(((tmp)&0xfffful));
        tempdata.heard2.a = (uint16_t)(((tmp>>16)&0xfffful));
        ((EchoIndicationCb *)p->cb)->heard2(p, tempdata.heard2.a, tempdata.heard2.b);
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
