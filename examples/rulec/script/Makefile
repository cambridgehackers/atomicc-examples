
CPPFLAGS += -std=c++11

all:
	touch cacheData.h
	gcc -g -o unzipme unzipme.c -lz
	g++ $(CPPFLAGS) -Wall -g -o dumpXdef dumpXdef.cpp

