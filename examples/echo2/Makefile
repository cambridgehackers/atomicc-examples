
CLANGBASE = ../../../llvm/build/bin/
CPP = $(CLANGBASE)clang++ 
LLC = $(CLANGBASE)llc
LINK = $(CLANGBASE)llvm-link
CPPFLAGS = -fblocks -I../../cpp/ -I. -std=c++11 -fno-unwind-tables -fno-use-cxa-atexit -fno-cxx-exceptions
CPPFLAGS += -fno-diagnostics-color
CPPFLAGS += -Xclang -disable-lifetime-markers
#CPPFLAGS += -emit-llvm
include ../makefile.in

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/ivector.ll ivector.cpp
	#$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/fifo.ll ../../cpp/fifo.cpp

clean:
	rm -f *.bc *.o *.ll *.s ivector.exe.* ivector.tmp
