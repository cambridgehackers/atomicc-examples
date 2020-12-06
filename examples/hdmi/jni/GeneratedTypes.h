#ifndef __GENERATED_TYPES__
#define __GENERATED_TYPES__
#include "portal.h"
#ifdef __cplusplus
extern "C" {
#endif
typedef uint32_t SpecialTypeForSendingFd;
typedef enum IfcNames { IfcNames_EchoIndicationH2S=5, IfcNames_EchoRequestS2H=6,  } IfcNames;


enum { CHAN_NUM_EchoIndication_heard};
extern const uint32_t EchoIndication_reqinfo;

typedef struct {
    uint32_t v;
    uint32_t hdmiCounter;
    uint32_t imageonCounter;
} EchoIndication_heardData;
typedef union {
    EchoIndication_heardData heard;
} EchoIndicationData;
int EchoIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd);
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*heard) (  struct PortalInternal *p, const uint32_t v, const uint32_t hdmiCounter, const uint32_t imageonCounter );
} EchoIndicationCb;

int EchoRequest_say ( struct PortalInternal *p, const uint32_t v );
int EchoRequest_muxreset ( struct PortalInternal *p, const uint8_t v );
int EchoRequest_run ( struct PortalInternal *p );
int EchoRequest_setuph ( struct PortalInternal *p, const uint16_t ahEnd, const uint16_t ahFrontEnd, const uint8_t ahBackSync, const uint8_t ahSyncWidth );
int EchoRequest_setupv ( struct PortalInternal *p, const uint16_t avEnd, const uint16_t avFrontEnd, const uint8_t avBackSync, const uint8_t avSyncWidth );
int EchoRequest_setupTest ( struct PortalInternal *p, const uint8_t apattern, const uint32_t aramp );
enum { CHAN_NUM_EchoRequest_say,CHAN_NUM_EchoRequest_muxreset,CHAN_NUM_EchoRequest_run,CHAN_NUM_EchoRequest_setuph,CHAN_NUM_EchoRequest_setupv,CHAN_NUM_EchoRequest_setupTest};
extern const uint32_t EchoRequest_reqinfo;
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*say) (  struct PortalInternal *p, const uint32_t v );
    int (*muxreset) (  struct PortalInternal *p, const uint8_t v );
    int (*run) (  struct PortalInternal *p );
    int (*setuph) (  struct PortalInternal *p, const uint16_t ahEnd, const uint16_t ahFrontEnd, const uint8_t ahBackSync, const uint8_t ahSyncWidth );
    int (*setupv) (  struct PortalInternal *p, const uint16_t avEnd, const uint16_t avFrontEnd, const uint8_t avBackSync, const uint8_t avSyncWidth );
    int (*setupTest) (  struct PortalInternal *p, const uint8_t apattern, const uint32_t aramp );
} EchoRequestCb;
extern EchoRequestCb EchoRequestProxyReq;
#ifdef __cplusplus
}
#endif
#endif //__GENERATED_TYPES__
