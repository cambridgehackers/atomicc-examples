
CLANGBASE = ../../../llvm/build/Debug+Asserts/bin/
UNAME := $(shell uname)
CPP = $(CLANGBASE)clang++ 
LLC = $(CLANGBASE)llc
LINK = $(CLANGBASE)llvm-link
CPPFLAGS = -fblocks -I../../cpp/ -I. -std=c++11 -fno-unwind-tables -fno-use-cxa-atexit -fno-cxx-exceptions
CPPFLAGS += --target=atomicc-unknown-linux-gnu
CPPFLAGS += -I/usr/include/c++/4.2.1
#CPPFLAGS += -fdump-record-layouts
#CPPFLAGS += -fno-catch-undefined-behavior -O
#these 2 flags did not force generation of non-virtual method function names into output file
#CPPFLAGS += -femit-all-decls
#CPPFLAGS += -fvisibility-inlines-hidden
LLVMFLAGS = -emit-llvm

all:
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o echo.ll echo.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o fifo.ll ../../cpp/fifo.cpp

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

run:
	$(CPP) -c $(CPPFLAGS) $(LLVMFLAGS) -o echo.bc echo.cpp
	$(CPP) -c $(CPPFLAGS) $(LLVMFLAGS) -o atomicc.bc ../../cpp/atomicc.cpp
	$(LINK) -v echo.bc atomicc.bc >echo.exe.bc
	../../../llvm/build/Debug+Asserts/bin/lli -force-interpreter=true echo.exe.bc foo
