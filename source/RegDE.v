`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/08 20:26:10
// Design Name: 
// Module Name: RegDE
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


module RegDE(
input clk,
input clear,
input RegwriteD,
input MemtoregD,
input MemwriteD,
input [2:0]ALUcontrolD,
input ALUsrcD,
input RegdstD,
input [4:0]rsD,rtD,rdD,
input [31:0]signD,ReadData1,ReadData2,
output reg RegwriteE,
output reg MemtoregE,
output reg MemwriteE,
output reg [2:0]ALUcontrolE,
output reg ALUsrcE,
output reg RegdstE,
output reg [4:0]rsE,rtE,rdE,
output reg [31:0]signE,ReadData1E,ReadData2E
    );
 always @(posedge clk) 
 begin
    if(clear==1)
    begin
//           RegwriteE<=RegwriteE;
//           MemtoregE<=MemtoregE;
//           MemwriteE<=MemwriteE;
//           ALUcontrolE<=ALUcontrolE;
//           ALUsrcE<=ALUsrcE;
//           RegdstE<=RegdstE;
//           rsE<=rsE;
//           rtE<=rtE;
//           rdE<=rdE;
//           signE<=signE;
//           ReadData1E<=ReadData1E;
//           ReadData2E<=ReadData2E;
           RegwriteE<=0;
           MemtoregE<=0;
           MemwriteE<=0;
           ALUcontrolE<=0;
           ALUsrcE<=0;
           RegdstE<=0;
           rsE<=0;
           rtE<=0;
           rdE<=0;
           signE<=0;
           ReadData1E<=0;
           ReadData2E<=0;
    end
    else
    begin
           RegwriteE<=RegwriteD;
           MemtoregE<=MemtoregD;
           MemwriteE<=MemwriteD;
           ALUcontrolE<=ALUcontrolD;
           ALUsrcE<=ALUsrcD;
           RegdstE<=RegdstD;
           rsE<=rsD;
           rtE<=rtD;
           rdE<=rdD;
           signE<=signD;
           ReadData1E<=ReadData1;
           ReadData2E<=ReadData2;
     end
end
endmodule
