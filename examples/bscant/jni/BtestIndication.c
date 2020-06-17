#include "GeneratedTypes.h"

const uint32_t BtestIndication_reqinfo = 0x1000c;
const char * BtestIndication_methodSignatures()
{
    return "{\"heard\": [\"long\", \"long\", \"long\", \"long\"]}";
}

int BtestIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd)
{
    static int runaway = 0;
    int   tmp __attribute__ ((unused));
    int tmpfd __attribute__ ((unused));
    BtestIndicationData tempdata __attribute__ ((unused));
    memset(&tempdata, 0, sizeof(tempdata));
    volatile unsigned int* temp_working_addr = p->transport->mapchannelInd(p, channel);
    switch (channel) {
    case CHAN_NUM_BtestIndication_heard: {
        p->transport->recv(p, temp_working_addr, 2, &tmpfd);
        tmp = p->transport->read(p, &temp_working_addr);
        tempdata.heard.v = (uint32_t)(((uint32_t)(((tmp)&0xfffffful))<<8));
        tmp = p->transport->read(p, &temp_working_addr);
        tempdata.heard.seqno = (uint8_t)(((tmp)&0xfful));
        tempdata.heard.readCount = (uint8_t)(((tmp>>8)&0xfful));
        tempdata.heard.writeCount = (uint8_t)(((tmp>>16)&0xfful));
        tempdata.heard.v |= (uint32_t)(((tmp>>24)&0xfful));
        ((BtestIndicationCb *)p->cb)->heard(p, tempdata.heard.v, tempdata.heard.writeCount, tempdata.heard.readCount, tempdata.heard.seqno);
      } break;
    default:
        PORTAL_PRINTF("BtestIndication_handleMessage: unknown channel 0x%x\n", channel);
        if (runaway++ > 10) {
            PORTAL_PRINTF("BtestIndication_handleMessage: too many bogus indications, exiting\n");
#ifndef __KERNEL__
            exit(-1);
#endif
        }
        return 0;
    }
    return 0;
}
