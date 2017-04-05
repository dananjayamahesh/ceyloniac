`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:31:23 11/25/2015 
// Design Name: 
// Module Name:    ceyloniac_alu_in_b_sel_mux 
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
module ceyloniac_alu_in_b_sel_mux
#(parameter ALU_DATA_WIDTH=32)
(
alu_src_b,
mux_in_0,
mux_in_1,
mux_in_2,
mux_in_3,
mux_out
    );

input [1:0]alu_src_b;
input [ALU_DATA_WIDTH-1:0]mux_in_0,mux_in_1,mux_in_2,mux_in_3;
output reg [ALU_DATA_WIDTH-1:0]mux_out;

always@(*)begin
case(alu_src_b)
2'b00:mux_out=mux_in_0;
2'b01:mux_out=mux_in_1;
2'b10:mux_out=mux_in_2;
2'b11:mux_out=mux_in_3;
endcase
end
endmodule
