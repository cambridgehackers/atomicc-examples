include ../../makefile.in

CPPFILES = testselectout.cpp
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace
#CPPFLAGS += -mllvm -mgentrace
FILEGENFLAGS += -DVERILATOR_PROJECT_ARGS="--trace"

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/selectouttest.ll selectouttest.cpp
	$(ATOMICCDIR)/atomiccLinker VsimTop generated/linker
