
CLANGBASE = ../../../llvm/build/bin/
UNAME := $(shell uname)
CPP = $(CLANGBASE)clang++ 
LLC = $(CLANGBASE)llc
LINK = $(CLANGBASE)llvm-link
CPPFLAGS = -fblocks -I../../cpp/ -I. -std=c++11 -fno-unwind-tables -fno-use-cxa-atexit -fno-cxx-exceptions
CPPFLAGS += -I/usr/include/c++/4.2.1
CPPFLAGS += -fno-diagnostics-color
CPPFLAGS += -Xclang -disable-lifetime-markers
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -fdump-record-layouts
#CPPFLAGS += -fno-catch-undefined-behavior -O
#these 2 flags did not force generation of non-virtual method function names into output file
#CPPFLAGS += -femit-all-decls
#CPPFLAGS += -fvisibility-inlines-hidden

all:
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o echo.ll echo.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o fifo.ll ../../cpp/fifo.cpp

run:
	clang++ -std=c++11 -I.. -g testecho.cpp
	./a.out
	rm -f a.out

unused:
	#$(LLC) -march=cpp -o echo.llvm.output echo.ll
	c++filt < echo.ll  \
	  | sed -e 's/{/\n{\n/g' \
            -e 's/\" \"/\"\n\"/g' \
            -e 's/}/\n}/g' \
            -e 's/\"(/\"\n        (/g' \
            >echo.tmp

backend:
	$(LLC) echo.ll

clean:
	rm -f *.bc *.o *.ll *.s echo.exe.* echo.tmp

zzrun:
	$(CPP) -c $(CPPFLAGS) $(LLVMFLAGS) -o echo.bc echo.cpp
	$(CPP) -c $(CPPFLAGS) $(LLVMFLAGS) -o atomicc.bc ../../cpp/atomicc.cpp
	$(LINK) -v echo.bc atomicc.bc >echo.exe.bc
	../../../llvm/build/Debug+Asserts/bin/lli -force-interpreter=true echo.exe.bc foo
