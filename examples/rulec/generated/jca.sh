#
set -x
set -e
../../../../verilator/verilator_bin --atomicc -y ../../../lib/generated/ -y ../../../extra/ --top-module ZynqTop ../../../lib/generated/ZynqTop.v 
../../../../atomicc/atomiccLinker obj_dir/VZynqTop_010_
