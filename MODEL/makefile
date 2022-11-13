rm -R signals.vcd
rm testbench.vvp
iverilog -o testbench.vvp -g2005-sv testbench.sv
vvp testbench.vvp
gtkwave signals.vcd
