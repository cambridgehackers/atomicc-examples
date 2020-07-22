include ../../makefile.in

#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace
#CPPFLAGS += -mllvm -mgentrace
CPPFLAGS += -I../acc-04

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/lfsrequiv.ll lfsrequiv.cpp
	$(ATOMICCDIR)/atomiccLinker LfsrEquiv generated/linker
