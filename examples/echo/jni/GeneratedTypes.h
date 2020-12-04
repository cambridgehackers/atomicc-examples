#ifndef __GENERATED_TYPES__
#define __GENERATED_TYPES__
#include "portal.h"
#ifdef __cplusplus
extern "C" {
#endif
typedef uint32_t SpecialTypeForSendingFd;
typedef enum IfcNames { IfcNames_EchoIndicationH2S=5, IfcNames_EchoRequestS2H=6,  } IfcNames;


enum { CHAN_NUM_EchoIndication_heard,CHAN_NUM_EchoIndication_heards};
extern const uint32_t EchoIndication_reqinfo;

typedef struct {
    uint32_t v;
} EchoIndication_heardData;
typedef struct {
    uint16_t ahEnd;
    uint16_t ahFrontEnd;
    uint8_t ahBackSync;
    uint8_t ahSyncWidth;
    uint16_t avEnd;
    uint16_t avFrontEnd;
    uint8_t avBackSync;
    uint8_t avSyncWidth;
} EchoIndication_heardsData;
typedef union {
    EchoIndication_heardData heard;
    EchoIndication_heardsData heards;
} EchoIndicationData;
int EchoIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd);
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*heard) (  struct PortalInternal *p, const uint32_t v );
    int (*heards) (  struct PortalInternal *p, const uint16_t ahEnd, const uint16_t ahFrontEnd, const uint8_t ahBackSync, const uint8_t ahSyncWidth, const uint16_t avEnd, const uint16_t avFrontEnd, const uint8_t avBackSync, const uint8_t avSyncWidth );
} EchoIndicationCb;

int EchoRequest_say ( struct PortalInternal *p, const uint32_t v );
int EchoRequest_setup ( struct PortalInternal *p, const uint16_t ahEnd, const uint16_t ahFrontEnd, const uint8_t ahBackSync, const uint8_t ahSyncWidth, const uint16_t avEnd, const uint16_t avFrontEnd, const uint8_t avBackSync, const uint8_t avSyncWidth );
enum { CHAN_NUM_EchoRequest_say,CHAN_NUM_EchoRequest_setup};
extern const uint32_t EchoRequest_reqinfo;
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*say) (  struct PortalInternal *p, const uint32_t v );
    int (*setup) (  struct PortalInternal *p, const uint16_t ahEnd, const uint16_t ahFrontEnd, const uint8_t ahBackSync, const uint8_t ahSyncWidth, const uint16_t avEnd, const uint16_t avFrontEnd, const uint8_t avBackSync, const uint8_t avSyncWidth );
} EchoRequestCb;
extern EchoRequestCb EchoRequestProxyReq;
#ifdef __cplusplus
}
#endif
#endif //__GENERATED_TYPES__
