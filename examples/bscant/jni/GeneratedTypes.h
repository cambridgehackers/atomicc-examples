#ifndef __GENERATED_TYPES__
#define __GENERATED_TYPES__
#include "portal.h"
#ifdef __cplusplus
extern "C" {
#endif
typedef uint32_t SpecialTypeForSendingFd;
typedef enum IfcNames { IfcNames_BtestIndicationH2S=5, IfcNames_BtestRequestS2H=6,  } IfcNames;


enum { CHAN_NUM_BtestIndication_heard,CHAN_NUM_BtestIndication_heard2,CHAN_NUM_BtestIndication_heard3};
extern const uint32_t BtestIndication_reqinfo;

typedef struct {
    uint32_t v;
} BtestIndication_heardData;
typedef struct {
    uint16_t a;
    uint16_t b;
} BtestIndication_heard2Data;
typedef struct {
    uint16_t a;
    uint32_t b;
    uint32_t c;
    uint16_t d;
} BtestIndication_heard3Data;
typedef union {
    BtestIndication_heardData heard;
    BtestIndication_heard2Data heard2;
    BtestIndication_heard3Data heard3;
} BtestIndicationData;
int BtestIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd);
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*heard) (  struct PortalInternal *p, const uint32_t v );
    int (*heard2) (  struct PortalInternal *p, const uint16_t a, const uint16_t b );
    int (*heard3) (  struct PortalInternal *p, const uint16_t a, const uint32_t b, const uint32_t c, const uint16_t d );
} BtestIndicationCb;

int BtestRequest_say ( struct PortalInternal *p, const uint32_t v );
int BtestRequest_say2 ( struct PortalInternal *p, const uint16_t a, const uint16_t b );
int BtestRequest_setLeds ( struct PortalInternal *p, const uint8_t v );
enum { CHAN_NUM_BtestRequest_say,CHAN_NUM_BtestRequest_say2,CHAN_NUM_BtestRequest_setLeds};
extern const uint32_t BtestRequest_reqinfo;
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*say) (  struct PortalInternal *p, const uint32_t v );
    int (*say2) (  struct PortalInternal *p, const uint16_t a, const uint16_t b );
    int (*setLeds) (  struct PortalInternal *p, const uint8_t v );
} BtestRequestCb;
extern BtestRequestCb BtestRequestProxyReq;
#ifdef __cplusplus
}
#endif
#endif //__GENERATED_TYPES__
