
CLANGBASE = ../../../llvm/build/bin/
CPP = $(CLANGBASE)clang++ 
LLC = $(CLANGBASE)llc
LINK = $(CLANGBASE)llvm-link
CPPFLAGS = -fblocks -I../../cpp/ -I. -std=c++11 -fno-unwind-tables -fno-use-cxa-atexit -fno-cxx-exceptions
CPPFLAGS += -fno-diagnostics-color
CPPFLAGS += -Xclang -disable-lifetime-markers
#CPPFLAGS += -emit-llvm
include ../makefile.in

#$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/connect.ll connect.cpp
#$(CPP) -c $(CPPFLAGS) $(LLVMFLAGS) -o generated/connect.bc connect.cpp
all:
	mkdir -p generated
	$(CPP) -S -c $(CPPFLAGS) $(LLVMFLAGS) -o generated/connect.ll connect.cpp

run:
	clang++ -std=c++11 -I.. -g testconnect.cpp
	./a.out
	rm -f a.out

clean:
	rm -f *.bc *.o *.ll *.s connect.exe.* connect.tmp
