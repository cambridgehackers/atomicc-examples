
include ../../makefile.in

all:
	mkdir -p generated
	$(CPP) -S -c $(CPPFLAGS) $(LLVMFLAGS) -o generated/connect.ll connect.cpp

run:
	clang++ -std=c++11 -I.. -g testconnect.cpp
	./a.out
	rm -f a.out

clean:
	rm -f *.bc *.o *.ll *.s connect.exe.* connect.tmp
