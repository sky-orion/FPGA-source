`timescale 1ns / 1ps



module onboard_CPU(
    input basys3_clock,
    input reset_sw
//    , output [7:0] ALU_result
    );
   wire [31:0] ALU_result;    

//  wire [31:0] currentIAddr, nextIAddr;
//  wire [4:0] rs, rt;
//  wire [31:0] ReadData1;
  wire [31:0] ReadData;
 wire [12:0]count;
  wire signal,locked,WR;  
    
    CPU top_CPU(
        .clk(signal),   
        .Reset(reset_sw&locked),
//        .Reset(locked),
//        .currentIAddr(currentIAddr), .nextIAddr(nextIAddr),
//        .rs(rs), .rt(rt),
//        .ReadData1(ReadData1),
         .WritedataM(ReadData),
        .ALUoutE(ALU_result[31:0]),
       . MemwriteM(WR)
       
//         .DataBus(DataBus)
    );
  counter counter(.clock(signal),.reset(reset_sw&locked),.count(count)); 
 clk_wiz_0 clk0(.clk_out1(signal),.clk_in1(basys3_clock),.resetn(1),.locked(locked));    
ila_0 debug (
	.clk(signal), // input wire clk


	.probe0(ReadData), // input wire [31:0]  probe0  
	.probe1(WR), // input wire [0:0]  probe2
	.probe2(count), // input wire [12:0]  probe2
	.probe3(ALU_result) // input wire [7:0]  probe1
);
   
endmodule
