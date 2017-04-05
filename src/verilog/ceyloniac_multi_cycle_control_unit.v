`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:22:36 11/18/2015 
// Design Name: 
// Module Name:    ceyloniac_multi_cycle_control_unit 
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
module ceyloniac_multi_cycle_control_unit
#(parameter ALU_OP_WIDTH=4, OPCODE_WIDTH=6, STATE_WIDTH=4)
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
current_state
);
	 
input clk;
input reset;
input [OPCODE_WIDTH-1:0] opcode;
input overflow;
input control_enable;

output reg [ALU_OP_WIDTH-1:0] alu_op;
output reg pc_write_cond;
output reg pc_write;
output reg i_or_d;
output reg mem_read;
output reg mem_write;
output reg mem_to_reg;
output reg ir_write;
output reg [1:0]pc_source;
output reg alu_src_a;
output reg [1:0]alu_src_b;
output reg reg_write;
output reg reg_dst;
output reg epc_write;
output reg cause_write;
output reg int_cause;
output [3:0]current_state;

reg [STATE_WIDTH-1:0] state;
assign current_state=state;

always@(posedge clk)begin
if(control_enable)begin
if(!reset)begin
case(state)

4'b1111:begin
				  state<=4'b0000;
				mem_read=1'b1;
				alu_src_a=1'b0;
				i_or_d=1'b0;
				ir_write=1'b1;
				alu_src_b=2'b01;
				alu_op=4'b0000;
				pc_write=1'b1;
				pc_source=2'b00;
				
			pc_write_cond=1'b0;
			mem_write=1'b0;
			mem_to_reg=1'b0;
			pc_source=2'b00;//
			reg_write=1'b0;
			reg_dst=1'b0;
			epc_write=1'b0;
			cause_write=1'b0;
			int_cause=1'b0;
			end
4'b0000:	begin  //Initial State
		      state<=4'b0001;
				alu_src_a=1'b0;
				alu_src_b=2'b11;
				alu_op=4'b0000;
				
				ir_write=1'b1;
				mem_read=1'b0;//Optional
				mem_write=1'b0;
				pc_write=1'b0;
				
		/*	alu_op=4'b0000;//
			pc_write_cond=1'b0;
			pc_write=1'b0;//
			i_or_d=1'b0;//
			mem_read=1'b0;//
			mem_write=1'b0;
			mem_to_reg=1'b0;
			ir_write=1'b1;//
			pc_source=2'b00;//
			alu_src_a=1'b0;//
			alu_src_b=2'b11;//
			reg_write=1'b0;
			reg_dst=1'b0;
			*/			
			end
			
4'b0001: begin //Instruction Decode
            $display("OPCODE: %g %b %b /n",$time,state,opcode);
           
			  if(opcode==6'b010001 || opcode==6'b010010)begin
				   state<=4'b0010;//Memory Address Computation
					alu_src_a=1'b1;
					//alu_src_b=2'b01; What MIPS Architecture Suggest
					alu_src_b=2'b10;//What Our Architecture Actually Suggest
					alu_op=4'b0000;//Add Offset to Base register
					ir_write=0;
			/*alu_op=4'b0000;//
			pc_write_cond=1'b0;
			pc_write=1'b0;//
			i_or_d=1'b0;//
			mem_read=1'b1;//
			mem_write=1'b0;
			mem_to_reg=1'b0;
			ir_write=1'b1;//
			pc_source=2'b00;//
			alu_src_a=1'b1;//
			alu_src_b=2'b01;//
			reg_write=1'b0;
			reg_dst=1'b0;
			*/
									
				end
				
				else if(opcode[5:4]==2'b00)begin
				   state<=4'b0110;//Execution of R type
					alu_src_a=1'b1;
					alu_src_b=2'b00;
					alu_op=opcode[3:0];
					ir_write=0;
			/*alu_op=opcode[3:0];
			pc_write_cond=1'b0;
			pc_write=1'b0;//
			i_or_d=1'b0;//
			mem_read=1'b1;//
			mem_write=1'b0;
			mem_to_reg=1'b0;
			ir_write=1'b1;//
			pc_source=2'b00;//
			alu_src_a=1'b1;//
			alu_src_b=2'b00;//
			reg_write=1'b0;
			reg_dst=1'b0;
			*/
				end
				
				else if(opcode==6'b011001)begin
				   state<=4'b1000; //Branch Completion
					alu_src_a=1'b1;
					alu_src_b=2'b00;
					alu_op=4'b0001;
					pc_write_cond=1'b1;
					pc_source=2'b01;
					ir_write=0;
			/*alu_op=4'b0001;//
			pc_write_cond=1'b1;
			pc_write=1'b0;//
			i_or_d=1'b0;//
			mem_read=1'b1;//
			mem_write=1'b0;
			mem_to_reg=1'b0;
			ir_write=1'b1;//
			pc_source=2'b01;//
			alu_src_a=1'b1;//
			alu_src_b=2'b00;//
			reg_write=1'b0;
			reg_dst=1'b0;
			*/
					
				
				end
				
				else if(opcode==6'b011100)begin
				   state<=4'b1001;//JUMP Completion
					pc_write=1'b1;
					pc_source=2'b01;
					ir_write=0;
			/*alu_op=4'b0000;//
			pc_write_cond=1'b0;
			pc_write=1'b1;//
			i_or_d=1'b0;//
			mem_read=1'b0;//
			mem_write=1'b0;
			mem_to_reg=1'b0;
			ir_write=1'b1;//
			pc_source=2'b01;//
			alu_src_a=1'b0;//
			alu_src_b=2'b01;//
			reg_write=1'b0;
			reg_dst=1'b0; */
			
				end
				
				else if(opcode==6'b010101 || opcode==6'b010110)begin
				 //opcode==6'b010101 RBIT
				 //opcode==6'b010110 LBIT
				  state<=4'b1100;//Execution of R type
					alu_src_a=1'b1;
					alu_src_b=2'b10;
					alu_op=6'b001111;//Different HBO
				   ir_write=0;
				 
				end
				
				else begin
				    state<=4'b1010;//NO such Instruction
					 int_cause=1'b0;
					 cause_write=1'b1;
					 alu_src_a=1'b0;
					 alu_src_b=2'b01;
					 alu_op=4'b0001;
					 epc_write=1'b1;
					 pc_write=1'b1;
					 pc_source=2'b11;
					 ir_write=0;
				end
			end
4'b0010:	 begin
              if(opcode==6'b010001)begin
				   state<=4'b0011;//Memory Address Computation
					mem_read=1'b1;
					mem_write=1'b0;//
					i_or_d=1'b1;
				end
				
				  else if(opcode==6'b010010)begin
				   state<=4'b0101;//Memory Address Computation
					mem_read=1'b0;
					mem_write=1'b1;
					i_or_d=1'b1;
				end
			 end
4'b0011:	begin
				state<=4'b0100;//Memory Address Computation
				reg_write=1'b1;
				mem_to_reg=1'b1;
				reg_dst=1'b0;
			end
			
4'b0110: begin
            state<=4'b0111;//Memory Address Computation
				reg_dst=1'b1;
				reg_write=1'b1;
				mem_to_reg=1'b0;
				end
			
4'b0111: begin//we need to use overflow signal
         if(overflow)begin
            state<=4'b1011;//Memory Address Computation
				int_cause=1'b1;
				cause_write=1'b1;
				alu_src_a=1'b0;
				alu_src_b=2'b01;
				alu_op=4'b0001;
				epc_write=1'b1;
				pc_write=1'b1;
				pc_source=2'b11;
			end
         else begin
                state<=4'b0000;
				mem_read=1'b1;
				alu_src_a=1'b0;
				i_or_d=1'b0;
				ir_write=1'b1;
				alu_src_b=2'b01;
				alu_op=4'b0000;
				pc_write=1'b1;
				pc_source=2'b00;
			
			pc_write_cond=1'b0;
			mem_write=1'b0;
			mem_to_reg=1'b0;
			pc_source=2'b00;//
			reg_write=1'b0;
			reg_dst=1'b0;
			epc_write=1'b0;
			cause_write=1'b0;
			int_cause=1'b0; 
				end
				
			end	
4'b0100: begin 
				state<=4'b0000;
				mem_read=1'b1;
				alu_src_a=1'b0;
				i_or_d=1'b0;
				ir_write=1'b1;
				alu_src_b=2'b01;
				alu_op=4'b0000;
				pc_write=1'b1;
				pc_source=2'b00;
				
			pc_write_cond=1'b0;
			mem_write=1'b0;
			mem_to_reg=1'b0;
			pc_source=2'b00;//
			reg_write=1'b0;
			reg_dst=1'b0;
			epc_write=1'b0;
			cause_write=1'b0;
			int_cause=1'b0;
				end
				
4'b0101: begin 
			   state<=4'b0000;
				mem_read=1'b1;
				alu_src_a=1'b0;
				i_or_d=1'b0;
				ir_write=1'b1;
				alu_src_b=2'b01;
				alu_op=4'b0000;
				pc_write=1'b1;
				pc_source=2'b00;
			
			pc_write_cond=1'b0;
			mem_write=1'b0;
			mem_to_reg=1'b0;
			pc_source=2'b00;//
			reg_write=1'b0;
			reg_dst=1'b0;
			epc_write=1'b0;
			cause_write=1'b0;
			int_cause=1'b0;
				end
				
4'b1011: begin 
			   state<=4'b0000;
				mem_read=1'b1;
				alu_src_a=1'b0;
				i_or_d=1'b0;
				ir_write=1'b1;
				alu_src_b=2'b01;
				alu_op=4'b0000;
				pc_write=1'b1;
				pc_source=2'b00;
				
			pc_write_cond=1'b0;
			mem_write=1'b0;
			mem_to_reg=1'b0;
			pc_source=2'b00;//
			reg_write=1'b0;
			reg_dst=1'b0;
			reg_dst=1'b0;
			epc_write=1'b0;
			cause_write=1'b0;
			int_cause=1'b0;
			
				end
				
4'b1000: begin 
			   state<=4'b0000;
				mem_read=1'b1;
				alu_src_a=1'b0;
				i_or_d=1'b0;
				ir_write=1'b1;
				alu_src_b=2'b01;
				alu_op=4'b0000;
				pc_write=1'b1;
				pc_source=2'b00;
				
			pc_write_cond=1'b0;
			mem_write=1'b0;
			mem_to_reg=1'b0;
			pc_source=2'b00;//
			reg_write=1'b0;
			reg_dst=1'b0;
			epc_write=1'b0;
			cause_write=1'b0;
			int_cause=1'b0;
				end
				
4'b1001: begin 
			   state<=4'b0000;
				mem_read=1'b1;
				alu_src_a=1'b0;
				i_or_d=1'b0;
				ir_write=1'b1;
				alu_src_b=2'b01;
				alu_op=4'b0000;
				pc_write=1'b1;
				pc_source=2'b00;
				
			pc_write_cond=1'b0;
			mem_write=1'b0;
			mem_to_reg=1'b0;
			pc_source=2'b00;//
			reg_write=1'b0;
			reg_dst=1'b0;
			epc_write=1'b0;
			cause_write=1'b0;
			int_cause=1'b0;
				end
				
4'b1010: begin 
			   state<=4'b0000;
				mem_read=1'b1;
				alu_src_a=1'b0;
				i_or_d=1'b0;
				ir_write=1'b1;
				alu_src_b=2'b01;
				alu_op=4'b0000;
				pc_write=1'b1;
				pc_source=2'b00;
				
			pc_write_cond=1'b0;
			mem_write=1'b0;
			mem_to_reg=1'b0;
			pc_source=2'b00;//
			reg_write=1'b0;
			reg_dst=1'b0;
			epc_write=1'b0;
			cause_write=1'b0;
			int_cause=1'b0;
				end
				
4'b1100: begin
            
            state<=4'b1101;
            reg_dst=1'b0;
				reg_write =1'b1;
				mem_to_reg=1'b0;
					end
4'b1101: begin
           
			  if(overflow)begin
			       state<=4'b1011;//Memory Address Computation
				int_cause=1'b1;
				cause_write=1'b1;
				alu_src_a=1'b0;
				alu_src_b=2'b01;
				alu_op=4'b0001;
				epc_write=1'b1;
				pc_write=1'b1;
				pc_source=2'b11; 
			  end
			  else begin
            state<=4'b0000;
				mem_read=1'b1;
				alu_src_a=1'b0;
				i_or_d=1'b0;
				ir_write=1'b1;
				alu_src_b=2'b01;
				alu_op=4'b0000;
				pc_write=1'b1;
				pc_source=2'b00;
				
			pc_write_cond=1'b0;
			mem_write=1'b0;
			mem_to_reg=1'b0;
			pc_source=2'b00;//
			reg_write=1'b0;
			reg_dst=1'b0;
			epc_write=1'b0;
			cause_write=1'b0;
			int_cause=1'b0;
			end
		end
			
endcase
end
else begin

         state<=4'b0000;
			alu_op=4'b0000;//
			pc_write_cond=1'b0;
			pc_write=1'b1;//
			i_or_d=1'b0;//
			mem_read=1'b1;//
			mem_write=1'b0;
			mem_to_reg=1'b0;
			ir_write=1'b1;//
			pc_source=2'b00;//
			alu_src_a=1'b0;//
			alu_src_b=2'b01;//
			reg_write=1'b0;
			reg_dst=1'b0;
			
			epc_write=1'b0;
			cause_write=1'b0;
			int_cause=1'b0;
			
 
end

end
else begin

         state<=4'b1111;
			alu_op=4'b0000;//
			pc_write_cond=1'b0;
			pc_write=1'b0;//changed
			i_or_d=1'b0;//
			mem_read=1'b0;//
			mem_write=1'b0;
			mem_to_reg=1'b0;
			ir_write=1'b1;//
			pc_source=2'b00;//
			alu_src_a=1'b0;//
			alu_src_b=2'b01;//
			reg_write=1'b0;
			reg_dst=1'b0;
			
			epc_write=1'b0;
			cause_write=1'b0;
			int_cause=1'b0;
			
 
end
end


endmodule
