#ifndef __GENERATED_TYPES__
#define __GENERATED_TYPES__
#include "portal.h"
#ifdef __cplusplus
extern "C" {
#endif
typedef uint32_t SpecialTypeForSendingFd;
typedef enum IfcNames { IfcNames_OinIndicationH2S=5, IfcNames_OinRequestS2H=6,  } IfcNames;


enum { CHAN_NUM_OinIndication_heard};
extern const uint32_t OinIndication_reqinfo;

typedef struct {
    uint32_t v;
} OinIndication_heardData;
typedef union {
    OinIndication_heardData heard;
} OinIndicationData;
int OinIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd);
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*heard) (  struct PortalInternal *p, const uint32_t v );
} OinIndicationCb;

int OinRequest_say ( struct PortalInternal *p, const uint32_t v );
enum { CHAN_NUM_OinRequest_say};
extern const uint32_t OinRequest_reqinfo;
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*say) (  struct PortalInternal *p, const uint32_t v );
} OinRequestCb;
extern OinRequestCb OinRequestProxyReq;
#ifdef __cplusplus
}
#endif
#endif //__GENERATED_TYPES__
