#include "GeneratedTypes.h"

const uint32_t BtestIndication_reqinfo = 0x20010;
const char * BtestIndication_methodSignatures()
{
    return "{\"ack\": [\"long\", \"long\"], \"heard\": [\"long\", \"long\", \"long\", \"long\"]}";
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
    case CHAN_NUM_BtestIndication_ack: {
        p->transport->recv(p, temp_working_addr, 2, &tmpfd);
        tmp = p->transport->read(p, &temp_working_addr);
        tempdata.ack.v = (uint32_t)(((uint32_t)(((tmp)&0xfful))<<24));
        tmp = p->transport->read(p, &temp_working_addr);
        tempdata.ack.seqno = (uint8_t)(((tmp)&0xfful));
        tempdata.ack.v |= (uint32_t)(((tmp>>8)&0xfffffful));
        ((BtestIndicationCb *)p->cb)->ack(p, tempdata.ack.v, tempdata.ack.seqno);
      } break;
    case CHAN_NUM_BtestIndication_heard: {
        p->transport->recv(p, temp_working_addr, 3, &tmpfd);
        tmp = p->transport->read(p, &temp_working_addr);
        tempdata.heard.v = (uint32_t)(((uint32_t)(((tmp)&0xfffful))<<16));
        tmp = p->transport->read(p, &temp_working_addr);
        tempdata.heard.readCount = (uint8_t)(((tmp)&0xfful));
        tempdata.heard.writeCount = (uint8_t)(((tmp>>8)&0xfful));
        tempdata.heard.v |= (uint32_t)(((tmp>>16)&0xfffful));
        tmp = p->transport->read(p, &temp_working_addr);
        tempdata.heard.next = (uint32_t)(((tmp)&0xfffffffful));
        ((BtestIndicationCb *)p->cb)->heard(p, tempdata.heard.v, tempdata.heard.writeCount, tempdata.heard.readCount, tempdata.heard.next);
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
