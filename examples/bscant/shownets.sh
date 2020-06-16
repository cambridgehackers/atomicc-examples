# source filename
set fp [open testnets.txt w]
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
