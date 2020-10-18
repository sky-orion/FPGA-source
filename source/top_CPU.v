`timescale 1ns / 1ps

module CPU(
    input clk,
    input Reset,
    output [31:0] currentIAddr, nextIAddr,
    output [4:0] rs, rt,
    output [31:0] ReadData1, ReadData2,
    output [31:0] ALUoutE, DataBus,WritedataM,
    output MemwriteM
    );
        //流水线控制信号
  wire stallF,stallD,flushE;
  reg lwstall;
  reg lwstall1,lwstall2;
  wire RegwriteE,MemtoregE,MemwriteE,RegdstE;wire[2:0]ALUcontrolE;wire ALUsrcE;wire[4:0]WriteregE,rsE,rtE,rdE;
  wire [31:0]signE,WritedataE,ReadData1E,ReadData2E;
//  ALUoutE;
  wire RegwriteM,MemtoregM,MemwriteM;wire[31:0]ALUoutM,WritedataM,ReaddataM;wire[4:0]WriteregM;
  wire RegwriteW,MemtoregW;wire[31:0]ReaddataW,ALUoutW,ResultW;wire[4:0]WriteregW;
  wire RegwriteD,MemtoregD,MemwriteD;
  wire [2:0]ALUcontrolD;
  wire ALUsrcD,RegdstD;
  wire [4:0]rsD,rtD,rdD;
  wire [15:0] immediateD;
  wire [31:0]extendedD;
  reg [1:0]forwardA,forwardB;
    wire [5:0] opcode;
    wire [4:0] rd;
    wire [15:0] immediate;
    
    wire [31:0] bincode;
    wire [31:0] extended;
    wire PCWre, RegWre,/* ALUSrcA,*/ ALUSrcB,/* mRD,*/ mWR,/* ExtSel,*/ RegDst;
//    wire [1:0] PCSrc;
    wire DBDataSrc;
    wire [2:0] ALUOp;
//    wire ALU_zero, ALU_sign;
    wire [4:0] WriteReg;
    wire [31:0] WriteData;
    wire [31:0] ALU_inA, ALU_inB;
    wire [31:0] DataOut;
    
    wire [5:0] funct;
    assign funct = bincode[5:0];
    assign opcode = bincode[31:26];
    assign rs = bincode[25:21];
    assign rt = bincode[20:16];
    assign rd = bincode[15:11];
    assign immediate = bincode[15:0];
    
//流水线中间变量
wire [31:0]instrF;
    

    /* 控制单元 */
    ControlUnit ControlUnit(
        .opcode(opcode),/* .zero(ALU_zero), .sign(ALU_sign),*/
       /* .PCWre(PCWre), .ALUSrcA(ALUSrcA),*/ .ALUSrcB(ALUSrcB), .DBDataSrc(DBDataSrc), .RegWre(RegWre),
         /*.InsMemRW(InsMemRW),*//* .mRD(mRD),*/ .mWR(mWR), .RegDst(RegDst), /*.ExtSel(ExtSel),*/
       /* .PCSrc(PCSrc),*/ .ALUOp(ALUOp),
        .funct(funct)
    );
    /* 5个关键底层模块 */
    PC PC(
        .clk(clk), .Reset(Reset), .PCWre(~stallF), .nextIAddr(nextIAddr),
        .currentIAddr(currentIAddr)
    );
    InstructionMemory InstructionMemory(
        .IAddr(currentIAddr),
        .IDataOut(instrF)
    );
    RegisterFile RegisterFile(
        .clk(clk), .Reset(Reset), .WE(RegwriteW),
        .ReadReg1(rsD), .ReadReg2(rtD), .WriteReg(WriteregW), .WriteData(ResultW),
        .ReadData1(ReadData1), .ReadData2(ReadData2)
    );
    ALU ALU(
        .ALUOp(ALUcontrolE), .A(ALU_inA), .B(ALU_inB),
        .result(ALUoutE)/*, .zero(ALU_zero), .sign(ALU_sign)*/
    );
    DataMemory DataMemory(
        .clk(clk), .DAddr(ALUoutM), .DataIn(WritedataM), /*.RD(mRD),*/ .WR(MemwriteM),
        .DataOut(ReaddataM)
    );
    
    /* 立即数扩展 */
    ImmediateExtend ImmediateExtend(
        .original(immediateD),/* .ExtSel(ExtSel),*/
        .extended(extendedD)
    );
    /* 数据选择器 */
//    Mux4_32bits Mux_nextIAddr(
//        .choice(PCSrc), .in0(currentIAddr + 4), .in1(currentIAddr + 4+ (extended<<2)), .in2({currentIAddr[31:28], bincode[25:0], 2'b00}), .in3(ReadData1),
//        .out(nextIAddr)
//    );
    assign nextIAddr=currentIAddr+3'b100;
    //回写寄存器选择
    Mux2_5bits Mux_WriteReg(
        .choice(RegdstE), .in0(rtE), .in1(rdE),
//        .in2(5'd31),.in3(5'bzzzzz),
        .out(WriteregE)
    );
//    Mux2_32bits Mux_WriteData(
//        .choice(DBDataSrc), .in0(ALU_result), .in1(DataOut), 
//        .out(WriteData)
//改为流水线
//结果32位选择
    Mux2_32bits Mux_WriteData(
        .choice(MemtoregW), .in0(ALUoutW), .in1(ReaddataW), 
        .out(ResultW)
    );
//    Mux2_32bits Mux_ALU_inA(
//        .choice(ALUSrcA), .in0(ReadData1), .in1({27'd0, immediate[10:6]}),
//        .out(ALU_inA)
//    );
//    assign ALU_inA=ReadData1;
//选择B操作数
    Mux2_32bits Mux_ALU_inB(
        .choice(ALUsrcE), .in0(WritedataE), .in1(signE),
        .out(ALU_inB)
    );
    //流水线寄存器 
     
    RegFD RegFD(.clk(clk),.instrF(instrF),.en(~stallD),.instrD(bincode));
    
    RegBD RegBD(.clk(clk),.enB(~lwstall),.RegwriteB(RegWre),.MemtoregB(DBDataSrc),.MemwriteB(mWR),
    .ALUcontrolB(ALUOp),.ALUsrcB(ALUSrcB),.RegdstB(RegDst),.rsB(rs),.rtB(rt),.rdB(rd),
    .immediateB(immediate),
    .RegwriteD(RegwriteD),.MemtoregD(MemtoregD),.MemwriteD(MemwriteD),
    .ALUcontrolD(ALUcontrolD),.ALUsrcD(ALUsrcD),.RegdstD(RegdstD),.rsD(rsD),.rtD(rtD),.rdD(rdD),
    .immediateD(immediateD));
    
    RegDE RegDE(.clk(clk),.clear(stallD),.RegwriteD(RegwriteD),.MemtoregD(MemtoregD),.MemwriteD(MemwriteD),
   .ALUcontrolD(ALUcontrolD),.ALUsrcD(ALUsrcD),.RegdstD(RegdstD),.rsD(rsD),.rtD(rtD),.rdD(rdD),.signD(extendedD),
   .ReadData1(ReadData1),.ReadData2(ReadData2),
   .RegwriteE(RegwriteE),.MemtoregE(MemtoregE),.MemwriteE(MemwriteE),
   .ALUcontrolE(ALUcontrolE),.ALUsrcE(ALUsrcE),.RegdstE(RegdstE),.rsE(rsE),.rtE(rtE),.rdE(rdE),
   .signE(signE),.ReadData1E(ReadData1E),.ReadData2E(ReadData2E)
    );
    
    RegEM RegEM(.clk(clk),.RegwriteE(RegwriteE),.MemtoregE(MemtoregE),.MemwriteE(MemwriteE),.ALUoutE(ALUoutE),
    .WritedataE(WritedataE),.WriteregE(WriteregE),
    .RegwriteM(RegwriteM),.MemtoregM(MemtoregM),.MemwriteM(MemwriteM),.ALUoutM(ALUoutM),
    .WritedataM(WritedataM),.WriteregM(WriteregM)
    );
    
    RegMW RegMW(.clk(clk),.RegwriteM(RegwriteM),.MemtoregM(MemtoregM),.ReaddataM(ReaddataM),.ALUoutM(ALUoutM),.WriteregM(WriteregM),
    .RegwriteW(RegwriteW),.MemtoregW(MemtoregW),.ReaddataW(ReaddataW),.ALUoutW(ALUoutW),.WriteregW(WriteregW)
    );

//  assign forwardA=((rsE!=0)&&(rsE==WriteregM)&&(RegwriteM==1))?10:(((rsE!=0)&&(rsE==WriteregW)&&(RegwriteW==1))?01:00);
//  assign forwardB=((rtE!=0)&&(rtE==WriteregM)&&(RegwriteM==1))?10:(((rtE!=0)&&(rtE==WriteregW)&&(RegwriteW==1))?01:00);
//assign lwstall=((rs==rtE)||(rt==rtE))&&MemtoregE;
initial begin
    lwstall<=1'b0;
    forwardA<=2'b00;
    forwardB<=2'b00;
    end
//always@(rs or rtE or MemtoregE)
//begin
//    lwstall1<=(rs==rtE)&&MemtoregE;
//end
//always@(rt or rtE or MemtoregE)
//begin
//    lwstall2<=(rt==rtE)&&MemtoregE;
//end
always@(rtD or rsD or rtE or MemtoregE)
begin
    lwstall<=((rsD==rtE)||(rtD==rtE))&&MemtoregE;
end
//always@(*)
//    begin lwstall<=lwstall1|lwstall2;
//    end
always@(rsE or WriteregM or WriteregW or RegwriteM or RegwriteW)
begin
    if((rsE!=0)&&(rsE==WriteregM)&&(RegwriteM==1))
        forwardA<=2'b10;
    else if((rsE!=0)&&(rsE==WriteregW)&&(RegwriteW==1))
        forwardA<=2'b01;
     else
        forwardA<=2'b00;
end
always@(rtE or WriteregM or WriteregW or RegwriteM or RegwriteW)
begin
    if((rtE!=0)&&(rtE==WriteregM)&&(RegwriteM==1))
        forwardB<=2'b10;
    else if((rtE!=0)&&(rtE==WriteregW)&&(RegwriteW==1))
        forwardB<=2'b01;
     else
        forwardB<=2'b00;
end
  assign stallF=lwstall;
  assign stallD=lwstall;
  assign flushE=lwstall;
  
  //重定向
  Mux3_32bits muxA(.choice(forwardA),.in0(ReadData1E),.in1(ResultW),.in2(ALUoutM),.out(ALU_inA));
  Mux3_32bits muxB(.choice(forwardB),.in0(ReadData2E),.in1(ResultW),.in2(ALUoutM),.out(WritedataE));
  assign DataBus = ResultW;
endmodule
