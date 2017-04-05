`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:22:58 11/22/2015
// Design Name:   ceyloniac_X
// Module Name:   F:/FYP/CEYLONIAC/CEYLONIACX_MULTI_CYCLE_PROCESSOR/test_ceyloniac_X.v
// Project Name:  CEYLONIACX_MULTI_CYCLE_PROCESSOR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ceyloniac_X
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ceyloniac_X;
  parameter ALU_DATA_WIDTH=32,REG_DATA_WIDTH=32,REG_ADDR_WIDTH=5,RAM_DATA_WIDTH=32,RAM_ADDR_WIDTH=16,ALU_OP_WIDTH=4, OPCODE_WIDTH=6, STATE_WIDTH=4;
	// Inputs
	reg clk;
	reg reset;
	wire[5:0] opcode;
	reg overflow;
	reg pc_enable;
	
	reg ram_enable;
	reg ram_external_control_enable;
	reg external_ram_enable;
	reg external_ram_write_enable;
	reg external_ram_read_enable;
	reg [15:0] external_ram_addr;
	reg [31:0] external_ram_write_data;
	reg control_enable;

	// Outputs
	wire [3:0] alu_op;
	wire pc_write_cond;
	wire pc_write;
	wire [15:0] pc_in;
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
	
	wire [15:0] pc_out;
	wire ram_write_enable;
	wire ram_read_enable;
	wire [15:0] ram_addr;
	wire [31:0] ram_write_data;
	wire [31:0] ram_read_data;
	wire [31:0] external_ram_read_data;
	

reg reg_external_control_enable;	
reg  external_write_enable;
reg [REG_ADDR_WIDTH-1:0] external_read_addr1, external_read_addr2, external_write_addr;
reg [REG_DATA_WIDTH-1:0] external_write_data;
wire [REG_DATA_WIDTH-1:0] read_data1, read_data2;
	// Instantiate the Unit Under Test (UUT)
	
	wire [ALU_DATA_WIDTH-1:0]alu_output;
	wire [ALU_DATA_WIDTH-1:0]alu_out_inst;
	
	wire [ALU_DATA_WIDTH-1:0] alu_in_1;
wire [ALU_DATA_WIDTH-1:0] alu_in_2;
	
	integer i=0;	
	integer read_file;
	integer read_data;
	reg [31:0] register_to_store_data;
	
	ceyloniac_X uut (
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
		.ram_enable(ram_enable), 
		.ram_write_enable(ram_write_enable), 
		.ram_read_enable(ram_read_enable), 
		.ram_addr(ram_addr), 
		.ram_write_data(ram_write_data), 
		.ram_read_data(ram_read_data), 
		.ram_external_control_enable(ram_external_control_enable), 
		.external_ram_enable(external_ram_enable), 
		.external_ram_write_enable(external_ram_write_enable), 
		.external_ram_read_enable(external_ram_read_enable), 
		.external_ram_addr(external_ram_addr), 
		.external_ram_write_data(external_ram_write_data), 
		.external_ram_read_data(external_ram_read_data),
		
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

	initial begin
		// Initialize Inputs
		i=0;		
		read_file =		$fopen("readme.txt","r");	
		clk = 0;
		reset = 1;
		//opcode = 0;
		overflow = 0;
		pc_enable = 0;
		//pc_in = 0;
		ram_enable = 0;
		ram_external_control_enable = 0;
		external_ram_enable = 0;
		external_ram_write_enable = 0;
		external_ram_read_enable = 0;
		external_ram_addr = 0;
		external_ram_write_data = 0;
		control_enable=0;

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
		
		external_ram_read_enable=1;
		external_ram_addr=1;
			ram_external_control_enable = 0; 
			 reset=0;
		#90;
      
		
		
/////////////////////////////////////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		  reset=0;
        ram_enable=1;
		  pc_enable=1;
		  control_enable=1;
		  overflow=0;		
        #200;
	 
	end
	
	always begin
	#5 clk = ~clk;
	end
      
endmodule

