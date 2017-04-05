`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:50 12/02/2015 
// Design Name: 
// Module Name:    ceyloniac_pc_sel_mux 
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
module ceyloniac_pc_sel_mux
#(parameter ALU_DATA_WIDTH=32)
(
pc_src,
pc_in_0,
pc_in_1,
pc_in_2,
pc_in_3,
pc_mux_out
    );

input [1:0]pc_src;
input [ALU_DATA_WIDTH-1:0]pc_in_0,pc_in_1,pc_in_2,pc_in_3;
output reg [ALU_DATA_WIDTH-1:0]pc_mux_out;

always@(*)begin
case(pc_src)
2'b00:pc_mux_out=pc_in_0;
2'b01:pc_mux_out=pc_in_1;
2'b10:pc_mux_out=pc_in_2;
2'b11:pc_mux_out=pc_in_3;
endcase
end
endmodule

