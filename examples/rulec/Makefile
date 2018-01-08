
CLANGBASE = ../../../llvm/build/bin/
CPP = $(CLANGBASE)clang++ 
LLC = $(CLANGBASE)llc
LINK = $(CLANGBASE)llvm-link
CPPFLAGS = -fblocks -I../../cpp/ -I. -std=c++11 -fno-unwind-tables -fno-use-cxa-atexit -fno-cxx-exceptions
CPPFLAGS += -I/usr/include/c++/4.2.1
CPPFLAGS += -fno-diagnostics-color
CPPFLAGS += -Xclang -disable-lifetime-markers
#CPPFLAGS += -emit-llvm

all:
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o rulec.ll rulec.cpp

clean:
	rm -f *.bc *.o *.ll *.s rulec.exe.* rulec.tmp

run:
	clang++ -std=c++11 -I.. -g testrulec.cpp
	./a.out
	rm -f a.out

