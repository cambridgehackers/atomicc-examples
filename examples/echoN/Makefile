
include ../../makefile.in

all:
	mkdir -p generated
	$(CPP) $(CPPFLAGS) $(LLVMFLAGS) -o generated/echoN.ll echoN.cpp
	$(CPP) $(CPPFLAGS) $(LLVMFLAGS) -o generated/atomicc.ll ../../cpp/atomicc.cpp
