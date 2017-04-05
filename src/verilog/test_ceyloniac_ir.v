`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:08:58 11/23/2015
// Design Name:   ceyloniac_instruction_register
// Module Name:   F:/FYP/CEYLONIAC/CEYLONIACX_MULTI_CYCLE_PROCESSOR/test_ceyloniac_ir.v
// Project Name:  CEYLONIACX_MULTI_CYCLE_PROCESSOR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ceyloniac_instruction_register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ceyloniac_ir;

	// Inputs
	reg clk;
	reg reset;
	reg ir_write;
	reg [31:0]instruction;
	wire [5:0] instr_31_26;

	// Outputs
	wire [4:0] instr_25_21;
	wire [4:0] instr_20_16;
	wire [15:0] instr_15_0;
	wire [4:0] instr_15_11;
	wire [25:0] instr_25_0;

	integer i=0;	
	integer read_file;
	integer read_data;
	
	reg [31:0] register_to_store_data;
	// Instantiate the Unit Under Test (UUT)
	ceyloniac_instruction_register uut (
		.clk(clk), 
		.reset(reset), 
		.ir_write(ir_write), 
		.instruction(instruction), 
		.instr_31_26(instr_31_26), 
		.instr_25_21(instr_25_21), 
		.instr_20_16(instr_20_16), 
		.instr_15_0(instr_15_0), 
		.instr_15_11(instr_15_11), 
		.instr_25_0(instr_25_0)
	);

	initial begin
		// Initialize Inputs
		i=0;		
		read_file =		$fopen("readme.txt","r");	
		clk = 0;
		reset = 0;
		ir_write = 0;
		instruction = 0;
		//instr_31_26 = 0;

		// Wait 100 ns for global reset to finish
		#100;
			for (i=1;i<=6;i=i+1)begin
		
		read_data = $fscanf(read_file, "%b", instruction);
	   ir_write=1;
		#10
		ir_write=0;
			#10;			
		end
        
		// Add stimulus here

	end
	
	always begin
		#5 clk= ~clk;
	end
      
endmodule

