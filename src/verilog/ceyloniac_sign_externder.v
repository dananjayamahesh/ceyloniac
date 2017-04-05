`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:48:07 11/25/2015 
// Design Name: 
// Module Name:    ceyloniac_sign_externder 
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
module ceyloniac_sign_externder
#(parameter IN_WIDTH=16,OUT_WIDTH=32)
(
   sign_extended_in,
	sign_extended_out
 );

input [IN_WIDTH-1:0] sign_extended_in;
output [OUT_WIDTH-1:0] sign_extended_out;

assign sign_extended_out=sign_extended_in;
endmodule

