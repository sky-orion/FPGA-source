`timescale 1ns / 1ps


module ALU(
    input [2:0] ALUOp,
    input [31:0] A,//rs
    input [31:0] B,//rt
    output reg[31:0] result,
    output zero,    // 结果是否为0？是为1，否为0
    output sign    // 结果是否为负？是为1，否为0
    );
    wire[31:0] adderoutput,multoutput;
//    wire [31:0],shiftleftoutput,shiftrightoutput,sltoutput,andoutput,oroutput;
    wire [31:0]multemp;
    wire [31:0] addtemp;
    assign adderoutput={{16{addtemp[15]}},addtemp[15:0]};
//assign adderoutput=suboutput;
//    assign suboutput={{16{subtemp[15]}},subtemp[15:0]};
//    wire cin;
//    assign f=(~ALUOp[2])&(~ALUOp[1])&(ALUOp[0]);   //减法信号
//    wire [15:0]subB;
//    assign subB={16{f}}^(B[15:0]);
//    prefix_adder sub(.term0(A[15:0]),.term1(subB),.cin(f),.sum(addtemp));
//    adder32 adder(.A(A),.B(B),.S(adderoutput),.C31());//加法器
//    subtractor subtractor(.A(A),.B(B),.S(suboutput));//减法器
//    prefixadder32 adder(.A(A),.B(B),.Cin(0),.Sum(adderoutput));//加法器
//    prefixadder32 subtractor(.A(A),.B(~B),.Cin(1),.Sum(suboutput));//减法器
//    prefix_adder sub(.term0(A[15:0]),.term1(~B[15:0]),.cin(1),.sum(subtemp));
    bk32 adder(.A(A[15:0]),.B(B[15:0]),.cin(0),.sum(addtemp));//加法器
//    bk32 subtractor(.A(A[15:0]),.B(~(B[15:0])),.cin(1),.sum(subtemp),.cout(subtemp[16]));//减法器
    TopMultiplier multiple(.x_in(A[15:0]),.y_in(B[15:0]),.result_out(multemp));//乘法器
//    shitf_left_single shitf_left_single(.A(B),.cnt(A[4:0]),.B(shiftleftoutput));//左移
//    shift_right_single shift_right_single(.A(B),.cnt(A[4:0]),.B(shiftrightoutput));//右移
//    slt slt(.a(A),.b(B),.s(sltoutput));//比较数
//    And and1(.a(A),.b(B),.s(andoutput));//求与
//    Or1 or1(.a(A),.b(B),.s(oroutput));//求或
    assign zero = (result == 0) ? 1 : 0;
    assign sign = result[31];
    assign multoutput={{16{multemp[27]}},multemp[27:12]};
    
//    always @(ALUOp or A or B && adderoutput or suboutput or multoutput or shiftleftoutput or shiftrightoutput or sltoutput or andoutput or oroutput)
    always @(ALUOp or A or B or adderoutput or multoutput or addtemp )
     begin
//        case(ALUOp)
//            3'b000: result <= adderoutput;//r=a+b
//            3'b001 :result <= suboutput;//r=a-b
//            3'b010: result <= shiftleftoutput;//B << A
//            3'b011: result <= shiftrightoutput;//b>>a
//            3'b100: result <= A & B;
//            3'b101: result <= (A < B) ? 1 : 0; // 5: 比较无符号数
//            3'b110: result <=A|B;
//            3'b111: result <= multoutput;//r=a*b
//        endcase
//        case(ALUOp)
//            3'b000: result <= A+B;//r=a+b
//            3'b001 :result <= A-B;//r=a-b
//            3'b010: result <= B << A;
//            3'b011: result <= B>>A;
//            3'b100: result <= A & B;
//            3'b101: result <= (A < B) ? 1 : 0; // 5: 比较无符号数
//            3'b110: result <=A|B;
//            3'b111: result <= A*B;//r=a*b
//        endcase
        result[0] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[0])|//000
                                (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[0]);//111
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[0]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[0])|//010
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[0])|//011

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[0])|//101
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[0])|//100
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[0]);//110
                        
                        
        result[1] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[1])|//000
                                (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[1]);//111
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[1]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[1])|//010
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[1])|//011

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[1])|//101
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[1])|//100
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[1]);//110
       
         result[2] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[2])|//000
                                 (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[2]);//111
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[2]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[2])|//010
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[2])|//011

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[2])|//101
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[2])|//100
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[2]);//110    
                        
        result[3] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[3])|//000
                                (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[3]);//111
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[3]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[3])|//010
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[3])|//011

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[3])|//101
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[3])|//100
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[3]);//110    
                        
         result[4] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[4])|//000
                                 (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[4]);//111
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[4]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[4])|//010
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[4])|//011

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[4])|//101
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[4])|//100
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[4]);//110 
                        
         result[5] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[5])|//000
                                 (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[5]);//111
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[5]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[5])|//010
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[5])|//011

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[5])|//101
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[5])|//100
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[5]);//110 
                        
         result[6] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[6])|//000
                                 (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[6]);//111
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[6]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[6])|//010
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[6])|//011

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[6])|//101
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[6])|//100
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[6]);//110 
                        
          result[7] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[7])|//000
                                  (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[7]);//111
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[7]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[7])|//010
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[7])|//011

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[7])|//101
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[7])|//100
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[7]);//110 

            result[8] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[8])|//000
                                     (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[8]);//111
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[8]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[8])|//010
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[8])|//011

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[8])|//101
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[8])|//100
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[8]);//110 
                        
           result[9] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[9])|//000
                                   (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[9]);//111
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[9]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[9])|//010
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[9])|//011

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[9])|//101
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[9])|//100
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[9]);//110 
                        
            result[10] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[10])|//000
                                    (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[10]);//111
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[10]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[10])|//010
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[10])|//011

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[10])|//101
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[10])|//100
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[10]);//110 
                        
           result[11] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[11])|
                                   (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[11]);
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[11]);
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[11])|
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[11])|

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[11])|
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[11])|
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[11]); 
                        
           result[12] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[12])|//000
                                   (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[12]);//121
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[12]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[12])|//012
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[12])|//012

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[12])|//121
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[12])|//120
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[12]);//121 
                        
           result[13] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[13])|//000
                                   (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[13]);//131
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[13]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[13])|//013
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[13])|//013

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[13])|//131
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[13])|//130
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[13]);//131 
                                                
             result[14] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[14])|//000
                                 (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[14]);//141
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[14]);//001    
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[14])|//014
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[14])|//014

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[14])|//141
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[14])|//140
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[14]);//141 
                                                
            result[15] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[15])|//000
            (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[15]);//151
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[15]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[15])|//015
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[15])|//015

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[15])|//151
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[15])|//150
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[15]);//151 
                        
            result[16] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[16])|//000
                                    (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[16]);//161
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[16]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[16])|//016
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[16])|//016

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[16])|//161
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[16])|//160
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[16]);//161 
                        
            result[17] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[17])|//000
                                    (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[17]);//171
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[17]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[17])|//017
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[17])|//017

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[17])|//171
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[17])|//170
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[17]);//171 
                        
             result[18] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[18])|//000
                                     (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[18]);//181
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[18]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[18])|//018
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[18])|//018

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[18])|//181
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[18])|//180
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[18]);//181 
                        
             result[19] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[19])|//000
                                     (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[19]);//191
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[19]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[19])|//019
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[19])|//019

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[19])|//191
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[19])|//190
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[19]);//191 
 
            result[20] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[20])|//000
                                    (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[20]);//201
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[20]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[20])|//020
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[20])|//020

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[20])|//201
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[20])|//200
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[20]);//201 
                        
            result[21] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[21])|//000
                                    (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[21]);//211
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[21]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[21])|//021
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[21])|//021

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[21])|//211
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[21])|//210
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[21]);//211 
                        
          result[22] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[22])|//000
                                  (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[22]);//221
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[22]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[22])|//022
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[22])|//022

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[22])|//221
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[22])|//220
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[22]);//221 
                        
           result[23] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[23])|//000
                                   (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[23]);//231
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[23]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[23])|//023
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[23])|//023

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[23])|//231
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[23])|//230
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[23]);//231 
                        
            result[24] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[24])|//000
                                    (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[24]);//241
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[24]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[24])|//024
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[24])|//024

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[24])|//241
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[24])|//240
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[24]);//241 
                        
           result[25] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[25])|//000
                                   (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[25]);//251
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[25]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[25])|//025
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[25])|//025

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[25])|//251
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[25])|//250
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[25]);//251 
                        
            result[26] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[26])|//000
                                    (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[26]);//261
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[26]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[26])|//026
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[26])|//026

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[26])|//261
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[26])|//260
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[26]);//261 
                        
           result[27] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[27])|//000
                                   (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[27]);//271
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[27]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[27])|//027
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[27])|//027

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[27])|//271
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[27])|//270
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[27]);//271 
                        
           result[28] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[28])|//000
                                   (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[28]);//281
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[28]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[28])|//028
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[28])|//028

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[28])|//281
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[28])|//280
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[28]);//281 
                        
           result[29] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[29])|//000
                                   (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[29]);//291
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[29]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[29])|//029
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[29])|//029

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[29])|//291
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[29])|//290
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[29]);//291 
                        
           result[30] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[30])|//000
                                   (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[30]);//301
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[30]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[30])|//030
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[30])|//030

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[30])|//301
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[30])|//300
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[30]);//301 
                        
           result[31] <= (~ALUOp[0]&~ALUOp[1]&~ALUOp[2]&adderoutput[31])|//000
                                   (ALUOp[0]&ALUOp[1]&ALUOp[2]&multoutput[31]);//311
//                        (ALUOp[0]&~ALUOp[1]&~ALUOp[2]&suboutput[31]);//001
//                        (~ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftleftoutput[31])|//031
//                        (ALUOp[0]&ALUOp[1]&~ALUOp[2]&shiftrightoutput[31])|//031

//                        (ALUOp[0]&~ALUOp[1]&ALUOp[2]&sltoutput[31])|//311
//                        (~ALUOp[0]&~ALUOp[1]&ALUOp[2]&andoutput[31])|//310
//                        (~ALUOp[0]&ALUOp[1]&ALUOp[2]&oroutput[31]);//311 
 
    end
endmodule

