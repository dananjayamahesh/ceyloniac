`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:48:31 11/23/2015
// Design Name:   ceyloniac_regfile_controller
// Module Name:   F:/FYP/CEYLONIAC/CEYLONIACX_MULTI_CYCLE_PROCESSOR/test_ceyloniac_regfile_controller.v
// Project Name:  CEYLONIACX_MULTI_CYCLE_PROCESSOR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ceyloniac_regfile_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module test_ceyloniac_regfile_controller;
	// Inputs
	reg clk;
	reg reg_external_control_enable;
	reg [4:0] read_addr1;
	reg [4:0] read_addr2;
	reg [4:0] write_addr;
	reg [31:0] write_data;
	reg write_enable;
	reg [4:0] external_read_addr1;
	reg [4:0] external_read_addr2;
	reg [4:0] external_write_addr;
	reg [31:0] external_write_data;
	reg external_write_enable;

	// Outputs
	wire [31:0] read_data1;
	wire [31:0] read_data2;

	// Instantiate the Unit Under Test (UUT)
	ceyloniac_regfile_controller uut (
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

	initial begin
		// Initialize Inputs
		clk = 0;
		reg_external_control_enable = 0;
		read_addr1 = 0;
		read_addr2 = 0;
		write_addr = 0;
		write_data = 0;
		write_enable = 0;
		external_read_addr1 = 0;
		external_read_addr2 = 0;
		external_write_addr = 0;
		external_write_data = 0;
		external_write_enable = 0;

	#20;
		reg_external_control_enable=1;
	#20;
	
    external_write_addr <= 5'b00000;
    external_write_data <= 32'b0;
    external_write_enable <= 1'b1;
     #20 ;//reg_write_enable <= 1'b0;
 
    external_write_addr <= 5'b00001;
    external_write_data <= 32'b01;
    external_write_enable <= 1'b1;
     #20;// reg_write_enable <= 1'b0;
	 
	 external_write_addr <= 5'b00010;
    external_write_data <= 32'b10;
    external_write_enable <= 1'b1;
	 #20;// reg_write_enable <= 1'b0;
	 
	 external_write_addr <= 5'b00011;
    external_write_data <= 32'b11;
    external_write_enable <= 1'b1;
	 #20;// reg_write_enable <= 1'b0;
	 
	   reg_external_control_enable=0;
   	external_write_enable=1'b0;
  		#100;     
		 reg_external_control_enable=1;
	   external_read_addr1  <= 5'b00010;
		external_read_addr2  <= 5'b00001;
		external_write_data = 0;
		#100;
		
		 reg_external_control_enable=0;
	   read_addr1  <= 5'b00001;
		read_addr2  <= 5'b00010;
		external_write_data = 0;
		#100;


	end
	
	always begin
		#5 clk =~clk;
	end
      
endmodule

