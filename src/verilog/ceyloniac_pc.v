`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:39 11/22/2015 
// Design Name: 
// Module Name:    ceyloniac_pc 
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
module ceyloniac_pc
#(parameter RAM_ADDR_WIDTH=16)
(
pc_enable,
pc_write,
clk,
pc_reset,
pc_in,
pc_out
);

 input clk;
 input pc_enable;
 input pc_write;
 input pc_reset;
 input [RAM_ADDR_WIDTH-1:0]pc_in;
 output [RAM_ADDR_WIDTH-1:0]pc_out;
 reg [RAM_ADDR_WIDTH-1:0]pc;
 
 assign pc_out=pc;

always@(posedge clk)begin

$display("Program Counter: %g %b  %b  %b  %b  %b PC-OUT\n",$time,pc,pc_enable, pc_reset, pc_write, pc_out );
 if(pc_enable)begin
    if(!pc_reset)begin
      if(pc_write)begin
           pc<=pc_in;
      end		
		else begin//pc_out
       end      
	 end
	 else begin
			pc<=0;
	end
			
 end
else begin
		pc<=0;
end

end//always begin


endmodule
