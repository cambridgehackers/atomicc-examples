
include ../../makefile.in

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/before1.ll before1.cpp

run:
	clang++ -std=c++11 -I.. -g testbefore1.cpp
	./a.out
	rm -f a.out

clean:
	rm -f *.bc *.o *.ll *.s before1.exe.* before1.tmp
