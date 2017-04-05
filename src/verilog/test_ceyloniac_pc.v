`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:49:37 11/22/2015
// Design Name:   ceyloniac_pc
// Module Name:   F:/FYP/CEYLONIAC/CEYLONIACX_MULTI_CYCLE_PROCESSOR/test_ceyloniac_pc.v
// Project Name:  CEYLONIACX_MULTI_CYCLE_PROCESSOR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ceyloniac_pc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module test_ceyloniac_pc;
	// Inputs
	reg pc_enable;
	reg pc_write;
	reg clk;
	reg pc_reset;
	//reg [31:0] pc_in;
   wire [31:0] pc_in;
	// Outputs
	wire [31:0] pc_out;
		// Instantiate the Unit Under Test (UUT)
	ceyloniac_pc uut (
		.pc_enable(pc_enable), 
		.pc_write(pc_write), 
		.clk(clk), 
		.pc_reset(pc_reset), 
		.pc_in(pc_in), 
		.pc_out(pc_out)
	);

  assign pc_in=pc_out+1;
	initial begin
		// Initialize Inputs
		pc_enable = 0;
		pc_write = 0;
		clk = 0;
		pc_reset = 0;
		//pc_in = 0;
		// Wait 100 ns for global reset to finish
		#100;
		pc_enable=1'b1;
		#100;
		pc_write=1'b1;
		#100;
		pc_write=1'b0;
		#100;
         
		// Add stimulus here

	end
	
	always begin
	#5 clk=~clk;
	end
      
endmodule

