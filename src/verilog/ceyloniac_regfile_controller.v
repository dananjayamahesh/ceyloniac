`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:08 11/23/2015 
// Design Name: 
// Module Name:    ceyloniac_regfile_controller 
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
module ceyloniac_regfile_controller
#(parameter REG_DATA_WIDTH=32,REG_ADDR_WIDTH=5)
(
clk,

reg_external_control_enable,

read_addr1,
read_addr2,
write_addr,
write_data,
write_enable,

external_read_addr1,
external_read_addr2,
external_write_addr,
external_write_data,
external_write_enable,

read_data1,
read_data2
    
);

input  clk;
input reg_external_control_enable;

input  write_enable;
input [REG_ADDR_WIDTH-1:0] read_addr1, read_addr2, write_addr;
input [REG_DATA_WIDTH-1:0] write_data;

input  external_write_enable;
input [REG_ADDR_WIDTH-1:0] external_read_addr1, external_read_addr2, external_write_addr;
input [REG_DATA_WIDTH-1:0] external_write_data;

output [REG_DATA_WIDTH-1:0] read_data1, read_data2;

wire  write_enable_;
wire [REG_ADDR_WIDTH-1:0] read_addr1_, read_addr2_, write_addr_;
wire [REG_DATA_WIDTH-1:0] write_data_;

assign write_enable_=(reg_external_control_enable)?external_write_enable:write_enable;
assign read_addr1_=(reg_external_control_enable)?external_read_addr1:read_addr1;
assign read_addr2_=(reg_external_control_enable)?external_read_addr2:read_addr2;
assign write_addr_=(reg_external_control_enable)?external_write_addr:write_addr;
assign write_data_=(reg_external_control_enable)?external_write_data:write_data;

ceyloniac_regfile
#(.REG_DATA_WIDTH(REG_DATA_WIDTH),.REG_ADDR_WIDTH(REG_ADDR_WIDTH)) regfile
(
.clk(clk),
.read_addr1(read_addr1_),
.read_addr2(read_addr2_),
.write_addr(write_addr_),
.write_data(write_data_),
.write_enable(write_enable_),
.read_data1(read_data1),
.read_data2(read_data2)
);

endmodule
