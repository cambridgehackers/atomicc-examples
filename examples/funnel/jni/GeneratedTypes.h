#ifndef __GENERATED_TYPES__
#define __GENERATED_TYPES__
#include "portal.h"
#ifdef __cplusplus
extern "C" {
#endif
typedef uint32_t SpecialTypeForSendingFd;
typedef enum IfcNames { IfcNames_FunnelIndicationH2S=5, IfcNames_FunnelRequestS2H=6,  } IfcNames;


enum { CHAN_NUM_FunnelIndication_heard};
extern const uint32_t FunnelIndication_reqinfo;

typedef struct {
    uint32_t v;
} FunnelIndication_heardData;
typedef union {
    FunnelIndication_heardData heard;
} FunnelIndicationData;
int FunnelIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd);
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*heard) (  struct PortalInternal *p, const uint32_t v );
} FunnelIndicationCb;

int FunnelRequest_say ( struct PortalInternal *p, const uint32_t v );
enum { CHAN_NUM_FunnelRequest_say};
extern const uint32_t FunnelRequest_reqinfo;
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*say) (  struct PortalInternal *p, const uint32_t v );
} FunnelRequestCb;
extern FunnelRequestCb FunnelRequestProxyReq;
#ifdef __cplusplus
}
#endif
#endif //__GENERATED_TYPES__
