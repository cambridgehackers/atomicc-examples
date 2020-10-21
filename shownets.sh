# source filename
open_checkpoint zedboard/bin/top-post-route.dcp
report_timing -verbose -file zedboard/timing_all.txt
report_utilization -hierarchical  -file zedboard/utilization.txt

set fp [open zedboard/layoutnets.txt w]
set all_nets   [get_nets -hsc "/" -quiet -hierarchical ]
foreach net $all_nets {
    if {"$net" == "<const0>"} continue
    if {"$net" == "<const1>"} continue
    set plist ""
    set all_pins [get_pins -quiet -of_objects $net]
    foreach pin $all_pins {
        if {[regexp {.*/PAD} $pin]} continue
        if {[regexp {.*/IO} $pin]} continue
        if {"$net" != "$pin"} { append plist " $pin" }
    }
    if {$plist != ""} { puts $fp "$net: $plist" }
}
#foreach net $all_nets { set temp [get_property NAME $net]; puts $fp $temp }
close $fp
write_verilog -force zedboard/layoutnet.v

open_checkpoint zedboard/Synth/ZynqTop/ZynqTop-synth.dcp
write_verilog -force zedboard/layoutsynthnet.v
