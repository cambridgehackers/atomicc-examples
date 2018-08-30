
include ../../makefile.in

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/precision.ll precision.cpp

clean:
	rm -f *.bc *.o *.ll *.s precision.exe.* precision.tmp
