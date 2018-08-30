
include ../../makefile.in

all:
	mkdir -p generated
	$(CPP) $(CPPFLAGS) $(LLVMFLAGS) -o generated/counter.ll counter.cpp
	$(CPP) -S $(CPPFLAGS) -o generated/counter.S counter.cpp
	c++filt < counter.ll \
	  | sed -e 's/{/\n{\n/g' \
            -e 's/\" \"/\"\n\"/g' \
            -e 's/}/\n}/g' \
            -e 's/\"(/\"\n        (/g' \
            >counter.tmp
	c++filt < counter.S >counter.s

clean:
	rm -f counter.ll counter.s counter.S counter.o counter.tmp counter.tmp2
