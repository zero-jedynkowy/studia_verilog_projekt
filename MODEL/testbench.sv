`timescale 1ns/1ps

module testbench;
    parameter BITS_1 = 4;
    parameter BITS_2 = 2;
    logic [BITS_2 - 1:0] oper;
    logic signed [BITS_1 - 1:0] a, b;
    logic clk, rsn;
    logic [BITS_1 - 1:0] result;
    logic [3:0] status;
    logic [BITS_1 - 1:0] result_rtl;
    logic [3:0] status_rtl;
    exe_unit_w1 # (.m(BITS_1), .n(BITS_2)) m_exe_unit_w1 (.i_oper(oper), .i_argA(a), .i_argB(b), .i_clk(clk), .i_rsn(rsn), .o_status(status), .o_result(result));
    exe_unit_w1_rtl m_exe_unit_w1_rtl (.i_oper(oper), .i_argA(a), .i_argB(b), .i_clk(clk), .i_rsn(rsn), .o_status(status_rtl), .o_result(result_rtl));

    initial 
    begin
        $dumpfile("signals.vcd");
        $dumpvars(0, testbench);
        rsn = '1;
        clk = '1;
        a = 4'b1111;
        b = 4'b0000;
        oper = 2'b00;
        #1
        clk = '1;
        #1
        clk = '0;
        #1
        clk = '1;
        #1
        a = 4'b1111;
        b = 4'b0111;
        clk = '0;
        #1
        a = 4'b0111;
        b = 4'b1111;
        clk = '1;
        #1
        clk = '0;
        #1
        clk = '1;
        #1
        oper = 2'b11;
        #1
        a = 4'b1011;
        clk = '0;
        #1
        clk = '1;
        #1
        clk = '0;
        #1
        clk = '1;
        a = 4'b1000;
        #1
        clk = '0;
        #1
        clk = '1;
        #1
        $finish;
    end
endmodule