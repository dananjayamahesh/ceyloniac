`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:34 11/22/2015 
// Design Name: 
// Module Name:    ceyloniac_X 
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
module ceyloniac_X
#(parameter ALU_DATA_WIDTH=32,REG_DATA_WIDTH=32,REG_ADDR_WIDTH=5,RAM_DATA_WIDTH=32,RAM_ADDR_WIDTH=16,ALU_OP_WIDTH=4, OPCODE_WIDTH=6, STATE_WIDTH=4)
(
clk,
reset,

opcode,
overflow,

control_enable,
alu_op,
pc_write_cond,
pc_write,
i_or_d,
mem_read,
mem_write,
mem_to_reg,
ir_write,
pc_source,
alu_src_a,
alu_src_b,
reg_write,
reg_dst,
epc_write,
cause_write,
int_cause,
current_state,

pc_enable,
pc_in,
pc_out,

ram_enable,
ram_write_enable,
ram_read_enable,
ram_addr,
ram_write_data,	
ram_read_data,

ram_external_control_enable,

external_ram_enable,
external_ram_write_enable,
external_ram_read_enable,
external_ram_addr,
external_ram_write_data,
external_ram_read_data,

reg_external_control_enable,

external_read_addr1,
external_read_addr2,
external_write_addr,
external_write_data,
external_write_enable,

read_data1,
read_data2,

alu_in_1,
alu_in_2,

alu_output,
alu_out_inst

 );
	 
input clk;
input reset;
output [OPCODE_WIDTH-1:0] opcode;
input overflow;

input pc_enable;
input control_enable;

output [RAM_ADDR_WIDTH-1:0]pc_in;
output [RAM_ADDR_WIDTH-1:0]pc_out;

output  [ALU_OP_WIDTH-1:0] alu_op;
output  pc_write_cond;
output  pc_write;
output  i_or_d;
output  mem_read;
output  mem_write;
output  mem_to_reg;
output  ir_write;
output  [1:0]pc_source;
output  alu_src_a;
output  [1:0]alu_src_b;
output  reg_write;
output  reg_dst;
output  epc_write;
output  cause_write;
output  int_cause;
output [3:0]current_state;

input    ram_enable;
output	[RAM_DATA_WIDTH - 1:0]  ram_write_data;
output	[RAM_ADDR_WIDTH - 1:0]	ram_addr;			
output	 ram_write_enable;
output   ram_read_enable;
output   [RAM_DATA_WIDTH - 1:0]	  ram_read_data;	

	input ram_external_control_enable;

	input	[RAM_DATA_WIDTH - 1:0]  external_ram_write_data;
	input	[RAM_ADDR_WIDTH - 1:0]	external_ram_addr;			
	input	 external_ram_write_enable;
	input  external_ram_read_enable;
   input  external_ram_enable;
	output [RAM_DATA_WIDTH - 1:0]  external_ram_read_data;
	
input reg_external_control_enable;	
input  external_write_enable;
input [REG_ADDR_WIDTH-1:0] external_read_addr1, external_read_addr2, external_write_addr;
input [REG_DATA_WIDTH-1:0] external_write_data;
output [REG_DATA_WIDTH-1:0] read_data1, read_data2;

output [ALU_DATA_WIDTH-1:0]alu_output;
output [ALU_DATA_WIDTH-1:0]alu_out_inst;

output [ALU_DATA_WIDTH-1:0] alu_in_1;
output [ALU_DATA_WIDTH-1:0] alu_in_2;


wire	[RAM_DATA_WIDTH - 1:0]  ram_write_data_;
wire	[RAM_ADDR_WIDTH - 1:0]	ram_addr_;			
wire	 ram_write_enable_;
wire   ram_read_enable_;
wire   ram_enable_;
wire  [RAM_DATA_WIDTH - 1:0]	  ram_read_data_;	

assign ram_write_data=ram_write_data_;
assign ram_addr=ram_addr_;
assign ram_write_enable=ram_write_enable_;
assign  ram_read_enable= ram_read_enable_;
assign ram_read_data=ram_read_data_;

	ceyloniac_pc_ram_control core (
		.clk(clk), 
		.reset(reset), 
		.opcode(opcode), 
		.overflow(overflow), 
		.control_enable(control_enable),
		.alu_op(alu_op), 
		.pc_write_cond(pc_write_cond), 
		.pc_write(pc_write), 
		.i_or_d(i_or_d), 
		.mem_read(mem_read), 
		.mem_write(mem_write), 
		.mem_to_reg(mem_to_reg), 
		.ir_write(ir_write), 
		.pc_source(pc_source), 
		.alu_src_a(alu_src_a), 
		.alu_src_b(alu_src_b), 
		.reg_write(reg_write), 
		.reg_dst(reg_dst), 
		.epc_write(epc_write), 
		.cause_write(cause_write), 
		.int_cause(int_cause), 
		.current_state(current_state), 
		.pc_enable(pc_enable), 
		.pc_in(pc_in), 
		.pc_out(pc_out), 
		.ram_enable(ram_enable_), 
		.ram_write_enable(ram_write_enable_), 
		.ram_read_enable(ram_read_enable_), 
		.ram_addr(ram_addr_), 
		.ram_write_data(ram_write_data_), 
		.ram_read_data(ram_read_data_),
		
		.reg_external_control_enable(reg_external_control_enable),

		.external_read_addr1(external_read_addr1),
		.external_read_addr2(external_read_addr2),
		.external_write_addr(external_write_addr),
		.external_write_data(external_write_data),
		.external_write_enable(external_write_enable),

		.read_data1(read_data1),
		.read_data2(read_data2),
		.alu_output(alu_output),
		.alu_out_inst(alu_out_inst),
			.alu_in_1(alu_in_1),
		.alu_in_2(alu_in_2)
		
	);

		ceyloniac_ram_controller ram_con (
		.clk(clk), 
		
		.ram_external_control_enable(ram_external_control_enable), 
		
		.ram_enable(ram_enable), 
		.ram_write_enable(ram_write_enable_), 
		.ram_read_enable(ram_read_enable_), 
		.ram_addr(ram_addr_), 
		.ram_write_data(ram_write_data_), 
		.ram_read_data(ram_read_data_), 
		
		.external_ram_enable(external_ram_enable), 
		.external_ram_write_enable(external_ram_write_enable), 
		.external_ram_read_enable(external_ram_read_enable), 
		.external_ram_addr(external_ram_addr), 
		.external_ram_write_data(external_ram_write_data), 
		.external_ram_read_data(external_ram_read_data)
	);
	
endmodule
