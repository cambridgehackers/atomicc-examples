#
#set -x
set -e
(cd generated; ls *.vh) >generated/atomicclib.vh
sed -i -e 's/.*/`include "&"/' generated/atomicclib.vh
sed -i -e '1i`ifndef __ATOMICCLIB_VH__' \
  -e '1i`define __ATOMICCLIB_VH__' \
  -e '$a`endif' \
   generated/atomicclib.vh
