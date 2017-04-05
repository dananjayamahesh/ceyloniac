`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:31:52 11/22/2015 
// Design Name: 
// Module Name:    ceyloniac_pc_ram_control 
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
module ceyloniac_pc_ram_control
#(parameter EXTENDER_IN_WIDTH=16,EXTENDER_OUT_WIDTH=32,ALU_DATA_WIDTH=32,REG_DATA_WIDTH=32,REG_ADDR_WIDTH=5,RAM_DATA_WIDTH=32,RAM_ADDR_WIDTH=16,ALU_OP_WIDTH=4, OPCODE_WIDTH=6, STATE_WIDTH=4)
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
input control_enable;

input pc_enable;
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


output	[RAM_DATA_WIDTH - 1:0]  ram_write_data;
output	[RAM_ADDR_WIDTH - 1:0]	ram_addr;			
output	 ram_write_enable;
output   ram_read_enable;
input   ram_enable;
input  [RAM_DATA_WIDTH - 1:0]	  ram_read_data;	


input reg_external_control_enable;

wire  write_enable;
wire [REG_ADDR_WIDTH-1:0] read_addr1, read_addr2, write_addr;
wire[REG_DATA_WIDTH-1:0] write_data;

input  external_write_enable;
input [REG_ADDR_WIDTH-1:0] external_read_addr1, external_read_addr2, external_write_addr;
input [REG_DATA_WIDTH-1:0] external_write_data;

output [REG_DATA_WIDTH-1:0] read_data1, read_data2;
wire [REG_DATA_WIDTH-1:0] read_data_a, read_data_b;

output [ALU_DATA_WIDTH-1:0] alu_in_1;
output [ALU_DATA_WIDTH-1:0] alu_in_2;
output [ALU_DATA_WIDTH-1:0] alu_output;
output [ALU_DATA_WIDTH-1:0]alu_out_inst;
	
wire pc_write_;
wire i_or_d_;
wire ir_write_;
wire reg_write_;
wire reg_dst_;
wire mem_to_reg_;
wire mem_read_;
wire mem_write_;
wire alu_src_a_;
wire [1:0]alu_src_b_;
wire [ALU_OP_WIDTH-1:0]alu_op_;
wire [1:0]pc_source_;

wire [RAM_DATA_WIDTH-1:0]instruction;
wire [OPCODE_WIDTH-1:0] instr_31_26;
wire [4:0] instr_25_21;
wire [4:0] instr_20_16;
wire [15:0] instr_15_0;
wire [4:0] instr_15_11;
wire [25:0] instr_25_0;

wire [RAM_DATA_WIDTH-1:0]mdr_data;

wire [RAM_ADDR_WIDTH-1:0]pc_out_;
wire [RAM_ADDR_WIDTH-1:0]pc_in_;
wire  pc_clk;
wire [ALU_DATA_WIDTH-1:0]alu_out_;
wire	[RAM_DATA_WIDTH - 1:0]  ram_write_data_;
wire  [ALU_DATA_WIDTH-1:0]sign_extended_out;

wire [ALU_DATA_WIDTH-1:0]alu_in_a;
wire [ALU_DATA_WIDTH-1:0]alu_in_b;
wire [ALU_DATA_WIDTH-1:0]alu_out;
wire [ALU_DATA_WIDTH-1:0]alu_out_2;
wire alu_status;

assign #1 pc_clk=clk;
//assign pc_clk=clk;

wire [1:0]pc_src;
wire [ALU_DATA_WIDTH-1:0]pc_in_0,pc_in_1,pc_in_2,pc_in_3;
wire [ALU_DATA_WIDTH-1:0]pc_mux_out;


assign ram_write_enable=mem_write_;
assign ram_read_enable=mem_read_;
assign pc_in=pc_in_;
assign pc_out=pc_out_;
assign opcode=instr_31_26;


assign pc_write=pc_write_;
assign i_or_d=i_or_d_;
assign ir_write=ir_write_;
assign reg_write=reg_write_;
assign write_enable=reg_write_;
assign reg_dst=reg_dst_;
assign mem_to_reg=mem_to_reg_;
assign mem_read=mem_read_;
assign mem_write=mem_write_;
assign alu_src_a=alu_src_a_;
assign alu_src_b=alu_src_b_;
assign alu_op=alu_op_;
assign pc_source=pc_source_;


//assign pc_in_= (pc_out_ + 1'b1);
assign instruction=ram_read_data;//Both Same
//assign pc_in_=pc_out_+1;//after pc mux is inserted
assign pc_in_=pc_mux_out;
assign ram_addr=(i_or_d_)?alu_out:pc_out_;//MEMORY ADDRESS SELECT MUX
assign ram_write_data=ram_write_data_;
assign ram_write_data_=read_data_b;
assign alu_output=alu_out_2;
assign alu_out=alu_out_2;
assign alu_out_inst=alu_out_;
assign alu_in_1=alu_in_a;
assign alu_in_2=alu_in_b;

assign read_addr1=instr_25_21;
assign read_addr2=instr_20_16;
assign write_addr=(reg_dst_)?instr_15_11:instr_20_16;
assign write_data=(mem_to_reg_)?mdr_data:alu_out;
assign alu_in_a=(alu_src_a)?read_data_a:pc_out_;

assign pc_src=pc_source_;
assign pc_in_0=alu_out_;
assign pc_in_1=instr_25_0[15:0];
assign pc_in_2=alu_out_2;
assign pc_in_3=16'b0;



initial begin
$monitor("Monitoring : %g -- %b - %b - %b - %b - %b - %b - %b - %b \n MDR_OUT %b \n DATA_READ1: %b \n DATA_READ2: %b\n A: %b \n B: %b\n EXTENDED_OUT: %b\n ALU_IN_A: %b\n ALU_IN_B: %b\n  ALU_OUT: %b\n ALU_OUTPUT_2: %b\n",$time,pc_out_,instruction,instr_31_26,instr_25_21,instr_20_16,instr_15_0,instr_15_11,instr_25_0,mdr_data,read_data1,read_data2,read_data_a,read_data_b,sign_extended_out,alu_in_a,alu_in_b,alu_out_,alu_out_2);
end

	ceyloniac_pc pc (
		.pc_enable(pc_enable), 
		.pc_write(pc_write_), 
		.clk(pc_clk), 
		.pc_reset(reset), 
		.pc_in(pc_in_), 
		.pc_out(pc_out_)
	);
	
	ceyloniac_multi_cycle_control_unit core (
		.clk(clk), 
		.reset(reset), 
		.opcode(instr_31_26), 
		.overflow(overflow),
		.control_enable(control_enable),
		.alu_op(alu_op_), 
		.pc_write_cond(pc_write_cond), 
		.pc_write(pc_write_), 
		.i_or_d(i_or_d_), 
		.mem_read(mem_read_), 
		.mem_write(mem_write_), 
		.mem_to_reg(mem_to_reg_), 
		.ir_write(ir_write_), 
		.pc_source(pc_source_), 
		.alu_src_a(alu_src_a_), 
		.alu_src_b(alu_src_b_), 
		.reg_write(reg_write_), 
		.reg_dst(reg_dst_), 
		.epc_write(epc_write), 
		.cause_write(cause_write), 
		.int_cause(int_cause),
		.current_state(current_state)
	);

	
		ceyloniac_instruction_register uut (
		.clk(clk), 
		.reset(reset), 
		.ir_write(ir_write_), 
		.instruction(instruction), 
		.instr_31_26(instr_31_26), 
		.instr_25_21(instr_25_21), 
		.instr_20_16(instr_20_16), 
		.instr_15_0(instr_15_0), 
		.instr_15_11(instr_15_11), 
		.instr_25_0(instr_25_0)
	);
	
	ceyloniac_mem_data_reg
#(.RAM_DATA_WIDTH(32)) mdr
(
.clk(clk),
.reset(reset),
.mem_read_data(ram_read_data),
.mdr_data(mdr_data)
);
	
		ceyloniac_regfile_controller regfile_controller (
		.clk(clk), 
		.reg_external_control_enable(reg_external_control_enable), 
		.read_addr1(read_addr1), 
		.read_addr2(read_addr2), 
		.write_addr(write_addr), 
		.write_data(write_data), 
		.write_enable(write_enable), 
		.external_read_addr1(external_read_addr1), 
		.external_read_addr2(external_read_addr2), 
		.external_write_addr(external_write_addr), 
		.external_write_data(external_write_data), 
		.external_write_enable(external_write_enable), 
		.read_data1(read_data1), 
		.read_data2(read_data2)
	);
	
	
ceyloniac_a_b
#(.RAM_DATA_WIDTH(RAM_DATA_WIDTH)) ab
(
.clk(clk),
.reset(reset),
.read_data1(read_data1),
.read_data2(read_data2),
.read_data_a(read_data_a),
.read_data_b(read_data_b)
);


ceyloniac_sign_externder
#(.IN_WIDTH(EXTENDER_IN_WIDTH),.OUT_WIDTH(EXTENDER_OUT_WIDTH)) extender
(
   .sign_extended_in(instr_15_0),
	.sign_extended_out(sign_extended_out)
 );
 
 ceyloniac_alu_in_b_sel_mux
#(.ALU_DATA_WIDTH(ALU_DATA_WIDTH)) alu_b_mux
(
.alu_src_b(alu_src_b_),
.mux_in_0(read_data_b),
.mux_in_1(32'b1),
.mux_in_2(sign_extended_out),
.mux_in_3(sign_extended_out),
.mux_out(alu_in_b)
  
 );
 
 ceyloniac_pc_sel_mux
#(.ALU_DATA_WIDTH(ALU_DATA_WIDTH)) pc_mux
(
.pc_src(pc_src),
.pc_in_0(pc_in_0),
.pc_in_1(pc_in1),
.pc_in_2(pc_in_2),
.pc_in_3(pc_in_3),
.pc_mux_out(pc_mux_out)

);
	 
	 

ceyloniac_alu
#(.ALU_DATA_WIDTH(ALU_DATA_WIDTH),.ALU_OP_WIDTH(ALU_OP_WIDTH)) alu
(
.alu_in_a(alu_in_a),
.alu_in_b(alu_in_b),
.alu_sel(alu_op_),
.alu_status(alu_status),
.alu_out(alu_out_)
 );	 
 
 ceyloniac_alu_output
#(.ALU_DATA_WIDTH(ALU_DATA_WIDTH)) alu_output_unit
(
.clk(clk),
.reset(reset),
.alu_output_in(alu_out_),
.alu_output_out(alu_out_2)
);


 
 
endmodule
