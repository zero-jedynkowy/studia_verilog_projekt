// ODEJMOWANIE LICZBA: A - B
module mod1(i_argA, i_argB, o_result, o_status);
    parameter m = 4;
    parameter n = 2;
    input logic [m - 1:0] i_argA;
    input logic [m - 1:0] i_argB;
    output logic [m - 1:0] o_result;
    output logic [1:0] o_status;
    always_comb 
    begin
        o_result = i_argA - i_argB;
    end
endmodule

// POROWNANIE LICZB A < B
module mod2(i_argA, i_argB, o_result, o_status);
    parameter m = 4;
    parameter n = 2;
    input logic [m - 1:0] i_argA;
    input logic [m - 1:0] i_argB;
    output logic [m - 1:0] o_result;
    output logic [1:0] o_status;
    always_comb 
    begin
        o_result = ~i_argA;
    end
endmodule

// USTAWIENIE BITY W A POPRZEZ B
module mod3(i_argA, i_argB, o_result, o_status);
    parameter m = 4;
    parameter n = 2;
    input logic [m - 1:0] i_argA;
    input logic [m - 1:0] i_argB;
    output logic [m - 1:0] o_result;
    output logic [3:0] o_status;
    logic [m - 1:0] temp;
    logic [3:0] status;
    integer x;
    always_comb 
    begin
        status = '0;
        temp = i_argA;
        if(i_argB[m - 1] != 1'b1 && m > i_argB)
        begin
            temp[i_argB] = '0;
            o_result = temp;
        end
        else
        begin
            status = status + 4'b0001;
        end
        if(temp[m - 1] == '1)
        begin
            status = status + 4'b0010;
        end
        for(int i = 0; i < m; i++)
        begin
            if(temp[i] == 1)
            begin
                x = x + 1;
            end
        end
        if(x % 2 == 0)
        begin
            status = status + 4'b0100;
        end
        if(temp == '1)
        begin
            status = status + 4'b1000;
        end
        o_status = status;
    end
endmodule

// KONWERTER ZM NA U2
module mod4(i_argA, o_result, o_status);
    parameter m = 4;
    parameter n = 2;
    input logic [m - 1:0] i_argA;
    output logic [m - 1:0] o_result;
    output logic [3:0] o_status;
    logic [m - 1:0] temp;
    logic [3:0] status;
    integer x;
    always_comb 
    begin
        temp = i_argA;
        if(i_argA[m - 1] == 1'b0)
        begin
            o_result = temp;
        end
        else
        begin
            temp[m - 1] = 1'b0;
            if(temp != '0)
            begin
                temp = ~temp;
                temp = temp + 1'b1;
                o_result = temp;
            end
        end
        status = 4'b0000;
        if(temp == '0)
        begin
            status = status + 4'b0001;
        end
        if(temp[m - 1] == '1)
        begin
            status = status + 4'b0010;
        end
        for(int i = 0; i < m; i++)
        begin
            if(temp[i] == 1)
            begin
                x = x + 1;
            end
        end
        if(x % 2 == 0)
        begin
            status = status + 4'b0100;
        end
        if(temp == '1)
        begin
            status = status + 4'b1000;
        end
        o_status = status;
    end
endmodule