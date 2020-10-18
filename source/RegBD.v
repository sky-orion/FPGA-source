`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 22:59:20
// Design Name: 
// Module Name: RegBD
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RegBD(
input clk,enB,
input RegwriteB,MemtoregB,MemwriteB,
input [2:0]ALUcontrolB,
input ALUsrcB,RegdstB,
input [4:0]rsB,rtB,rdB,
input [15:0] immediateB,
output reg RegwriteD,MemtoregD,MemwriteD,
output reg [2:0]ALUcontrolD,
output reg ALUsrcD,RegdstD,
output reg [4:0]rsD,rtD,rdD,
output reg [15:0] immediateD
    );
always@(posedge clk)
begin
        if(enB==1)
        begin
            RegwriteD<=RegwriteB;
            MemtoregD<=MemtoregB;
            MemwriteD<=MemwriteB;
            ALUcontrolD<=ALUcontrolB;
            ALUsrcD<=ALUsrcB;
            RegdstD<=RegdstB;
            rsD<=rsB;
            rtD<=rtB;
            rdD<=rdB;
            immediateD<=immediateB;
        end
        else
        begin
            RegwriteD<=RegwriteD;
            MemtoregD<=MemtoregD;
            MemwriteD<=MemwriteD;
            ALUcontrolD<=ALUcontrolD;
            ALUsrcD<=ALUsrcD;
            RegdstD<=RegdstD;
            rsD<=rsD;
            rtD<=rtD;
            rdD<=rdD;
            immediateD<=immediateD;
        end
end
endmodule
