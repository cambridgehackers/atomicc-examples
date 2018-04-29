
CONNECTALDIR?=$(PWD)/../../../../connectal
DTOP?=$(PWD)/..

CC=$(TOOLCHAIN)gcc
CXX=$(TOOLCHAIN)g++
CFLAGS_COMMON = -O -g -I$(DTOP)/jni -I$(CONNECTALDIR) -I$(CONNECTALDIR)/cpp
CFLAGS = $(CFLAGS_COMMON)

#include $(DTOP)/../scripts/Makefile.connectal.application
include $(DTOP)/jni/Makefile.generated_files
PORTAL_INFRA := portal.c transportHardware.c transportSocket.c portalPrintf.c poller.cpp sock_utils.c timer.c
#PORTAL_INFRA += transportShared.c transportSerial.c portalJson.c 
PORTAL_SRC_FILES := $(addprefix $(CONNECTALDIR)/cpp/, $(PORTAL_INFRA)) \
      $(addprefix $(DTOP)/jni/,  $(GENERATED_CPP))

SOURCES = ../testecho.cpp $(PORTAL_SRC_FILES)
LDLIBS :=    -lpthread

ubuntu.exe: $(SOURCES)
	$(CXX) $(CFLAGS) -o ubuntu.exe $(SOURCES) $(LDLIBS)
