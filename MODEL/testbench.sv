`timescale 1ns/1ps
`include "exe_unit_w1.sv"

module testbench;
    parameter BITS = 4;
    parameter uwu = 2;
    logic [uwu - 1:0] oper;
    logic signed [BITS - 1:0] a, b;
    logic clk, rsn;
    logic [BITS - 1:0] result;
    logic [1:0] status;


    exe_unit_w1 # (.m(BITS), .n(uwu)) nazwa (.i_oper(oper), .i_argA(a), .i_argB(b), .i_clk(clk), .i_rsn(rsn), .o_status(status));

    initial 
    begin
        $dumpfile("signals.vcd");
        $dumpvars(0, testbench);
        a = '0;
        b = '0;
        oper = '0;
        #1
        a = 4'b1111;
        b = 4'b1101;
        #1
        $finish;
    end
endmodule