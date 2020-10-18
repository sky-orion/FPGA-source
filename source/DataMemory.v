`timescale 1ns / 1ps



module DataMemory(
    input clk,
    input [31:0] DAddr,
    input [31:0] DataIn,
//    input RD,    // 读控制，1有效
    input WR,    // 写控制，1有效
    output [31:0] DataOut    // 读出32位数据
    );

    dist_mem_gen_0  ram(.clk(clk),.we(WR),.a(DAddr[7:0]),.d(DataIn),.spo(DataOut));//按字存储
//    reg [31:0] tmp[0:15];
//    integer i=0; 
//        initial begin5
//     $readmemb("D:/datareverse.txt", tmp);//读数据文件
//    end
//    reg [31:0] RAM [0:15];    // 每个内存单元为32位，即一个字
//    assign DataOut[31:0]   = (RD==1) ? RAM[DAddr] : 32'b0;
//   always @(negedge clk) 
//    begin
//        if(WR == 1) begin
//            RAM[DAddr] <= DataIn[31:0];
//        end
//    end
//  always@(tmp[15])//读出数据进入ram
//    begin
//        for(i=0;i<16;i=i+1)
//        begin 
//         RAM[i]=tmp[i];                   
//        end  
//    end
    
    
//    assign DataOut[31:0]   = (RD==1) ? RAM[DAddr] : 32'b0

//    assign DataOut[7:0]   = (RD==1) ? RAM[DAddr+3] : 8'b0;
//    assign DataOut[15:8]  = (RD==1) ? RAM[DAddr+2] : 8'b0;
//    assign DataOut[23:16] = (RD==1) ? RAM[DAddr+1] : 8'b0;
//    assign DataOut[31:24] = (RD==1) ? RAM[DAddr+0] : 8'b0;
    
//always@(tmp[0])//读出数据进入ram
//    begin
//        for(i=0;i<16;i=i+1)
//        begin 
//         RAM[4*i+3]=tmp[i][7:0];
//         RAM[4*i+2]=tmp[i][15:8];
//         RAM[4*i+1]=tmp[i][23:16];   
//         RAM[4*i]=tmp[i][31:24];                      
//        end  
//    end
    
//   always @(negedge clk) begin
//        if(WR == 1) begin
//            RAM[DAddr+0] <= DataIn[31:24];
//            RAM[DAddr+1] <= DataIn[23:16];
//            RAM[DAddr+2] <= DataIn[15:8];
//            RAM[DAddr+3] <= DataIn[7:0];
//        end
//    end
endmodule
