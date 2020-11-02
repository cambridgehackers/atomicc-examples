#include "GeneratedTypes.h"

const uint32_t LpmIndication_reqinfo = 0x10008;
const char * LpmIndication_methodSignatures()
{
    return "{\"out\": [\"long\"]}";
}

int LpmIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd)
{
    static int runaway = 0;
    int   tmp __attribute__ ((unused));
    int tmpfd __attribute__ ((unused));
    LpmIndicationData tempdata __attribute__ ((unused));
    memset(&tempdata, 0, sizeof(tempdata));
    volatile unsigned int* temp_working_addr = p->transport->mapchannelInd(p, channel);
    switch (channel) {
    case CHAN_NUM_LpmIndication_out: {
        p->transport->recv(p, temp_working_addr, 1, &tmpfd);
        tmp = p->transport->read(p, &temp_working_addr);
        tempdata.out.data = (uint32_t)(((tmp)&0xfffffffful));
        ((LpmIndicationCb *)p->cb)->out(p, tempdata.out.data);
      } break;
    default:
        PORTAL_PRINTF("LpmIndication_handleMessage: unknown channel 0x%x\n", channel);
        if (runaway++ > 10) {
            PORTAL_PRINTF("LpmIndication_handleMessage: too many bogus indications, exiting\n");
#ifndef __KERNEL__
            exit(-1);
#endif
        }
        return 0;
    }
    return 0;
}
