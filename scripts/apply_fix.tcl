if {[catch {read_lef $::env(MERGED_LEF_UNPADDED)} errmsg]} {
    puts stderr $errmsg
    exit 1
}

foreach lib $::env(LIB_CTS) {
    read_liberty $lib
}
puts "ECO: Successfully read liberty!"

if {[catch {read_def $::env(CURRENT_DEF)} errmsg]} {
    puts stderr $errmsg
    exit 1
}

read_verilog $::env(CURRENT_NETLIST)
puts "ECO: Successfully read Verilog!"

read_sdc -echo $::env(CURRENT_SDC)
puts "ECO: Successfully read SDC!"

puts "ECO: Sourcing eco.tcl!"
source $::env(SCRIPTS_DIR)/tcl_commands/eco.tcl
