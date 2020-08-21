include ../../makefile.in

CPPFILES = testfunnel.cpp
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace
#CPPFLAGS += -mllvm -mgentrace
FILEGENFLAGS += -DVERILATOR_PROJECT_ARGS="--trace"

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/funneltest.ll funneltest.cpp
	$(ATOMICCDIR)/atomiccLinker l_top generated/linker
