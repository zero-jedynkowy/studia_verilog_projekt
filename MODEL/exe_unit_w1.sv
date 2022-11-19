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
        // POROWNANIE LICZB
        if(i_oper == 2'b01)
        begin
            if(i_argA[m - 1] == 1'b0 && i_argB[m - 1] == 1'b0)
            begin
                if(i_argA >= i_argB)
                begin
                    o_result = '0;
                end
                if(i_argA < i_argB)
                begin
                    logic [m - 1:0] temp1;
                    temp1 = '1;
                    temp1[m - 1] = '0;
                    o_result = temp1;
                end
            end
            if(i_argB[m - 1] == 1'b0 && i_argA[m - 1] == 1'b1)
            begin
                logic [m - 1:0] temp1;
                temp1 = '1;
                temp1[m - 1] = '0;
                o_result = temp1;
            end
            if(i_argB[m - 1] == 1'b1 && i_argA[m - 1] == 1'b0)
            begin
                o_result = '0;
            end
            if(i_argB[m - 1] == 1'b1 && i_argA[m - 1] == 1'b1)
            begin
                logic [m - 1:0] temp1;
                logic [m - 1:0] temp2;
                temp1 = i_argA;
                temp2 = i_argB;
                temp1[m - 1] = '0;
                temp1[m - 1] = '0;
                if(temp1 > temp2)
                begin
                    temp1 = '1;
                    temp1[m - 1] = '0;
                    o_result = temp1;
                end
                if(temp1 <= temp2)
                begin
                    o_result = '0;
                end
            end
        end
        // KONWERTOWANIE ZNAK MODUL NA U2
        if(i_oper == 2'b11)
        begin
            if(i_argA[m - 1] == 1'b0)
            begin
                o_result = i_argA;
            end
            if(i_argA[m - 1] == 1'b1)
            begin
                logic [m - 1:0] temp1;
                logic [m - 1:0] temp2;
                temp1 = i_argA;
                temp1[m - 1] = 1'b0;
                temp1 = ~temp1;
                temp2 = temp1;
                temp2 = '0;
                temp2[0] = 1'b1;
                temp1 = temp1 + temp2;
                o_result = temp1;
            end
        end
    end
endmodule