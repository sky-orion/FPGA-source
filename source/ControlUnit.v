`timescale 1ns / 1ps


module ControlUnit(
    input [5:0] opcode,
    input [5:0] funct,
//    input zero,
//    input sign,
//    output reg PCWre,
//    output reg ALUSrcA,
    output reg ALUSrcB,
    output reg DBDataSrc,
    output reg RegWre,
//    output reg InsMemRW,
//    output reg mRD,
    output reg mWR,
    output reg RegDst,
//    output reg ExtSel,
//    output reg [1:0] PCSrc,
    output reg [2:0] ALUOp
    );
    
        parameter [5:0] sub = 6'b100010,
                     add = 6'b100000,
//                     jr = 6'b001000,
//                     sll = 6'b000000,
//                     srl = 6'b000010,
                     addi = 6'b001000,
//                     ori = 6'b001101,
//                     xori = 6'b001110,
                     lw = 6'b100011,
                     sw = 6'b101011,
//                     beq = 6'b000100,
//                     bne = 6'b000101,
//                     slt = 6'b101010,
//                     slti = 6'b001010,
//                     j = 6'b000010,
//                     jal = 6'b000011,
//                     halt = 6'b111111,
//                     addiu = 6'b001001,
//                     And = 6'b100100,
//                     andi = 6'b001100,
//                     Or =  6'b100101,
//                     jalr = 6'b001001,
//                     lui = 6'b001111,
//                     sllv = 6'b000100,
//                     srlv = 6'b000110,
                     mul = 6'b011100;//i–Õ
    always @(opcode or funct) begin
        case(opcode)
            6'b000000: //R–Õ
            
            begin   
            case(funct)
            add:begin
//                PCWre <= 1; // add
                { ALUSrcB, DBDataSrc, RegWre, mWR, RegDst} <= 5'b0_0_10_1;
                ALUOp[2:0] <= 3'b000;
            end
//             sllv :begin
//                PCWre <= 1; // add
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre, mRD, mWR, RegDst, ExtSel} <= 10'b00_00_100_1_0;
//                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_010;
//            end
//            srlv :begin
//                PCWre <= 1; // add
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre, mRD, mWR, RegDst, ExtSel} <= 10'b00_00_100_1_0;
//                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_011;
//            end
//            sll:begin    // sll
//                PCWre <= 1;
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre, mRD, mWR, RegDst, ExtSel} <= 10'b10_00_100_1_0;
//                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_010;
//            end
//            srl:begin    // srl
//                PCWre <= 1;
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre, mRD, mWR, RegDst, ExtSel} <= 10'b10_00_100_1_0;
//                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_011;
//            end            
            sub:begin
//                PCWre <= 1; // sub
                { ALUSrcB, DBDataSrc, RegWre, mWR, RegDst} <= 5'b0_0_10_1;
                ALUOp[2:0] <= 3'b001;
            end
//            And: begin    // and
//                PCWre <= 1;
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre, mRD, mWR, RegDst, ExtSel} <= 10'b00_00_100_1_0;
//                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_100;
//            end      
            
//            Or: begin    // or
//                PCWre <= 1;
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre,mRD, mWR, RegDst, ExtSel} <= 10'b00_00_100_1_0;
//                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_110;
//            end   
            
//            slt:begin
//                PCWre <= 1; // slt
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre, mRD, mWR, RegDst, ExtSel} <= 10'b00_00_100_1_0;
//                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_101;
//            end
            
//            jr: begin    // jr
//                PCWre <= 1;
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre, mRD, mWR, RegDst, ExtSel} <= 10'b00_00_0_00_0_0;
//                {PCSrc[1:0], ALUOp[2:0]} <= 5'b11_000;
//            end
            
//           jalr: begin    // jr
//                PCWre <= 1;
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre, mRD, mWR, RegDst, ExtSel} <= 10'b00_10_1_00_0_0;
//                {PCSrc[1:0], ALUOp[2:0]} <= 5'b11_000;
//            end
            endcase
            end
            
            addi: begin    // addi
//                PCWre <= 1;
                {ALUSrcB, DBDataSrc, RegWre, mWR, RegDst} <= 5'b1_0_10_0;
                 ALUOp[2:0] <= 3'b000;
            end
//            andi: begin    // andi
//                PCWre <= 1;
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre, mRD, mWR, RegDst, ExtSel} <= 10'b01_00_100_0_0;
//                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_100;
//            end

//            ori: begin    // ori
//                PCWre <= 1;
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre, mRD, mWR, RegDst, ExtSel} <= 10'b01_00_100_0_0;
//                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_110;
//            end
//            lui: begin    // lui
//                PCWre <= 1;
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre,mRD, mWR, RegDst, ExtSel} <= 10'b00_11_100_0_0;
//                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_000;
//            end
//            slti: begin    // slti
//                PCWre <= 1;
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre, mRD, mWR, RegDst, ExtSel} <= 10'b01_00_100_0_1;
//                {PCSrc[1:0], ALUOp[2:0]} <= 5'b00_101;
//            end
            sw: begin    // sw
//                PCWre <= 1;
                { ALUSrcB, DBDataSrc, RegWre, mWR, RegDst} <= 5'b1_z_01_z;
                ALUOp[2:0] <= 3'b000;
            end
            lw: begin    // lw
//                PCWre <= 1;
                { ALUSrcB, DBDataSrc, RegWre,mWR, RegDst} <= 5'b1_1_10_0;
                ALUOp[2:0] <= 3'b000;
            end
//            beq: begin    // beq
//                PCWre <= 1;
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre, mRD, mWR, RegDst, ExtSel} <= 10'b00_00_000_0_1;
//                PCSrc[1:0] <= (zero==1) ? 2'b01 : 2'b00;
//                ALUOp[2:0] <= 3'b001;
//            end
//            bne: begin    // bne
//                PCWre <= 1;
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre, mRD, mWR, RegDst, ExtSel} <= 10'b00_00_000_0_1;
//                PCSrc[1:0] <= (zero==0) ? 2'b01 : 2'b00;
//                ALUOp[2:0] <= 3'b001;
//            end
//            j: begin    // j
//                PCWre <= 1;
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre, mRD, mWR, RegDst, ExtSel} <= 10'b00_00_0_00_0_0;
//                {PCSrc[1:0], ALUOp[2:0]} <= 5'b10_000;
//            end
//            jal: begin    // jal
//                PCWre <= 1;
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre, mRD, mWR, RegDst, ExtSel} <= 10'b00_10_1_00_0_0;
//                {PCSrc[1:0], ALUOp[2:0]} <= 5'b10_000;
//            end                        
//            halt: begin    // halt
//                PCWre <= 0;
//                {ALUSrcA, ALUSrcB, DBDataSrc[1:0], RegWre,  mRD, mWR, RegDst, ExtSel} <= 10'b00_00_0_00_0_0;
//                {PCSrc[1:0], ALUOp[2:0]} <= 5'b11_000;
//            end
            mul:begin
//                PCWre <= 1; // add
                {ALUSrcB, DBDataSrc, RegWre, mWR, RegDst} <= 5'b0_0_10_1;
                ALUOp[2:0] <= 3'b111;
            end            
        endcase
    end
    
endmodule

