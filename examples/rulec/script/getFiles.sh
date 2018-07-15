#
set -x
#set -e
mkdir -p synth impl
scp $COMPILE_HOST:git/atomicc-examples/examples/rulec/zybo/vivado.log .
scp $COMPILE_HOST:git/atomicc-examples/examples/rulec/zybo/Impl/TopDown/*.dcp impl/
scp $COMPILE_HOST:git/atomicc-examples/examples/rulec/zybo/Impl/TopDown/*.log impl/
scp $COMPILE_HOST:git/atomicc-examples/examples/rulec/zybo/Synth/mkZynqTop/*.log synth/
scp $COMPILE_HOST:git/atomicc-examples/examples/rulec/zybo/Synth/mkZynqTop/*.dcp synth/
scp $COMPILE_HOST:git/atomicc-examples/examples/rulec/zybo/Synth/mkZynqTop/*.v synth/
scp $COMPILE_HOST:git/atomicc-examples/examples/rulec/zybo/Synth/mkZynqTop/*.edf synth/
