
CLANGBASE = ../../../llvm/build/bin/
CPP = $(CLANGBASE)clang++ 
LLC = $(CLANGBASE)llc
LINK = $(CLANGBASE)llvm-link
CPPFLAGS = -fblocks -I../../cpp/ -I. -std=c++11 -fno-unwind-tables -fno-use-cxa-atexit -fno-cxx-exceptions
CPPFLAGS += -fno-diagnostics-color
CPPFLAGS += -I/usr/include/c++/4.2.1
CPPFLAGS += -Xclang -disable-lifetime-markers
#CPPFLAGS += -emit-llvm
#   catch signal SIGSEGV
#   set follow-fork-mode child

all:
	mkdir -p generated
	#$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/fifo.ll ../../cpp/fifo.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/ivector.ll ivector.cpp

run:
	clang++ -std=c++11 -I.. -g testivector.cpp
	./a.out
	rm -f a.out


clean:
	rm -f *.bc *.o *.ll *.s ivector.exe.* ivector.tmp
