// ODEJMOWANIE LICZBA: A - B
module mod1(i_argA, i_argB, o_result, o_status);
    parameter m = 4;
    parameter n = 2;

    input logic [m - 1:0] i_argA;
    input logic [m - 1:0] i_argB;
    output logic [m - 1:0] o_result;
    output logic [3:0] o_status;

    logic checkFlag;
    logic [m - 1:0] maxValue;
    logic [m - 1:0] temp;
    logic [m - 1:0] temp1;
    logic [m - 1:0] temp2;
    logic [3:0] status;
    
    integer x;
    always_comb 
    begin
        temp = '0;
        x = 0;
        checkFlag = '0;
        maxValue = '1;
        maxValue[m - 1] = 1'b0;
        if(i_argA[m - 1] == 1'b0 && i_argB[m - 1] == 1'b0)
        begin
            if(i_argA >= i_argB)
            begin
                temp = i_argA - i_argB;
            end
            else
            begin
                temp = i_argB - i_argA;
                temp[m - 1] = 1'b1;
            end
        end
        if(i_argA[m - 1] == 1'b1 && i_argB[m - 1] == 1'b1)
        begin
            temp1 = i_argA;
            temp2 = i_argB;
            temp1[m - 1] = 1'b0;
            temp2[m - 1] = 1'b0;
            if(temp1 > temp2)
            begin
                temp = temp1 - temp2;
                temp[m - 1] = 1'b01;
            end
            else
            begin
                temp = temp2 - temp1;
                temp[m - 1] = 1'b0;
            end
        end
        if(i_argA[m - 1] == 1'b1 && i_argB[m - 1] == 1'b0)
        begin
            temp1 = i_argA;
            temp2 = i_argB;
            temp1[m - 1] = 1'b0;
            temp2[m - 1] = 1'b0;
            temp = temp1 + temp2;
            if(temp > maxValue)
            begin
                checkFlag = '1;
            end
            temp[m - 1] = 1'b1;
        end
        if(i_argA[m - 1] == 1'b0 && i_argB[m - 1] == 1'b1)
        begin
            temp1 = i_argA;
            temp2 = i_argB;
            temp1[m - 1] = 1'b0;
            temp2[m - 1] = 1'b0;
            temp = temp1 + temp2;
            if(temp > maxValue)
            begin
                checkFlag = '1;
            end
            temp[m - 1] = 1'b0;
        end
        if(checkFlag == 1'b1)
        begin
            o_result = 'x;
            status = status + 4'b0001;
        end
        else
        begin
            o_result = temp;
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

// POROWNANIE LICZB A < B
module mod2(i_argA, i_argB, o_result, o_status);
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
        if(i_argB[m - 1] == 1'b1 && i_argA[m - 1] == 1'b0)
        begin
            temp = '0;
            o_result = temp;
        end
        if(i_argB[m - 1] == 1'b0 && i_argA[m - 1] == 1'b1)
        begin
            temp = '0 + 1'b1;
            o_result = temp;
        end
        if(i_argA[m - 1] == 1'b1 && i_argB[m - 1] == 1'b1)
        begin
            logic [m - 1:0] temp1;
            logic [m - 1:0] temp2;
            temp1 = i_argA;
            temp2 = i_argB;
            temp1[m - 1] = '0;
            temp2[m - 1] = '0;
            if(temp1 > temp2)
            begin
                temp = '0 + 1'b1;
                o_result = temp;
            end
            else
            begin
                temp = '0;
                o_result = temp;
            end
        end
        if(i_argA[m - 1] == 1'b0 && i_argB[m - 1] == 1'b0)
        begin
            if(i_argA < i_argB)
            begin
                temp = '0 + 1'b1;
                o_result = temp;
            end
            else
            begin
                temp = '0;
                o_result = temp;
            end
        end
        status = '0;
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
            o_result = 'x;
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