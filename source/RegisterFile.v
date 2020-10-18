`timescale 1ns / 1ps



module RegisterFile(
    input clk,
    input Reset,
    input WE,    // 寄存器堆写使能，1为有效
    input [4:0] ReadReg1,
    input [4:0] ReadReg2,
    input [4:0] WriteReg,
    input [31:0] WriteData,
    output [31:0] ReadData1,
    output [31:0] ReadData2
    );
    
    reg [31:0] file [1:31];
    integer i;
    
    assign ReadData1 = (ReadReg1 == 0) ? 0 : file[ReadReg1];
    assign ReadData2 = (ReadReg2 == 0) ? 0 : file[ReadReg2];//零号寄存器位0
//    always @(negedge clk or negedge Reset) begin
    always @(negedge clk or negedge Reset) begin
        if(Reset == 0) begin
            for(i = 1; i <= 31; i=i+1) begin
                file[i] <= 0;
            end
        end
        else if(WE == 1 && WriteReg != 0)
            file[WriteReg] <= WriteData;
    end
    
endmodule
