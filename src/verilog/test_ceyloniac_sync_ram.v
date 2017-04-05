`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:15:59 11/22/2015
// Design Name:   ceyloniac_sync_ram
// Module Name:   F:/FYP/CEYLONIAC/CEYLONIACX_MULTI_CYCLE_PROCESSOR/test_ceyloniac_sync_ram.v
// Project Name:  CEYLONIACX_MULTI_CYCLE_PROCESSOR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ceyloniac_sync_ram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ceyloniac_sync_ram;

		// Inputs
	reg [15:0] ram_addr;
	reg [31:0] ram_write_data;
	reg ram_write_enable;
	reg ram_read_enable;
	reg ram_enable;

	// Outputs
	wire [31:0] ram_read_data;
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	ceyloniac_sync_ram uut (
	   .clk(clk),
		.ram_addr(ram_addr), 
		.ram_read_data(ram_read_data), 
		.ram_write_data(ram_write_data), 
		.ram_write_enable(ram_write_enable), 
		.ram_read_enable(ram_read_enable), 
		.ram_enable(ram_enable)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ram_addr = 0;
		ram_write_data = 0;
		ram_write_enable = 0;
		ram_read_enable = 0;
		ram_enable = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// Initialize Inputs
		//clk = 0;
		ram_addr = 0;
		ram_write_data = 0;
		ram_write_enable = 0;
		ram_enable = 0;
		ram_enable = 1;
		
/*		#20;
			addr_in = 32'b0;
		w_data_in = 32'b0;
		w_en_in = 1'b1;
				
		
			#20;
			addr_in = 32'b1;
		w_data_in = 32'b1;
		w_en_in = 1'b1;
				
			#20;
			addr_in = 32'b10;
		w_data_in = 32'b10;
		w_en_in = 1'b1;
		
			#20;
			addr_in = 32'b11;
		w_data_in = 32'b11;
		w_en_in = 1'b1;
		
		// Wait 100 ns for global reset to finish
		#100;
			w_en_in = 1'b0;
       #20;
		 	w_en_in = 1'b0;
			addr_in = 32'b10;
		   	
				#100;
				addr_in = 32'b11;
				#100;*/
				
					//Programming the Instruction into the Instruction Memory.............................
				
		#20;
			ram_addr = 32'b0;
		ram_write_data = 32'b0;  //Feeding Instructions into the processor
		ram_write_enable = 1'b1;
						
			#20;
			ram_addr = 32'b1;
		ram_write_data = 32'b1;  //Feeding Instructions into the processor
		ram_write_enable = 1'b1;
				
			#20;
				ram_addr = 32'b10;
		ram_write_data = 32'b10;  //Feeding Instructions into the processor
		ram_write_enable = 1'b1;
			#20;
			ram_addr = 32'b11;
		ram_write_data = 32'b11;  //Feeding Instructions into the processor
		ram_write_enable = 1'b1;
		
		
		#100;
		
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

