
include ../../makefile.in

CPPFILES = testecho.cpp printfHandler.cpp
PRINTF_DATAFILE=generated/printf.generated.printf
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -fdump-record-layouts
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/printf.ll printf.cpp

#-include $(DTOP)/generated/printf.generated.filelist
