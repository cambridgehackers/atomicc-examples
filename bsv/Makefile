include ../makefile.in

CONNECTAL=$(TOPDIR)/../connectal

#PROJECT=$(CONNECTAL)/examples/echo
#BSOURCES=$(PROJECT)/Echo.bsv
#PROJECT=$(CONNECTAL)/examples/memread
#BSOURCES=$(PROJECT)/ReadTest.bsv
#PROJECT=$(CONNECTAL)/examples/memcpy
#BSOURCES=$(PROJECT)/Memcpy.bsv
#PROJECT=$(CONNECTAL)/examples/simple
#BSOURCES=$(PROJECT)/Simple.bsv
PROJECT=$(CONNECTAL)/examples/memwrite
BSOURCES=$(PROJECT)/Memwrite.bsv

INCLUDES=-I .
INCLUDES+=-I generatedbsv -I $(PROJECT) -I $(CONNECTAL)/bsv -I $(CONNECTAL)/lib/bsv

#BSVTOKAMI=JAVA_OPTS=-ea $(TOPDIR)/../bsvtokami/build/install/bsvtokami/bin/bsvtokami -I . -K generated
BSVTOKAMI=JAVA_OPTS=-ea $(TOPDIR)/../bsvtokami/build/install/bsvtokami/bin/bsvtokami $(INCLUDES) -K generated

FOO =\
     Prelude.bsv
SOURCES=\
    gcd.bsv BRAMCore.bsv BUtils.bsv BuildVector.bsv \
    ClientServer.bsv Clocks.bsv Cntrs.bsv ConfigReg.bsv \
    Connectable.bsv Counter.bsv DefaultValue.bsv \
    FIFO.bsv FIFOF.bsv FIFOLevel.bsv FShow.bsv SpecialFIFOs.bsv \
    GetPut.bsv Prelude.bsv RS232.bsv RegFile.bsv \
    Vector.bsv \
    PipelinedProc.bsv ProcDecExec.bsv ProcMemInterm.bsv ProcMemSpec.bsv

TARGETS=$(patsubst %.bsv, generated/%.generated.IR, $(SOURCES))

BTARGETS=$(patsubst %.bsv, generated/%.generated.IR, $(BSOURCES))

all: outdir $(TARGETS)

connectal: $(BTARGETS)

outdir:
	mkdir -p generated

generated/%.generated.IR: %.bsv .FORCE
	$(BSVTOKAMI) $(*).bsv

.FORCE:

