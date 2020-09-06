
include ../../makefile.in

#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace
#CPPFLAGS += -mllvm -mgentrace
#CPPFLAGS += -mllvm -worktrace

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/lpm.ll lpm.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/lpmmemory.ll lpmmemory.cpp
