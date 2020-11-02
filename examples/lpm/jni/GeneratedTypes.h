#ifndef __GENERATED_TYPES__
#define __GENERATED_TYPES__
#include "portal.h"
#ifdef __cplusplus
extern "C" {
#endif
typedef uint32_t SpecialTypeForSendingFd;
typedef enum IfcNames { IfcNames_LpmIndicationH2S=5, IfcNames_LpmRequestS2H=6,  } IfcNames;


enum { CHAN_NUM_LpmIndication_out};
extern const uint32_t LpmIndication_reqinfo;

typedef struct {
    uint32_t data;
} LpmIndication_outData;
typedef union {
    LpmIndication_outData out;
} LpmIndicationData;
int LpmIndication_handleMessage(struct PortalInternal *p, unsigned int channel, int messageFd);
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*out) (  struct PortalInternal *p, const uint32_t data );
} LpmIndicationCb;

int LpmRequest_enter ( struct PortalInternal *p, const uint32_t data );
int LpmRequest_write ( struct PortalInternal *p, const uint32_t addr, const uint32_t data );
enum { CHAN_NUM_LpmRequest_enter,CHAN_NUM_LpmRequest_write};
extern const uint32_t LpmRequest_reqinfo;
typedef struct {
    PORTAL_DISCONNECT disconnect;
    int (*enter) (  struct PortalInternal *p, const uint32_t data );
    int (*write) (  struct PortalInternal *p, const uint32_t addr, const uint32_t data );
} LpmRequestCb;
extern LpmRequestCb LpmRequestProxyReq;
#ifdef __cplusplus
}
#endif
#endif //__GENERATED_TYPES__
