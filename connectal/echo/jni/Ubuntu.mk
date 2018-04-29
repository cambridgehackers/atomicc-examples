
CONNECTALDIR?=$(PWD)/../../../../connectal
DTOP?=$(PWD)/..

CC=$(TOOLCHAIN)gcc
CXX=$(TOOLCHAIN)g++
CFLAGS_COMMON = -O -g -I$(DTOP)/jni -I$(CONNECTALDIR) -I$(CONNECTALDIR)/cpp
CFLAGS = $(CFLAGS_COMMON)

include $(DTOP)/../scripts/Makefile.connectal.application
SOURCES = ../testecho.cpp $(PORTAL_SRC_FILES)
LDLIBS :=    -lpthread

ubuntu.exe: $(SOURCES)
	$(CXX) $(CFLAGS) -o ubuntu.exe $(SOURCES) $(LDLIBS)
