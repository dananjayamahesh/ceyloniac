`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:52:34 11/19/2015
// Design Name:   ceyloniac_multi_cycle_control_unit
// Module Name:   F:/FYP/CEYLONIAC/CEYLONIACX_MULTI_CYCLE_PROCESSOR/tc_ceyloniac_processor.v
// Project Name:  CEYLONIACX_MULTI_CYCLE_PROCESSOR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ceyloniac_multi_cycle_control_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module tc_ceyloniac_processor;

	// Inputs
	reg clk;
	reg reset;
	reg [5:0] opcode;
	reg overflow;
	reg control_enable;
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
	wire [3:0]current_state;

	// Instantiate the Unit Under Test (UUT)
	ceyloniac_multi_cycle_control_unit uut (
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
		.current_state(current_state)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		opcode = 0;
      overflow=0;
		control_enable=1;
		// Wait 100 ns for global reset to finish
		#100;
        reset=0;
		 //opcode=6'b011001;	

		opcode=6'b010001	;	 //LOAD
		#50;
		opcode=6'b010010	;	 //STORE
		#40;
		opcode=6'b000000	;	 //R
		#40;
		opcode=6'b011001	;	 //BREQ
		#30;
		opcode=6'b011100	;	 //JMP
		#30;
		opcode=6'b010101	;	 //WBIT
		#50;
		
		
		
		 opcode=6'b000000;
		 #50;
		  opcode=6'b010101;
		 #50;
		  opcode=6'b010001;
		 #50;
		  opcode=6'bb011001;
		 #50;
		 opcode=6'b011100;
		 #50;	   

	end
	
	always begin
	#5 clk=~clk;
	end
	
      
endmodule

