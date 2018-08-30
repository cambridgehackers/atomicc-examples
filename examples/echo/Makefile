
include ../../makefile.in
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -fdump-record-layouts

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/echo.ll echo.cpp

clean:
	rm -f *.bc *.o *.ll *.s echo.exe.* echo.tmp
