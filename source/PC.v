`timescale 1ns / 1ps

module PC(
    input clk,
    input Reset,
    input PCWre,
    input [31:0] nextIAddr,
    output reg [31:0] currentIAddr
    );
    parameter initaladdr = 32'h00400000;
    parameter endaddr = 32'h00405000;//结束地址
    parameter endaddrto = 32'hFFFFFFF0;//结束后跳转
    initial currentIAddr <= initaladdr;
    
    always @(posedge clk or negedge Reset) begin
        if(Reset == 0) currentIAddr = initaladdr;//起始地址
        else 
        begin
            if(nextIAddr>=endaddr) currentIAddr<=endaddrto ;//设置PC最大地址防止一直运行出现bug
            
            if(PCWre == 1&&nextIAddr<endaddr) currentIAddr <= nextIAddr;
            if(PCWre == 0&&nextIAddr<endaddr)currentIAddr <= currentIAddr;
        end
    end
endmodule
