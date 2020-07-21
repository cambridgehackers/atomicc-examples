include ../../makefile.in

#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace
#CPPFLAGS += -mllvm -mgentrace

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/pastassert.ll pastassert.cpp
	$(ATOMICCDIR)/atomiccLinker PastAssert generated/linker
