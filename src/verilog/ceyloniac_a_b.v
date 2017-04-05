`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:37:24 11/23/2015 
// Design Name: 
// Module Name:    ceyloniac_a_b 
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
module ceyloniac_a_b
#(parameter RAM_DATA_WIDTH=32)
(
clk,
reset,
read_data1,
read_data2,
read_data_a,
read_data_b
);

input clk;
input reset;
input [RAM_DATA_WIDTH-1:0]read_data1;
input [RAM_DATA_WIDTH-1:0]read_data2;
output reg[RAM_DATA_WIDTH-1:0]read_data_a;
output reg [RAM_DATA_WIDTH-1:0]read_data_b;

always@(posedge clk)begin
  if(!reset)begin
    read_data_a<=read_data1;
	 read_data_b<=read_data2;
	 end
	 else begin
	 read_data_a<=0;
	 read_data_b<=0;
	 end
end

endmodule
