`timescale 1ns/1ps
`include "exe_unit_w1.sv"

module testbench;
    parameter BITS_1 = 4;
    parameter BITS_2 = 2;
    logic [BITS_2 - 1:0] oper;
    logic signed [BITS_1 - 1:0] a, b;
    logic clk, rsn;
    logic [BITS_1 - 1:0] result;
    logic [1:0] status;

    exe_unit_w1 # (.m(BITS_1), .n(BITS_2)) m_exe_unit_w1 (.i_oper(oper), .i_argA(a), .i_argB(b), .i_clk(clk), .i_rsn(rsn), .o_status(status), .o_result(result));

    initial 
    begin
        $dumpfile("signals.vcd");
        $dumpvars(0, testbench);
        clk = '0;
        oper = 2'b10;
        rsn = '1;
        #1
        a = 4'b1001;
        b = 4'b0011;
        clk = '1;
        #1
        clk = '0;
        #1
        a = 4'b1001;
        b = 4'b0011;
        clk = '1;
        #1
        clk = '0;
        #1
        a = 4'b111;
        clk = '1;
        #1
        clk = '0;
        #1
        a = 4'b110;
        clk = '1;
        #1
        clk = '0;
        #1
        a = 4'b101;
        clk = '1;
        #1
        clk = '0;
        $finish;
    end
endmodule