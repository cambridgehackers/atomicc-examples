#include "GeneratedTypes.h"

const uint32_t ReturnInd_IC_width_ND_4_JC__reqinfo = 0x10008;
const char * ReturnInd_IC_width_ND_4_JC__methodSignatures()
{
    return "{\"value\": [\"long\"]}";
}

int ReturnInd_IC_width_ND_4_JC__handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd)
{
    static int runaway = 0;
    int tmpfd __attribute__ ((unused));
    ReturnInd_IC_width_ND_4_JC_Data tempdata __attribute__ ((unused));
    memset(&tempdata, 0, sizeof(tempdata));
    volatile unsigned int* temp_working_addr = &p->map_base[1];
    switch (channel) {
    case CHAN_NUM_ReturnInd_IC_width_ND_4_JC__value: {
        tempdata.value.v = (uint8_t)(((temp_working_addr[0])&0xful));
        ((ReturnInd_IC_width_ND_4_JC_Cb *)p->cb)->value(p, tempdata.value.v);
      } break;
    default:
        PORTAL_PRINTF("ReturnInd_IC_width_ND_4_JC__handleMessage: unknown channel 0x%x\n", channel);
        if (runaway++ > 10) {
            PORTAL_PRINTF("ReturnInd_IC_width_ND_4_JC__handleMessage: too many bogus indications, exiting\n");
#ifndef __KERNEL__
            exit(-1);
#endif
        }
        return 0;
    }
    return 0;
}
