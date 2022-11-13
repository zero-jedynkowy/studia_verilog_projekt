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
    logic [m - 1:0] temp;
    always_comb 
    begin
        // konwersja ZM na U2
        if(i_oper == 2'b00)
        begin
            if(i_argA[m - 1] == 1'b0 && i_argB[m - 1] == 1'b0)
            begin
                temp = i_argA - i_argB;
                if(i_argA < i_argB)
                begin
                    temp[m - 1] = 1;
                end
                o_result = temp;
            end
        end
        if(i_oper == 2'b11)
        begin
            if(i_argA[m - 1] == 1'b0)
            begin
                o_result = i_argA;
            end
            if(i_argA[m - 1] == 1'b1)
            begin
                temp = i_argA;
                temp[m - 1] = 1'b0;
                temp = ~temp;
                temp = temp + 1'b1;
                o_result = temp;
            end
        end
    end
endmodule