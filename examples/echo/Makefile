include ../../makefile.in
FILEGENFLAGS += --pinout ../rulec/imageon-fmc.json
FILEGENFLAGS += --pinout ../rulec/rulec-zedboard.json
FILEGENFLAGS += --pin-binding fmc:fmc1

CPPFILES = testecho.cpp
#CPPFLAGS += -emit-llvm
#CPPFLAGS += -mllvm -dtrace
#CPPFLAGS += -mllvm -rgentrace
#CPPFLAGS += -fdump-record-layouts

all:
	mkdir -p generated
	$(CPP) -c $(CPPFLAGS) -S $(LLVMFLAGS) -o generated/echo.ll echo.cpp
