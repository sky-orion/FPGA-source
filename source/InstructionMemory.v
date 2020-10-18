`timescale 1ns / 1ps



module InstructionMemory(
    input [31:0] IAddr,
    output  [31:0]  IDataOut
    ); 
   wire [31:0] dataouttmp;
   wire [31:0] addr;
   dist_mem_gen_1 im(.a(addr[12:0]),.spo(dataouttmp));

   parameter initaladdr = 32'h00400000;//指令起始地址，参考mars4_5的起始地址
   assign addr[31:0] = (IAddr-initaladdr)>>2;//修正下文件中的地址
   assign IDataOut = (addr[13])? {32'hx}:dataouttmp;//最大指令2*2**12=8192条
  
//   dist_mem_gen_1 im(.a(addr[12:0]),.spo(IDataOut));
//   reg [31:0] rom [0:2500];   
//   initial begin
//   $readmemb("D:/1", rom);//读指令
//   end
//   assign IDataOut[31:24] = rom[addr][31:24];
//   assign IDataOut[23:16] = rom[addr][23:16];
//   assign IDataOut[15:8]  = rom[addr][15:8]; 
//   assign IDataOut[7:0]   = rom[addr][7:0];
    
    
endmodule
