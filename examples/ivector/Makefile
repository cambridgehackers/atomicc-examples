
include ../../makefile.in
#CPPFLAGS += -emit-llvm

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/ivector.ll ivector.cpp
