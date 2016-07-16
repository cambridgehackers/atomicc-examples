
CLANGBASE = ../../../llvm/build/bin/
CPP = $(CLANGBASE)clang++ 
LLC = $(CLANGBASE)llc
LINK = $(CLANGBASE)llvm-link
CPPFLAGS = -fblocks -I../../cpp/ -I. -std=c++11 -fno-unwind-tables -fno-use-cxa-atexit -fno-cxx-exceptions
#needed on Mac to find <string>
CPPFLAGS += -I/usr/include/c++/4.2.1
CPPFLAGS += -fno-diagnostics-color

#$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o connect.ll connect.cpp
#$(CPP) -c $(CPPFLAGS) $(LLVMFLAGS) -o connect.bc connect.cpp
all:
	$(CPP) -S -c $(CPPFLAGS) $(LLVMFLAGS) connect.cpp

run:
	clang++ -std=c++11 -I.. -g testconnect.cpp
	./a.out
	rm -f a.out

clean:
	rm -f *.bc *.o *.ll *.s connect.exe.* connect.tmp
