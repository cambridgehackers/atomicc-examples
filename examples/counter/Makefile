
include ../../makefile.in

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) $(LLVMFLAGS) -S -o generated/counter.ll counter.cpp
	$(CPP) -c $(CPPFLAGS) $(LLVMFLAGS) -S -o generated/atomicc.ll ../../cpp/atomicc.cpp
	$(CPP) -c $(CPPFLAGS) -o generated/counter.o counter.cpp
	$(CPP) -c $(CPPFLAGS) -o generated/atomicc.o ../../cpp/atomicc.cpp
