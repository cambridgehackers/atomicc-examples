
include ../makefile.in
#CPPFLAGS += -emit-llvm
# trace interface declaration forcing
#CPPFLAGS += -mllvm -itrace
# trace end of record decl semantics
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -templatetrace
#CPPFLAGS += -mllvm -rgentrace
#trace all method bodies being generated
#CPPFLAGS += -mllvm -mgentrace
#CPPFLAGS += -mllvm -worktrace

SOURCES= iobufVec.cpp fifo.cpp mux.cpp adapter.cpp vsimTop.cpp zynqTop.cpp \
    connectNet2.cpp userTop.cpp resetInverter.cpp axiTop.cpp clockTop.cpp \
    mimo.cpp sizedFifo.cpp configCounter.cpp \
    grayCounter.cpp bscan.cpp syncFF.cpp printfStub.cpp out2in.cpp \
    funnel.cpp atomicc.cpp bram.cpp tracebuf.cpp selectout.cpp \
    asyncControl.cpp

CDIRS=$(patsubst %.cpp, %, $(SOURCES))

$(CDIRS):
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/$@.ll $@.cpp
	./make_header.sh

all: $(CDIRS)
