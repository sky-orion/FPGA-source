`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 19:40:04
// Design Name: 
// Module Name: bk32
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


module bk32(
 input [15:0] A,
    input [15:0] B,
    input cin,
    output [15:0] sum,
    output cout
    );
    
    wire [15:0] g,p,G,P;
    assign g[0]=A[0]&B[0];
    assign p[0]=A[0]^B[0];
    assign G[0]=g[0];
    assign P[0]=p[0];
    
    assign g[1]=A[1]&B[1];
    assign p[1]=A[1]^B[1];
    assign G[1]=g[1]|(g[0]&p[1]);
    assign P[1]=p[1]&p[0];
    
    assign g[2]=A[2]&B[2];
    assign p[2]=A[2]^B[2];
    assign G[2]=g[2];
    assign P[2]=p[2];
    
    assign g[3]=A[3]&B[3];
    assign p[3]=A[3]^B[3];
    assign G[3]=g[3]|(g[2]&p[3]);
    assign P[3]=p[3]&p[2];
    
    
    assign g[4]=A[4]&B[4];
    assign p[4]=A[4]^B[4];
    assign G[4]=g[4];
    assign P[4]=p[4];
    
    assign g[5]=A[5]&B[5];
    assign p[5]=A[5]^B[5];
    assign G[5]=g[5]|(g[4]&p[5]);
    assign P[5]=p[5]&p[4];
    
    
    assign g[6]=A[6]&B[6];
    assign p[6]=A[6]^B[6];
    assign G[6]=g[6];
    assign P[6]=p[6];
    
    assign g[7]=A[7]&B[7];
    assign p[7]=A[7]^B[7];
    assign G[7]=g[7]|(g[6]&p[7]);
    assign P[7]=p[7]&p[6];
    
    
    assign g[8]=A[8]&B[8];
    assign p[8]=A[8]^B[8];
    assign G[8]=g[8];
    assign P[8]=p[8];
    
    assign g[9]=A[9]&B[9];
    assign p[9]=A[9]^B[9];
    assign G[9]=g[9]|(g[8]&p[9]);
    assign P[9]=p[9]&p[8];
    
    
    assign g[10]=A[10]&B[10];
    assign p[10]=A[10]^B[10];
    assign G[10]=g[10];
    assign P[10]=p[10];
    
    assign g[11]=A[11]&B[11];
    assign p[11]=A[11]^B[11];
    assign G[11]=g[11]|(g[10]&p[11]);
    assign P[11]=p[11]&p[10];
    
    
    assign g[12]=A[12]&B[12];
    assign p[12]=A[12]^B[12];
    assign G[12]=g[12];
    assign P[12]=p[12];
    
    assign g[13]=A[13]&B[13];
    assign p[13]=A[13]^B[13];
    assign G[13]=g[13]|(g[12]&p[13]);
    assign P[13]=p[13]&p[12];
    
    assign g[14]=A[14]&B[14];
    assign p[14]=A[14]^B[14];
    assign G[14]=g[14];
    assign P[14]=p[14];
    
    assign g[15]=A[15]&B[15];
    assign p[15]=A[15]^B[15];
    assign G[15]=g[15]|(g[14]&p[15]);
    assign P[15]=p[15]&p[14];

    
    wire [3:0]m,n;
    wire fp,fg;
    wire eg,ep;
    wire rg,rp;
    wire jg,jp;
    wire hg,hp;
    wire dg,dp;
    wire qg,qp;
    wire tg,tp;
    wire vg,vp;
    wire ug,up;
    wire yg,yp;
    wire sg,sp;
    wire lg,lp;
    wire xg,xp;
    wire mg,mp;
    wire ig,ip;
    assign ig=mp&hg|mg;
    assign ip=mp&hp;
    
    assign mg=vg&xp|xg;
    assign mp=xp&vp;
    
    assign xg=P[15]&G[11]|G[15];
    assign xp=P[15]&P[11];
    
    assign lg=P[14]&sg|G[14];
    assign lp=P[14]&sp;
    
    assign sg=P[13]&ug|G[13];
    assign sp=P[13]&up;
    
    assign yg=P[12]&ug|G[12];
    assign yp=P[12]&up;
    
    assign ug=vp&hg|vg;
    assign up=vp&hp;
    
    assign vg=P[11]&G[9]|G[11];
    assign vp=P[11]&P[9];
    
    assign tg=P[10]&qg|G[10];
    assign tp=P[10]&qp;
    
    assign qg=P[9]&hg|G[9];
    assign qp=P[9]&hp;
    
    assign dg=P[8]&hg|G[8];
    assign dp=P[8]&hp;
    
    assign hg= n[1]&m[0]|m[1];
    assign hp=n[0]&n[1];
    
    assign jg=P[6]&rg|G[6];
    assign jp=P[6]&rp;
    
    assign rg=P[5]&m[0]|G[5];
    assign rp=P[5]&n[0];
    
    assign eg=P[4]&m[0]|G[4];
    assign ep=P[4]&n[0];
    
    assign fg=G[2]|G[1]&P[2];
    assign fp=P[1]&P[2];
    
    assign m[0]=G[3]|(P[3]&G[1]);
    assign n[0]=P[1]&P[3];
    
    assign m[1]=G[7]|(P[7]&G[5]);
    assign n[1]=P[5]&P[7];
    
    assign m[3]=G[15]|(P[15]&G[13]);
    assign n[3]=P[13]&P[15];
    
    assign sum[0]=p[0]^cin;
    assign sum[1]=p[1]^G[0];
    assign sum[2]=p[2]^G[1];
    assign sum[3]=p[3]^fg;
    assign sum[4]=p[4]^m[0];
    assign sum[5]=p[5]^eg;
    assign sum[6]=p[6]^rg;
    assign sum[7]=p[7]^jg;
    assign sum[8]=p[8]^hg;
    assign sum[9]=p[9]^dg;
    assign sum[10]=p[10]^qg;
    assign sum[11]=p[11]^tg;
    assign sum[12]=p[12]^ug;
    assign sum[13]=p[13]^yg;
    assign sum[14]=p[14]^sg;
    assign sum[15]=p[15]^lg;
    assign cout=ig;
    

    endmodule
