`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:48:27 11/23/2015 
// Design Name: 
// Module Name:    ceyloniac_instruction_register 
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
module ceyloniac_instruction_register
#(parameter RAM_DATA_WIDTH=32,OPCODE_WIDTH=6)
(
clk,
reset,
ir_write,
instruction,
instr_31_26,
instr_25_21,
instr_20_16,
instr_15_0,
instr_15_11,
instr_25_0
    );

input clk;
input reset;
input ir_write;
input [RAM_DATA_WIDTH-1:0]instruction;
output reg[OPCODE_WIDTH-1:0] instr_31_26;
output reg[4:0] instr_25_21;
output reg[4:0] instr_20_16;
output reg [15:0] instr_15_0;
output reg[4:0] instr_15_11;
output reg[25:0] instr_25_0;


always@(posedge clk)begin
if(!reset)begin
  if(ir_write)begin
		instr_31_26<=instruction[31:26];
		instr_25_21<=instruction[25:21];
		instr_20_16<=instruction[20:16];
		instr_15_0<=instruction[15:0];
		instr_15_11<=instruction[15:11];
		instr_25_0<=instruction[25:0];
  end
end
else begin
     	instr_31_26<=0;
		instr_25_21<=0;
		instr_20_16<=0;
		instr_15_0<=0;
		instr_15_11<=0;
		instr_25_0<=0;
end

end

endmodule
