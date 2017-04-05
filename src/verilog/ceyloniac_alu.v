`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:33:30 11/25/2015 
// Design Name: 
// Module Name:    ceyloniac_alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
 module ceyloniac_alu
#(parameter ALU_DATA_WIDTH = 32,ALU_OP_WIDTH=4)
(
alu_in_a,
alu_in_b,
alu_sel,
alu_status,
alu_out
 );
 //shift_scale,status bit
input [ALU_DATA_WIDTH-1:0]alu_in_a;
input [ALU_DATA_WIDTH-1:0]alu_in_b;
input [ALU_OP_WIDTH-1:0]alu_sel;
output reg alu_status;
output  reg[ALU_DATA_WIDTH-1:0]alu_out;

always@(*)begin

case(alu_sel)

 4'b0000: begin alu_out=alu_in_a+alu_in_b;
					alu_status=0;
			end
 4'b0001: alu_out=alu_in_a-alu_in_b;
 4'b0010: alu_out=alu_in_a*alu_in_b;
 4'b0011: alu_out=alu_in_a+1;
 4'b0100: alu_out=alu_in_a-1;
 4'b0101: alu_out=alu_in_a;
 4'b0110: alu_out=alu_in_a << alu_in_b;
 4'b0111: alu_out=alu_in_a >> alu_in_b;
 
 4'b1000: alu_out=alu_in_a & alu_in_b;
 4'b1001: alu_out=alu_in_a | alu_in_b;
 4'b1010: alu_out=alu_in_a ^ alu_in_b;
 4'b1011: alu_out=~alu_in_a;
 4'b1100: alu_out= !alu_in_a;
 4'b1101: alu_out=!alu_in_a;
 4'b1110: begin        
								
							//	alu_out=alu_in_a[alu_in_b[10:6]-1:alu_in_b[10:6]-alu_in_b[15:11]];
							/*	integer n1=alu_in_b[15:11]; 
								integer n2=alu_in_b[10:6] ;
								integer i=0;
								for(i=0;i<n2;i=i+1)begin
								 alu_out[i]=alu_in_a[i+n1-1];
								end
								for(i=n2;i<ALU_DATA_WIDTH;i=i+1)begin
								 alu_out[i]=0;
								end
								*/
								
			   end
 4'b1111: alu_out=alu_in_a;
 
 default:alu_out=0;
 
endcase
end
endmodule

