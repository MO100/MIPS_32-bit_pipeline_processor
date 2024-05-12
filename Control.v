module Control(WB_out, MEM_out, EX_out, jump_out, branch_out, op_code_in);

	output [1:0] WB_out, MEM_out;
	output [3:0] EX_out;
	output reg jump_out, branch_out;

	input [5:0]op_code_in;

	reg reg_dest, mem_read, mem_to_reg, mem_write, reg_write, ALU_src;
	reg [1:0] ALU_Op;
	
	always@(*) begin
		case(op_code_in)
			// R_type
			6'b000000: begin
				reg_dest = 1'b1;
				mem_read = 1'b0;
				mem_to_reg = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b1;
				ALU_src = 1'b0;
				ALU_Op = 2'b10;
				jump_out = 1'b0;
				branch_out = 1'b0;
			end
			// jump
			6'b000010: begin
				reg_dest = 1'b0;
				mem_read = 1'b0;
				mem_to_reg = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b0;
				ALU_src = 1'b0;
				ALU_Op = 2'b01;
				jump_out = 1'b1;
				branch_out = 1'b1;
			end
			// branch equal(beq)
			6'b000100: begin
				reg_dest = 1'b0;
				mem_read = 1'b0;
				mem_to_reg = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b0;
				ALU_src = 1'b0;
				ALU_Op = 2'b01;
				jump_out = 1'b1;
				branch_out = 1'b0;
			end
			// addi
			6'b001000: begin
				reg_dest = 1'b0;
				mem_read = 1'b0;
				mem_to_reg = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b1;
				ALU_src = 1'b1;
				ALU_Op = 2'b00;
				jump_out = 1'b0;
				branch_out = 1'b0;
			end
			//load word (lw)
			6'b100011: begin
				reg_dest = 1'b0;
				mem_read = 1'b1;
				mem_to_reg = 1'b1;
				mem_write = 1'b0;
				reg_write = 1'b1;
				ALU_src = 1'b1;
				ALU_Op = 2'b00;
				jump_out = 1'b0;
				branch_out = 1'b0;
			end
			//store word (SW)
			6'b101011: begin
				reg_dest = 1'b0;
				mem_read = 1'b0;
				mem_to_reg = 1'b0;
				mem_write = 1'b1;
				reg_write = 1'b0;
				ALU_src = 1'b1;
				ALU_Op = 2'b00;
				jump_out = 1'b0;
				branch_out = 1'b0;	
			end
			//should never reach the default case
			default: begin
				reg_dest = 1'b0;
				mem_read = 1'b0;
				mem_to_reg = 1'b0;
				mem_write = 1'b0;
				reg_write = 1'b0;
				ALU_src = 1'b0;
				ALU_Op = 2'b00;
				jump_out = 1'b0;
				branch_out = 1'b0;
			end
		endcase
	end
	
	assign WB_out = {reg_write, mem_to_reg};
	assign MEM_out = {mem_read, mem_write};
	assign EX_out = {reg_dest, ALU_Op, ALU_src};
endmodule
