#ifndef __GENERATED_TYPES__
#define __GENERATED_TYPES__
#include "portal.h"
#ifdef __cplusplus
extern "C" {
#endif
typedef uint32_t SpecialTypeForSendingFd;
typedef enum IfcNames { IfcNames_BtestIndicationH2S=5, IfcNames_BtestRequestS2H=6,  } IfcNames;


enum { CHAN_NUM_BtestIndication_heard};
extern const uint32_t BtestIndication_reqinfo;

typedef struct {
    uint32_t v;
} BtestIndication_heardData;
typedef union {
    BtestIndication_heardData heard;
} BtestIndicationData;
int BtestIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd);
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*heard) (  struct PortalInternal *p, const uint32_t v );
} BtestIndicationCb;

int BtestRequest_read ( struct PortalInternal *p, const uint32_t addr );
int BtestRequest_write ( struct PortalInternal *p, const uint32_t addr, const uint32_t data );
enum { CHAN_NUM_BtestRequest_read,CHAN_NUM_BtestRequest_write};
extern const uint32_t BtestRequest_reqinfo;
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*read) (  struct PortalInternal *p, const uint32_t addr );
    int (*write) (  struct PortalInternal *p, const uint32_t addr, const uint32_t data );
} BtestRequestCb;
extern BtestRequestCb BtestRequestProxyReq;
#ifdef __cplusplus
}
#endif
#endif //__GENERATED_TYPES__
