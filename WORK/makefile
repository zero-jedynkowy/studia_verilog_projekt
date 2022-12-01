rm -R signals.vcd
rm testbench.vvp
yosys -s run.ys | tee synth.log
iverilog -o testbench.vvp -g2005-sv otherModules.sv exe_unit_w1.sv exe_unit_w1_rtl.sv testbench.sv 
vvp testbench.vvp
gtkwave signals.vcd
