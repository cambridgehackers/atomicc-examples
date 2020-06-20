#ifndef __GENERATED_TYPES__
#define __GENERATED_TYPES__
#include "portal.h"
#ifdef __cplusplus
extern "C" {
#endif
typedef uint32_t SpecialTypeForSendingFd;
typedef enum IfcNames { IfcNames_BtestIndicationH2S=5, IfcNames_BtestRequestS2H=6,  } IfcNames;


enum { CHAN_NUM_BtestIndication_ack,CHAN_NUM_BtestIndication_heard};
extern const uint32_t BtestIndication_reqinfo;

typedef struct {
    uint32_t v;
    uint8_t seqno;
} BtestIndication_ackData;
typedef struct {
    uint32_t v;
    uint8_t writeCount;
    uint8_t readCount;
    uint32_t next;
} BtestIndication_heardData;
typedef union {
    BtestIndication_ackData ack;
    BtestIndication_heardData heard;
} BtestIndicationData;
int BtestIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd);
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*ack) (  struct PortalInternal *p, const uint32_t v, const uint8_t seqno );
    int (*heard) (  struct PortalInternal *p, const uint32_t v, const uint8_t writeCount, const uint8_t readCount, const uint32_t next );
} BtestIndicationCb;

int BtestRequest_say ( struct PortalInternal *p, const uint32_t v, const uint8_t seqno );
enum { CHAN_NUM_BtestRequest_say};
extern const uint32_t BtestRequest_reqinfo;
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*say) (  struct PortalInternal *p, const uint32_t v, const uint8_t seqno );
} BtestRequestCb;
extern BtestRequestCb BtestRequestProxyReq;
#ifdef __cplusplus
}
#endif
#endif //__GENERATED_TYPES__
