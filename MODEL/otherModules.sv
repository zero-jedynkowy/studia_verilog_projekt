module mod1(i_argA, o_result, o_status);
    parameter m = 4;
    parameter n = 2;
    input logic signed [m - 1:0] i_argA;
    output logic [m - 1:0] o_result;
    output logic [1:0] o_status;
    always_comb 
    begin
        
    end
endmodule

module mod2(i_argA, o_result, o_status);
    parameter m = 4;
    parameter n = 2;
    input logic signed [m - 1:0] i_argA;
    output logic [m - 1:0] o_result;
    output logic [1:0] o_status;
    always_comb 
    begin
        
    end
endmodule

module mod3(i_argA, o_result, o_status);
    parameter m = 4;
    parameter n = 2;
    input logic signed [m - 1:0] i_argA;
    output logic [m - 1:0] o_result;
    output logic [1:0] o_status;
    always_comb 
    begin
        
    end
endmodule

// KONWERTER ZM NA U2
module mod4(i_argA, o_result, o_status);
    parameter m = 4;
    parameter n = 2;

    input logic signed [m - 1:0] i_argA;

    output logic [m - 1:0] o_result;
    output logic [1:0] o_status;

    logic [m - 1:0] temp;

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
            temp = ~temp;
            temp = temp + 1'b1;
            o_result = temp;
        end
    end
endmodule