#ifndef __GENERATED_TYPES__
#define __GENERATED_TYPES__
#include "portal.h"
#ifdef __cplusplus
extern "C" {
#endif
typedef uint32_t SpecialTypeForSendingFd;
typedef enum XsimIfcNames { XsimIfcNames_XsimMsgRequest, XsimIfcNames_XsimMsgIndication,  } XsimIfcNames;
typedef enum IfcNames { IfcNamesNone=0, PlatformIfcNames_MemServerRequestS2H=1, PlatformIfcNames_MMURequestS2H=2, PlatformIfcNames_MemServerIndicationH2S=3, PlatformIfcNames_MMUIndicationH2S=4, IfcNames_EchoIndicationH2S=5, IfcNames_EchoRequestS2H=6,  } IfcNames;

int EchoRequest_say ( struct PortalInternal *p, const uint32_t v );
int EchoRequest_say2 ( struct PortalInternal *p, const uint16_t a, const uint16_t b );
int EchoRequest_setLeds ( struct PortalInternal *p, const uint8_t v );
enum { CHAN_NUM_EchoRequest_say,CHAN_NUM_EchoRequest_say2,CHAN_NUM_EchoRequest_setLeds};
extern const uint32_t EchoRequest_reqinfo;

typedef struct {
    uint32_t v;
} EchoRequest_sayData;
typedef struct {
    uint16_t a;
    uint16_t b;
} EchoRequest_say2Data;
typedef struct {
    uint8_t v;
} EchoRequest_setLedsData;
typedef union {
    EchoRequest_sayData say;
    EchoRequest_say2Data say2;
    EchoRequest_setLedsData setLeds;
} EchoRequestData;
int EchoRequest_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd);
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*say) (  struct PortalInternal *p, const uint32_t v );
    int (*say2) (  struct PortalInternal *p, const uint16_t a, const uint16_t b );
    int (*setLeds) (  struct PortalInternal *p, const uint8_t v );
} EchoRequestCb;
extern EchoRequestCb EchoRequestProxyReq;

int EchoIndication_heard ( struct PortalInternal *p, const uint32_t v );
int EchoIndication_heard2 ( struct PortalInternal *p, const uint16_t a, const uint16_t b );
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
extern EchoIndicationCb EchoIndicationProxyReq;

#ifdef __cplusplus
}
#endif
#endif //__GENERATED_TYPES__