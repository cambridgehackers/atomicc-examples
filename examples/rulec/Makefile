#export FILEGENFLAGS = --implconstraint $(PWD)/../../xilinx/clockBscan.xdc
FILEGENFLAGS += -DVERILATOR_PROJECT_ARGS="--trace"
include ../../makefile.in

CPPFILES = testecho.cpp
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/rulec.ll rulec.cpp
	$(ATOMICCDIR)/atomiccLinker ZynqTop generated/linker
