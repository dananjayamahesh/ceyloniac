`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:33:09 11/25/2015 
// Design Name: 
// Module Name:    ceyloniac_alu_output 
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
module ceyloniac_alu_output
#(parameter ALU_DATA_WIDTH=32)
(
clk,
reset,
alu_output_in,
alu_output_out
);
	 
	 input clk;
	 input reset;
	 input [ALU_DATA_WIDTH-1:0]alu_output_in;
	 output reg [ALU_DATA_WIDTH-1:0]alu_output_out;
 always@(posedge clk)begin
 
	 if(!reset)begin
	 alu_output_out<=alu_output_in;
	 end
	 else begin
	 alu_output_out<=0;
	 end
	 
 end


endmodule
