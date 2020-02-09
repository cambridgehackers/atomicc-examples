#
set -x
set -e
../../../../verilator/verilator_bin --atomicc -y ../../../lib/generated/ -y ../extra/ --top-module ZynqTop ../../../lib/generated/ZynqTop.v 
#grep MODULE obj_dir/*tree
head -40 obj_dir/*tree
