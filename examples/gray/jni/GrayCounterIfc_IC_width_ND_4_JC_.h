#include "GeneratedTypes.h"
#ifndef _GRAYCOUNTERIFC_IC_WIDTH_ND_4_JC__H_
#define _GRAYCOUNTERIFC_IC_WIDTH_ND_4_JC__H_
#include "portal.h"
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
    void decrement (  ) { cb->decrement (&pint); };
    void flag ( const uint32_t v ) { cb->flag (&pint, v); };
    void increment (  ) { cb->increment (&pint); };
    uint8_t readBin (  ) { cb->readBin (&pint); return __internalWaitReturn(3, 4); };
    uint8_t readGray (  ) { cb->readGray (&pint); return __internalWaitReturn(4, 4); };
    void writeBin ( const uint8_t v ) { cb->writeBin (&pint, v); };
    void writeGray ( const uint8_t v ) { cb->writeGray (&pint, v); };

private:
    static int __internalHandleMessage(struct PortalInternal *p, unsigned int channel, int messageFd) {
        return ((GrayCounterIfc_IC_width_ND_4_JC_Proxy *)p->parent)->__internalResponse(channel);
    }
    sem_t *__internalWaitSemaphore;
    uint64_t __internalWaitResult;
    int __internalWaitMethod, __internalWaitSize;
    void __internalInit() {
        if ((__internalWaitSemaphore = sem_open("/semaphore", O_CREAT, 0644, 0)) == SEM_FAILED) {
            perror("sem_open failed");
            exit(-1);
        }
    }
    int __internalResponse(unsigned int channel) {
        volatile uint16_t *datap = (volatile uint16_t *)&pint.map_base[1];
        int messageSize = *datap++;
        if (channel != __internalWaitMethod || __internalWaitSize != messageSize)
             printf("GrayCounterIfc_IC_width_ND_4_JC_Proxy: channel %d/%d waitSize %d messageSize %d\n", channel, __internalWaitMethod, __internalWaitSize, messageSize);
        memcpy((void *)&__internalWaitResult, (void *)datap, sizeof(__internalWaitResult));
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
