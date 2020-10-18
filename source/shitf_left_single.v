`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/16 20:51:53
// Design Name: 
// Module Name: shitf_left_single
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


module shitf_left_single(
input [31:0] A,
input [4:0] cnt,   ///Î»ÒÆÊý
output [31:0] B
    );
reg [31:0] tmp;
always @(cnt)
begin
    case(cnt)
       5'b00000:tmp<=  {A[31:0]};
       5'b00001:tmp<= {A[30:0],1'b0};
       5'b00010:tmp<= {A[29:0],2'b0};
       5'b00011:tmp<= {A[28:0],3'b0};
       5'b00100:tmp<= {A[27:0],4'b0};
       5'b00101:tmp<= {A[26:0],5'b0};
       5'b00110:tmp<= {A[25:0],6'b0};
       5'b00111:tmp<= {A[24:0],7'b0};
       5'b01000:tmp<= {A[23:0],8'b0};
       5'b01001:tmp<= {A[22:0],9'b0};
       5'b01010:tmp<= {A[21:0],10'b0};
       5'b01011:tmp<= {A[20:0],11'b0};
       5'b01100:tmp<= {A[19:0],12'b0};
       5'b01101:tmp<= {A[18:0],13'b0};
       5'b01110:tmp<= {A[17:0],14'b0};
       5'b01111:tmp<= {A[16:0],15'b0};
       5'b10000:tmp<= {A[15:0],16'b0};
       5'b10001:tmp<= {A[14:0],17'b0};
       5'b10010:tmp<= {A[13:0],18'b0};
       5'b10011:tmp<= {A[12:0],19'b0};
       5'b10100:tmp<= {A[11:0],20'b0};
       5'b10101:tmp<= {A[10:0],21'b0};
       5'b10110:tmp<= {A[9:0],22'b0};
       5'b10111:tmp<= {A[8:0],23'b0};
       5'b11000:tmp<= {A[7:0],24'b0};
       5'b11001:tmp<= {A[6:0],25'b0};
       5'b11010:tmp<= {A[5:0],26'b0};
       5'b11011:tmp<= {A[4:0],27'b0};
       5'b11100:tmp<= {A[3:0],28'b0};
       5'b11101:tmp<= {A[2:0],29'b0};
       5'b11110:tmp<= {A[1:0],30'b0};
       5'b11111:tmp<= {A[0],31'b0};
    endcase
end
assign B=tmp;
endmodule
