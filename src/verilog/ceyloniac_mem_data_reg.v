`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:12:43 11/23/2015 
// Design Name: 
// Module Name:    ceyloniac_mem_data_reg 
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
module ceyloniac_mem_data_reg
#(parameter RAM_DATA_WIDTH=32) 
(
clk,
reset,
mem_read_data,
mdr_data
);

input clk;
input reset;
input [RAM_DATA_WIDTH-1:0]mem_read_data;
output reg[RAM_DATA_WIDTH-1:0]mdr_data;

always@(posedge clk)begin
  if(!reset)begin
    mdr_data<=mem_read_data;
  end
  else begin
     mdr_data<=0;
  end
end

endmodule
