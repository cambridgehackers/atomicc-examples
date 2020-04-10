
include ../../makefile.in
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -fdump-record-layouts-simple
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -templatetrace
#CPPFLAGS += -mllvm -rgentrace
#CPPFLAGS += -mllvm -mgentrace
#CPPFLAGS += -mllvm -worktrace

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/ivector.ll ivector.cpp
