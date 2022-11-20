`include "otherModules.sv"

module exe_unit_w1(i_oper, i_argA, i_argB, i_clk, i_rsn, o_result, o_status);
    parameter m = 4;
    parameter n = 2;

    input logic [n - 1:0] i_oper;
    input logic signed [m - 1:0] i_argA;
    input logic signed [m - 1:0] i_argB;
    input logic i_clk;
    input logic i_rsn;

    output logic [m - 1:0] o_result;
    output logic [1:0] o_status;

    logic [1:0] o_status1;
    logic [1:0] o_status2;
    logic [1:0] o_status3;
    logic [1:0] o_status4;
    logic [m - 1:0] o_result1;
    logic [m - 1:0] o_result2;
    logic [m - 1:0] o_result3;
    logic [m - 1:0] o_result4;

    mod4 # (.m(m), .n(n)) m_mod4 (.i_argA(i_argA), .o_result(o_result4), .o_status(o_status4));

    always_ff @(posedge i_clk, negedge i_rsn)
    begin
        if(i_rsn == '0)
        begin
            o_status1 = '0;
        end
        else
        begin
            case(i_oper)
                1'b00: o_result = '1;
                2'b01: o_result = '1;
                3'b10: o_result = '1;
                4'b11:  
                begin
                    o_result = o_result4;
                    o_status = o_status4;
                end
                default: o_result = '0;
            endcase
        end
    end
endmodule