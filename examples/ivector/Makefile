
CLANGBASE = ../../../llvm/build/bin/
CPP = $(CLANGBASE)clang++ 
LLC = $(CLANGBASE)llc
LINK = $(CLANGBASE)llvm-link
CPPFLAGS = -fblocks -I../../cpp/ -I. -std=c++11 -fno-unwind-tables -fno-use-cxa-atexit -fno-cxx-exceptions
CPPFLAGS += -fno-diagnostics-color
CPPFLAGS += -I/usr/include/c++/4.2.1
CPPFLAGS += -Xclang -disable-lifetime-markers
#   catch signal SIGSEGV
#   set follow-fork-mode child

all:
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o ivector.ll ivector.cpp
	#$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o fifo.ll ../../cpp/fifo.cpp

run:
	clang++ -std=c++11 -I.. -g testivector.cpp
	./a.out
	rm -f a.out


clean:
	rm -f *.bc *.o *.ll *.s ivector.exe.* ivector.tmp
