#include "GeneratedTypes.h"

const uint32_t SelectOutIndication_reqinfo = 0x1000c;
const char * SelectOutIndication_methodSignatures()
{
    return "{\"heard\": [\"long\", \"long\"]}";
}

int SelectOutIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd)
{
    static int runaway = 0;
    int   tmp __attribute__ ((unused));
    int tmpfd __attribute__ ((unused));
    SelectOutIndicationData tempdata __attribute__ ((unused));
    memset(&tempdata, 0, sizeof(tempdata));
    volatile unsigned int* temp_working_addr = p->transport->mapchannelInd(p, channel);
    switch (channel) {
    case CHAN_NUM_SelectOutIndication_heard: {
        p->transport->recv(p, temp_working_addr, 2, &tmpfd);
        tmp = p->transport->read(p, &temp_working_addr);
        tempdata.heard.rindex = (uint8_t)(((tmp)&0xfful));
        tmp = p->transport->read(p, &temp_working_addr);
        tempdata.heard.v = (uint32_t)(((tmp)&0xfffffffful));
        ((SelectOutIndicationCb *)p->cb)->heard(p, tempdata.heard.rindex, tempdata.heard.v);
      } break;
    default:
        PORTAL_PRINTF("SelectOutIndication_handleMessage: unknown channel 0x%x\n", channel);
        if (runaway++ > 10) {
            PORTAL_PRINTF("SelectOutIndication_handleMessage: too many bogus indications, exiting\n");
#ifndef __KERNEL__
            exit(-1);
#endif
        }
        return 0;
    }
    return 0;
}
