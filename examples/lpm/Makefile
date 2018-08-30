
include ../../makefile.in

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/lpm.ll lpm.cpp

clean:
	rm -f *.bc *.o *.ll *.s lpm.exe.* lpm.tmp
