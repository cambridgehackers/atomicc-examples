
include ../../makefile.in

CPPFILES = testecho.cpp $(ATOMICC_RUNTIME)/printfHandler.cpp
PRINTF_DATAFILE=generated/printf.generated.printf
CPPFLAGS += -DUSE_PRINTF
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -fdump-record-layouts
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/printf.ll printf.cpp
	$(ATOMICCDIR)/atomiccLinker VsimTop generated/linker

#-include $(DTOP)/generated/printf.generated.filelist
