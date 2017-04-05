`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:01:24 11/22/2015
// Design Name:   ceyloniac_pc_ram_control
// Module Name:   F:/FYP/CEYLONIAC/CEYLONIACX_MULTI_CYCLE_PROCESSOR/test_ceylonoiac_core.v
// Project Name:  CEYLONIACX_MULTI_CYCLE_PROCESSOR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ceyloniac_pc_ram_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ceylonoiac_core;

	// Inputs
	reg clk;
	reg reset;
	reg [5:0] opcode;
	reg overflow;
	reg pc_enable;
	reg [31:0] pc_in;
	reg ram_enable;
	reg [0:0] ram_read_data;

	// Outputs
	wire [3:0] alu_op;
	wire pc_write_cond;
	wire pc_write;
	wire i_or_d;
	wire mem_read;
	wire mem_write;
	wire mem_to_reg;
	wire ir_write;
	wire [1:0] pc_source;
	wire alu_src_a;
	wire [1:0] alu_src_b;
	wire reg_write;
	wire reg_dst;
	wire epc_write;
	wire cause_write;
	wire int_cause;
	wire [3:0] current_state;
	wire [31:0] pc_out;
	wire ram_write_enable;
	wire ram_read_enable;
	wire [0:0] ram_addr;
	wire [0:0] ram_write_data;
	

	// Instantiate the Unit Under Test (UUT)
	ceyloniac_pc_ram_control uut (
		.clk(clk), 
		.reset(reset), 
		.opcode(opcode), 
		.overflow(overflow), 
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
		.ram_enable(ram_enable), 
		.ram_write_enable(ram_write_enable), 
		.ram_read_enable(ram_read_enable), 
		.ram_addr(ram_addr), 
		.ram_write_data(ram_write_data), 
		.ram_read_data(ram_read_data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		opcode = 0;
		overflow = 0;
		pc_enable = 0;
		pc_in = 0;
		ram_enable = 0;
		ram_read_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

