`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:13 11/22/2015 
// Design Name: 
// Module Name:    ceyloniac_sync_ram 
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
module ceyloniac_sync_ram
#(parameter RAM_DATA_WIDTH=32,RAM_ADDR_WIDTH=16)
(
    clk,
    ram_addr,
	ram_read_data,
	ram_write_data,
	ram_write_enable,
	ram_read_enable,
    ram_enable

);         
   parameter RAM_WIDTH = 1<<RAM_ADDR_WIDTH;
	 input clk;
	input	[RAM_DATA_WIDTH - 1:0]  ram_write_data;
	input	[RAM_ADDR_WIDTH - 1:0]	ram_addr;			
	input	 ram_write_enable;
	input ram_read_enable;
   input   ram_enable;
	output  reg [RAM_DATA_WIDTH - 1:0]	  ram_read_data;	
   reg     [RAM_DATA_WIDTH - 1:0]  ram[0 : RAM_WIDTH -1]; 

   
	always @(*)begin
	 if(ram_enable) begin
            if(ram_read_enable) begin
               ram_read_data  <= ram[ram_addr];
					end
		end
	end
	 always @(posedge clk) begin
        if(ram_enable) begin
            if(ram_write_enable) begin
               ram[ram_addr] <= ram_write_data;
           end
			 					
        end
	end	
	
	endmodule
