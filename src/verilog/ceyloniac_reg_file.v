`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:00:16 11/23/2015 
// Design Name: 
// Module Name:    ceyloniac_reg_file 
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
module ceyloniac_regfile
#(parameter REG_DATA_WIDTH=32,REG_ADDR_WIDTH=5)
(
clk,
read_addr1,
read_addr2,
write_addr,
write_data,
write_enable,
read_data1,
read_data2
);
parameter REGFILE_WIDTH=1<<REG_ADDR_WIDTH;
input  clk,write_enable;
input [REG_ADDR_WIDTH-1:0] read_addr1, read_addr2, write_addr;
input [REG_DATA_WIDTH-1:0] write_data;
output [REG_DATA_WIDTH-1:0] read_data1, read_data2;

reg [REG_ADDR_WIDTH-1:0] read_addr_1, read_addr_2;
reg [REG_DATA_WIDTH - 1:0] reg_file[0:REGFILE_WIDTH-1];

assign read_data1 = reg_file[read_addr_1];
assign read_data2 = reg_file[read_addr_2];
initial begin
reg_file[0] <= 0;
end
 
always@(read_addr1,read_addr2)begin
  if(!write_enable)begin
    read_addr_1 <= read_addr1;
    read_addr_2 <= read_addr2;
	 end
end
always@(posedge clk) begin
    if(write_enable == 1) begin
        $display("writing time:%ttAddress:%dtData:%d", $time, write_addr, write_data);
        reg_file[write_addr] <= write_data;
    end
end
 endmodule

