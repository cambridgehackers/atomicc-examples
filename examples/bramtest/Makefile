include ../../makefile.in

CPPFILES = testbram.cpp
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace
FILEGENFLAGS += -DVERILATOR_PROJECT_ARGS="--trace"

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/bramt.ll bramt.cpp

