
include $(CLEAR_VARS)
BOARD=zybo
CONNECTALDIR?=$(DTOP)/../../../connectal
CONNECTALSDIR?=$(DTOP)/../../connectal
LOCAL_ARM_MODE := arm
include $(CONNECTALSDIR)/scripts/Makefile.connectal.application
LOCAL_SRC_FILES := $(DTOP)/testecho.cpp $(PORTAL_SRC_FILES)

LOCAL_PATH :=
LOCAL_MODULE := android.exe
LOCAL_MODULE_TAGS := optional
LOCAL_LDLIBS := -llog   
LOCAL_CPPFLAGS := "-march=armv7-a"
LOCAL_CFLAGS := -D__ATOMICC__ -DBOARD_$(BOARD) -I$(DTOP)/$(BOARD) -I$(DTOP)/jni -I$(CONNECTALDIR) -I$(CONNECTALDIR)/cpp -I$(CONNECTALDIR)/lib/cpp   -Werror
LOCAL_CXXFLAGS := $(LOCAL_CFLAGS)
#-D__ATOMICC__ -I$(DTOP)/$(BOARD) -I$(DTOP)/jni -I$(CONNECTALDIR) -I$(CONNECTALDIR)/cpp -I$(CONNECTALDIR)/lib/cpp   -Werror
LOCAL_CFLAGS2 := $(cdefines2)s

include $(BUILD_EXECUTABLE)
