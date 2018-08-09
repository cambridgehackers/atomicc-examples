
include ../makefile.in
#CPPFLAGS += -emit-llvm

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/ivector.ll ivector.cpp

clean:
	rm -f *.bc *.o *.ll *.s ivector.exe.* ivector.tmp
