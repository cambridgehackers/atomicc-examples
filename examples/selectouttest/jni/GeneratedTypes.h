#ifndef __GENERATED_TYPES__
#define __GENERATED_TYPES__
#include "portal.h"
#ifdef __cplusplus
extern "C" {
#endif
typedef uint32_t SpecialTypeForSendingFd;
typedef enum IfcNames { IfcNames_SelectOutIndicationH2S=5, IfcNames_SelectOutRequestS2H=6,  } IfcNames;


enum { CHAN_NUM_SelectOutIndication_heard};
extern const uint32_t SelectOutIndication_reqinfo;

typedef struct {
    uint8_t rindex;
    uint32_t v;
} SelectOutIndication_heardData;
typedef union {
    SelectOutIndication_heardData heard;
} SelectOutIndicationData;
int SelectOutIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd);
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*heard) (  struct PortalInternal *p, const uint8_t rindex, const uint32_t v );
} SelectOutIndicationCb;

int SelectOutRequest_say ( struct PortalInternal *p, const uint32_t v );
enum { CHAN_NUM_SelectOutRequest_say};
extern const uint32_t SelectOutRequest_reqinfo;
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*say) (  struct PortalInternal *p, const uint32_t v );
} SelectOutRequestCb;
extern SelectOutRequestCb SelectOutRequestProxyReq;
#ifdef __cplusplus
}
#endif
#endif //__GENERATED_TYPES__
