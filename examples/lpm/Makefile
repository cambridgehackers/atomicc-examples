#export FILEGENFLAGS = --implconstraint $(PWD)/../../xilinx/clockBscan.xdc
FILEGENFLAGS += -DVERILATOR_PROJECT_ARGS="--trace"
include ../../makefile.in

CPPFILES = testlpm.cpp
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace
#CPPFLAGS += -mllvm -mgentrace
#CPPFLAGS += -mllvm -worktrace

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/lpm.ll lpm.cpp
