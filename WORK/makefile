rm -R ../RTL/signals.vcd
rm -R ../MODEL/testbench.vvp
yosys -s run.ys | tee ../RTL/synth.log
iverilog -o ../RTL/testbench.vvp -g2005-sv ../MODEL/otherModules.sv ../MODEL/exe_unit_w1.sv ../RTL/exe_unit_w1_rtl.sv ../MODEL/testbench.sv 
vvp ../RTL/testbench.vvp
gtkwave  ../RTL/signals.vcd