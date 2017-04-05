`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:12 11/22/2015 
// Design Name: 
// Module Name:    ceyloniac_ram_controller 
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
module ceyloniac_ram_controller
#(parameter RAM_DATA_WIDTH=32,RAM_ADDR_WIDTH=16)
(
   clk,
	
	ram_external_control_enable,//to swicth between processor and external
	
	ram_enable,
	ram_write_enable,
	ram_read_enable,
   ram_addr,
	ram_write_data,	
	ram_read_data,
	
   external_ram_enable,
	external_ram_write_enable,
	external_ram_read_enable,
   external_ram_addr,
	external_ram_write_data,
	external_ram_read_data

    );
	 
	input clk;
	
	input ram_external_control_enable;
	
	input	[RAM_DATA_WIDTH - 1:0]  ram_write_data;
	input	[RAM_ADDR_WIDTH - 1:0]	ram_addr;			
	input	 ram_write_enable;
	input ram_read_enable;
   input   ram_enable;
	output  [RAM_DATA_WIDTH - 1:0]	  ram_read_data;	
	
	//input clk;
	input	[RAM_DATA_WIDTH - 1:0]  external_ram_write_data;
	input	[RAM_ADDR_WIDTH - 1:0]	external_ram_addr;			
	input	 external_ram_write_enable;
	input  external_ram_read_enable;
   input  external_ram_enable;
	output [RAM_DATA_WIDTH - 1:0]  external_ram_read_data;	
	
	wire	[RAM_DATA_WIDTH - 1:0]  ram_write_data_;
	wire	[RAM_ADDR_WIDTH - 1:0]	ram_addr_;			
	wire	 ram_write_enable_;
	wire   ram_read_enable_;
   wire   ram_enable_;
	wire  [RAM_DATA_WIDTH - 1:0]  ram_read_data_;
	
	
	assign ram_enable_ =(ram_external_control_enable)?external_ram_enable:ram_enable;
	assign ram_write_enable_=(ram_external_control_enable)?external_ram_write_enable:ram_write_enable;
	assign ram_read_enable_= (ram_external_control_enable)? external_ram_read_enable:ram_read_enable;
   assign ram_addr_ = (ram_external_control_enable)?external_ram_addr:ram_addr;
	assign ram_write_data_ = (ram_external_control_enable)?external_ram_write_data:ram_write_data;
	
	assign external_ram_read_data= ram_read_data_;
   assign ram_read_data=ram_read_data_;
	
ceyloniac_sync_ram uut (
	   .clk(clk),
		.ram_addr(ram_addr_), 
		.ram_write_data(ram_write_data_), 
		.ram_write_enable(ram_write_enable_), 
		.ram_read_enable(ram_read_enable_), 
		.ram_enable(ram_enable_),
		.ram_read_data(ram_read_data_)
	);

endmodule
