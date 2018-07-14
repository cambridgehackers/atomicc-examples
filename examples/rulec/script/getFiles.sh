#
set -x
set -e
scp $COMPILE_HOST:git/atomicc-examples/examples/rulec/zybo/vivado.log .
scp $COMPILE_HOST:git/atomicc-examples/examples/rulec/zybo/Impl/TopDown/*.dcp .
scp $COMPILE_HOST:git/atomicc-examples/examples/rulec/zybo/Synth/mkZynqTop/mkZynqTop-synth.dcp .
scp $COMPILE_HOST:git/atomicc-examples/examples/rulec/zybo/Synth/mkZynqTop/elaboratedDesign.v .
