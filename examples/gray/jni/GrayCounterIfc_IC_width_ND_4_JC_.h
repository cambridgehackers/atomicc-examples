#include "GeneratedTypes.h"
#ifndef _GRAYCOUNTERIFC_IC_WIDTH_ND_4_JC__H_
#define _GRAYCOUNTERIFC_IC_WIDTH_ND_4_JC__H_
#include "portal.h"
#include <fcntl.h>
#include <semaphore.h>

class GrayCounterIfc_IC_width_ND_4_JC_Proxy : public Portal {
    GrayCounterIfc_IC_width_ND_4_JC_Cb *cb;
public:
    GrayCounterIfc_IC_width_ND_4_JC_Proxy(int id, int tile = DEFAULT_TILE, GrayCounterIfc_IC_width_ND_4_JC_Cb *cbarg = &GrayCounterIfc_IC_width_ND_4_JC_ProxyReq, int bufsize = GrayCounterIfc_IC_width_ND_4_JC__reqinfo, PortalPoller *poller = 0) :
        Portal(id, tile, bufsize, __internalHandleMessage, NULL, this, poller), cb(cbarg) {__internalInit();};
    GrayCounterIfc_IC_width_ND_4_JC_Proxy(int id, PortalTransportFunctions *transport, void *param, GrayCounterIfc_IC_width_ND_4_JC_Cb *cbarg = &GrayCounterIfc_IC_width_ND_4_JC_ProxyReq, int bufsize = GrayCounterIfc_IC_width_ND_4_JC__reqinfo, PortalPoller *poller = 0) :
        Portal(id, DEFAULT_TILE, bufsize, __internalHandleMessage, NULL, transport, param, this, poller), cb(cbarg) {__internalInit();};
    GrayCounterIfc_IC_width_ND_4_JC_Proxy(int id, PortalPoller *poller) :
        Portal(id, DEFAULT_TILE, GrayCounterIfc_IC_width_ND_4_JC__reqinfo, __internalHandleMessage, NULL, NULL, NULL, this, poller), cb(&GrayCounterIfc_IC_width_ND_4_JC_ProxyReq) {__internalInit();};
    void increment (  ) { cb->increment (&pint); };
    void decrement (  ) { cb->decrement (&pint); };
    uint16_t readGray (  ) { cb->readGray (&pint); return __internalWaitReturn(2, 10); };
    void writeGray ( const uint16_t v ) { cb->writeGray (&pint, v); };
    uint16_t readBin (  ) { cb->readBin (&pint); return __internalWaitReturn(4, 10); };
    void writeBin ( const uint16_t v ) { cb->writeBin (&pint, v); };

private:
    static int __internalHandleMessage(struct PortalInternal *p, unsigned int channel, int messageFd) {
        return ((GrayCounterIfc_IC_width_ND_4_JC_Proxy *)p->parent)->__internalResponse(p, channel);
    }
    sem_t *__internalWaitSemaphore;
    sem_t __internalWaitSemaphoreBody;
    uint64_t __internalWaitResult;
    unsigned int __internalWaitMethod;
    int __internalWaitSize;
    void __internalInit() {
        if ((__internalWaitSemaphore = sem_open("/semaphore", O_CREAT, 0644, 0)) == SEM_FAILED) {
            __internalWaitSemaphore = &__internalWaitSemaphoreBody;
            if (sem_init(__internalWaitSemaphore, 1, 0) == 0)
                return;
            perror("sem_open failed");
            exit(-1);
        }
    }
    int __internalResponse(struct PortalInternal *p, unsigned int channel) {
        int tmpfd __attribute__ ((unused));
        volatile unsigned int* temp_working_addr = p->transport->mapchannelInd(p, channel);
        int offset = 0, remain = 1;
        p->transport->recv(p, temp_working_addr, 1, &tmpfd);
        uint32_t temp = p->transport->read(p, &temp_working_addr);
        offset++;
        int messageSize = temp & 0xffff;
        temp = temp >> 16;
        if (channel != __internalWaitMethod || __internalWaitSize != messageSize)
             printf("GrayCounterIfc_IC_width_ND_4_JC_Proxy: channel %d/%d waitSize %d messageSize %d\n", channel, __internalWaitMethod, __internalWaitSize, messageSize);
        __internalWaitResult = 0;
        uint16_t *dest = (uint16_t *)&__internalWaitResult;
        while (messageSize > 0) {
            if (remain == 0) {
                p->transport->recv(p, temp_working_addr, 1, &tmpfd);
                temp = p->transport->read(p, &temp_working_addr);
                offset++;
                remain = 2;
            }
            *dest++ = temp & 0xffff;
            temp = temp >> 16;
            messageSize -= 16;
            --remain;
        }
        sem_post(__internalWaitSemaphore);
        return 0;
    }
    uint64_t __internalWaitReturn(int method, int size) {
        __internalWaitMethod = method;
        __internalWaitSize = size;
        sem_wait(__internalWaitSemaphore);
        return __internalWaitResult;
    }
};
#endif // _GRAYCOUNTERIFC_IC_WIDTH_ND_4_JC__H_
