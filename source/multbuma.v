`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/18 13:16:11
// Design Name: 
// Module Name: multbuma
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


module multsign(
input  signed [31:0] x,
input  signed [31:0] y,
output  signed [31:0] ans
   );

   wire signed [63:0]tmp3;
   reg signed [31:0] ans1;
   reg [31:0]tmp1;
   reg [31:0]tmp2;
   wire[31:0] mx;
   wire[31:0] my;
   wire[31:0] mtmp3;
   minus minusx(.a(x),.s(mx));
   minus minusxy(.a(y),.s(my));
   minus minustmp(.a(tmp3),.s(mtmp3));
   DaddaMultiplier mult1(.x(tmp1), .y(tmp2), .ans(tmp3));  
 always@(mx or my)
 begin  
   case ({x[31],y[31]})
   2'b00:
   begin
        tmp1[31:0]=x[31:0];
        tmp2[31:0]=y[31:0];
   end
   2'b01:
   begin
        tmp1[31:0]=x[31:0];
        tmp2[31:0]=my;
   end
   2'b10:
   begin
        tmp1[31:0]=mx;
        tmp2[31:0]=y[31:0];
   end
   2'b11:
   begin
         tmp1[31:0]=mx;
         tmp2[31:0]=my;
   end
     endcase
 end
 
 always@(mtmp3)
 begin  
   case ({x[31],y[31]})
   2'b00:
   begin
        ans1[31:0]=tmp3[31:0];
   end
   2'b01:
   begin
         ans1[31:0]=mtmp3;
   end
   2'b10:
   begin
        ans1[31:0]=mtmp3;
   end
   2'b11:
   begin
         ans1[31:0]=tmp3[31:0];
   end
 endcase
  end
 assign ans =ans1;
endmodule
