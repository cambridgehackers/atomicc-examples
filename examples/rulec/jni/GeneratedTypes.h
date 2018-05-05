#ifndef __GENERATED_TYPES__
#define __GENERATED_TYPES__
#include "portal.h"
#ifdef __cplusplus
extern "C" {
#endif
typedef uint32_t SpecialTypeForSendingFd;
typedef enum IfcNames { IfcNames_EchoIndicationH2S=5, IfcNames_EchoRequestS2H=6,  } IfcNames;


int EchoRequest_say ( struct PortalInternal *p, const uint32_t v );
int EchoRequest_say2 ( struct PortalInternal *p, const uint16_t a, const uint16_t b );
int EchoRequest_setLeds ( struct PortalInternal *p, const uint8_t v );
int EchoRequest_zsay4 ( struct PortalInternal *p );
enum { CHAN_NUM_EchoRequest_say,CHAN_NUM_EchoRequest_say2,CHAN_NUM_EchoRequest_setLeds,CHAN_NUM_EchoRequest_zsay4};
extern const uint32_t EchoRequest_reqinfo;
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*say) (  struct PortalInternal *p, const uint32_t v );
    int (*say2) (  struct PortalInternal *p, const uint16_t a, const uint16_t b );
    int (*setLeds) (  struct PortalInternal *p, const uint8_t v );
    int (*zsay4) (  struct PortalInternal *p );
} EchoRequestCb;
extern EchoRequestCb EchoRequestProxyReq;

enum { CHAN_NUM_EchoIndication_heard,CHAN_NUM_EchoIndication_heard2};
extern const uint32_t EchoIndication_reqinfo;

typedef struct {
    uint32_t v;
} EchoIndication_heardData;
typedef struct {
    uint16_t a;
    uint16_t b;
} EchoIndication_heard2Data;
typedef union {
    EchoIndication_heardData heard;
    EchoIndication_heard2Data heard2;
} EchoIndicationData;
int EchoIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd);
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*heard) (  struct PortalInternal *p, const uint32_t v );
    int (*heard2) (  struct PortalInternal *p, const uint16_t a, const uint16_t b );
} EchoIndicationCb;
#ifdef __cplusplus
}
#endif
#endif //__GENERATED_TYPES__
