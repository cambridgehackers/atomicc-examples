include ../makefile.in

BSVTOKAMI=JAVA_OPTS=-ea $(TOPDIR)/../bsvtokami/build/install/bsvtokami/bin/bsvtokami -I . -K generated

FOO =\
     BuildVector.bsv Cntrs.bsv SpecialFIFOs.bsv Prelude.bsv ProcMemInterm.bsv
SOURCES=\
    gcd.bsv BRAMCore.bsv BUtils.bsv BuildVector.bsv \
    ClientServer.bsv Clocks.bsv Cntrs.bsv ConfigReg.bsv \
    Connectable.bsv Counter.bsv DefaultValue.bsv \
    FIFO.bsv FIFOF.bsv FIFOLevel.bsv FShow.bsv SpecialFIFOs.bsv \
    GetPut.bsv Prelude.bsv RS232.bsv RegFile.bsv \
    Vector.bsv \
    PipelinedProc.bsv ProcDecExec.bsv ProcMemInterm.bsv ProcMemSpec.bsv

TARGETS=$(patsubst %.bsv, generated/%.generated.IR, $(SOURCES))

all: outdir $(TARGETS)

outdir:
	mkdir -p generated

generated/%.generated.IR: %.bsv .FORCE
	$(BSVTOKAMI) $(*).bsv

.FORCE:
