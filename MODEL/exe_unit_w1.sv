`include "otherModules.sv"

module exe_unit_w1(i_oper, i_argA, i_argB, i_clk, i_rsn, o_result, o_status);
    parameter m = 4;
    parameter n = 2;

    input logic [n - 1:0] i_oper;
    input logic [m - 1:0] i_argA;
    input logic [m - 1:0] i_argB;
    input logic i_clk;
    input logic i_rsn;

    output logic [m - 1:0] o_result;
    output logic [3:0] o_status;

    logic [3:0] o_status1;
    logic [3:0] o_status2;
    logic [3:0] o_status3;
    logic [3:0] o_status4;
    logic [m - 1:0] o_result1;
    logic [m - 1:0] o_result2;
    logic [m - 1:0] o_result3;
    logic [m - 1:0] o_result4;

    mod1 # (.m(m), .n(n)) m_mod1 (.i_argA(i_argA), .i_argB(i_argB), .o_result(o_result1), .o_status(o_status1));
    mod2 # (.m(m), .n(n)) m_mod2 (.i_argA(i_argA), .i_argB(i_argB), .o_result(o_result2), .o_status(o_status2));
    mod3 # (.m(m), .n(n)) m_mod3 (.i_argA(i_argA), .i_argB(i_argB), .o_result(o_result3), .o_status(o_status3));
    mod4 # (.m(m), .n(n)) m_mod4 (.i_argA(i_argA), .o_result(o_result4), .o_status(o_status4));

    always_ff @(posedge i_clk, negedge i_rsn)
    begin
        if(i_rsn == '0)
        begin
            o_status <= '0;
        end
        else
        begin
            case(i_oper)
                2'b00:
                begin
                    o_result <= o_result1;
                    o_status <= o_status1;
                end
                2'b01:
                begin
                    o_result <= o_result2;
                    o_status <= o_status2;
                end
                2'b10:
                begin
                    o_result <= o_result3;
                    o_status <= o_status3;
                end
                2'b11:  
                begin
                    o_result <= o_result4;
                    o_status <= o_status4;
                end
                default: o_result <= '0;
            endcase
        end
    end
endmodule