
#CLANGBASE = /scratch/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/
#CLANGBASE = /afs/csail.mit.edu/group/csg/tools/tools_lx86/android-ndk-r9d/toolchains/llvm-3.3/prebuilt/linux-x86_64/bin/
CLANGBASE = ../../../llvm/build/Debug+Asserts/bin/
UNAME := $(shell uname)
ifeq ($(UNAME),Darwin)
CPP = clang++-mp-3.3
LINK = llvm-link-3.3
else
CPP = $(CLANGBASE)clang++ 
LLC = $(CLANGBASE)llc
LINK = $(CLANGBASE)llvm-link
endif
CPPFLAGS = -g -I../../cpp/ -I. -std=c++11 -fno-unwind-tables -fno-use-cxa-atexit -fno-cxx-exceptions
#-fblocks 
#CPPFLAGS += -fno-catch-undefined-behavior -O
LLVMFLAGS = -emit-llvm

all:
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o echo.ll echo.cpp
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o atomicc.ll ../../cpp/atomicc.cpp
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
