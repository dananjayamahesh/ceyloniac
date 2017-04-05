`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:40:31 11/22/2015
// Design Name:   ceyloniac_ram_controller
// Module Name:   F:/FYP/CEYLONIAC/CEYLONIACX_MULTI_CYCLE_PROCESSOR/test_ceyloniac_ram_controller.v
// Project Name:  CEYLONIACX_MULTI_CYCLE_PROCESSOR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ceyloniac_ram_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module test_ceyloniac_ram_controller;

	// Inputs
	reg clk;
	reg ram_external_control_enable;
	reg ram_enable;
	reg ram_write_enable;
	reg ram_read_enable;
	reg [15:0] ram_addr;
	reg [31:0] ram_write_data;
	reg external_ram_enable;
	reg external_ram_write_enable;
	reg external_ram_read_enable;
	reg [15:0] external_ram_addr;
	reg [31:0] external_ram_write_data;

	// Outputs
	wire [31:0] ram_read_data;
	wire [31:0] external_ram_read_data;

	// Instantiate the Unit Under Test (UUT)
	
	integer i=0;	
	integer read_file;
	integer read_data;
	reg [31:0] register_to_store_data;
	
	ceyloniac_ram_controller uut (
		.clk(clk), 
		.ram_external_control_enable(ram_external_control_enable), 
		.ram_enable(ram_enable), 
		.ram_write_enable(ram_write_enable), 
		.ram_read_enable(ram_read_enable), 
		.ram_addr(ram_addr), 
		.ram_write_data(ram_write_data), 
		.ram_read_data(ram_read_data), 
		.external_ram_enable(external_ram_enable), 
		.external_ram_write_enable(external_ram_write_enable), 
		.external_ram_read_enable(external_ram_read_enable), 
		.external_ram_addr(external_ram_addr), 
		.external_ram_write_data(external_ram_write_data), 
		.external_ram_read_data(external_ram_read_data)
	);
      
			initial begin
			
		i=0;		
		read_file =		$fopen("readme.txt","r");	
		
		// Initialize Inputs
		clk = 0;
		ram_addr = 0;
		ram_write_data = 0;
		ram_write_enable = 0;
		ram_read_enable = 0;
		ram_enable = 0;

	// Initialize Inputs
		clk = 0;
		
		ram_external_control_enable = 0;
		
		ram_enable = 0;
		ram_write_enable = 0;
		ram_read_enable = 0;
		ram_addr = 0;
		ram_write_data = 0;
		
		external_ram_enable = 0;
		external_ram_write_enable = 0;
		external_ram_read_enable = 0;
		external_ram_addr = 0;
		external_ram_write_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		ram_external_control_enable = 1;

		external_ram_addr = 0;
		external_ram_write_data = 0;
		external_ram_write_enable = 0;
		external_ram_enable = 0;
		external_ram_enable = 1;
		
		for (i=1;i<=6;i=i+1)begin
		external_ram_addr = i;
		read_data = $fscanf(read_file, "%b", external_ram_write_data);
		external_ram_write_enable = 1'b1;
			#20;			
		end
		
			/*
		#20;
			external_ram_addr = 32'b0;
		external_ram_write_data = 32'b0;  //Feeding Instructions into the processor
		external_ram_write_enable = 1'b1;
						
			#20;
			external_ram_addr = 32'b1;
		external_ram_write_data = 32'b1;  //Feeding Instructions into the processor
		external_ram_write_enable = 1'b1;
				
			#20;
				external_ram_addr = 32'b10;
		external_ram_write_data = 32'b10;  //Feeding Instructions into the processor
		external_ram_write_enable = 1'b1;
			#20;
			external_ram_addr = 32'b11;
		external_ram_write_data = 32'b11;  //Feeding Instructions into the processor
		external_ram_write_enable = 1'b1;
		*/
		
		#100;
		     external_ram_enable=1'b1;
				ram_external_control_enable = 0;

		   ram_enable=1'b1;
		 	ram_write_enable = 1'b0;
			ram_read_enable=1'b1;
			ram_addr = 32'b10;
		   	
				#100;
				ram_addr= 32'b11;
				#100;

	end
	
	always begin 
	#5 clk= ~clk;
	end
	
endmodule

