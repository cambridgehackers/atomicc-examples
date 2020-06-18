#ifndef __GENERATED_TYPES__
#define __GENERATED_TYPES__
#include "portal.h"
#ifdef __cplusplus
extern "C" {
#endif
typedef uint32_t SpecialTypeForSendingFd;
typedef enum IfcNames { IfcNames_PackIndicationH2S=5, IfcNames_PackRequestS2H=6,  } IfcNames;


enum { CHAN_NUM_PackIndication_heard};
extern const uint32_t PackIndication_reqinfo;

typedef struct {
    uint32_t v;
    uint8_t writeCount;
    uint8_t readCount;
    uint8_t seqno;
} PackIndication_heardData;
typedef union {
    PackIndication_heardData heard;
} PackIndicationData;
int PackIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd);
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*heard) (  struct PortalInternal *p, const uint32_t v, const uint8_t writeCount, const uint8_t readCount, const uint8_t seqno );
} PackIndicationCb;

int PackRequest_say ( struct PortalInternal *p, const uint32_t v, const uint8_t seqno );
enum { CHAN_NUM_PackRequest_say};
extern const uint32_t PackRequest_reqinfo;
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*say) (  struct PortalInternal *p, const uint32_t v, const uint8_t seqno );
} PackRequestCb;
extern PackRequestCb PackRequestProxyReq;
#ifdef __cplusplus
}
#endif
#endif //__GENERATED_TYPES__
