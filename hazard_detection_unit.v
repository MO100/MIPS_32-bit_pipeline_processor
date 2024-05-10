module hazard_detection_unit(
	output reg flush_out, PCWrite_out, IF_ID_write_out, MUX_nop_out,
	input [4:0] ID_EX_reg_target_in, IF_ID_reg_target_in, IF_ID_reg_source_in, EX_MEM_reg_target_in,
	input EX_MEM_WB_in, ID_EX_mem_read_in, branch_in, jump_in, EX_MEM_mem_read_in, comparator_in);


	always @(*) begin
		//ID_EX loading hazard detection
		if(ID_EX_mem_read_in) begin // if instruction in EX stage is a load
			 // if the target in EX stage == decode in ID stage or if the target in EX stage == target in ID stage
			if( (ID_EX_reg_target_in == IF_ID_reg_target_in) || (ID_EX_reg_target_in == IF_ID_reg_source_in) ) begin 
				PCWrite_out <= 1'b0;
				IF_ID_write_out <= 1'b0;
				MUX_nop_out <= 1'b1;
				flush_out <= 1'b0;
			end
		end
		//EX_MEM loading hazard detection
		else if(EX_MEM_WB_in) begin // checks if memory is written onto
			if((EX_MEM_reg_target_in == IF_ID_reg_target_in) || (EX_MEM_reg_target_in == IF_ID_reg_source_in)) begin
				PCWrite_out <= 1'b0;
				IF_ID_write_out <= 1'b0;
				MUX_nop_out <= 1'b1;
				flush_out <= 1'b0;
			end
		end
		
		else if(branch_in) // checks if the intruction is a branch
			// if the target in EX stage == decode in ID stage or if the target in EX stage == target in ID stage as well as a branch instruction
			if(ID_EX_mem_read_in) begin // if instruction in EX stage is a load
				// if the target in EX stage == decode in ID stage or if the target in EX stage == target in ID stage
				if( (ID_EX_reg_target_in == IF_ID_reg_target_in) || (ID_EX_reg_target_in == IF_ID_reg_source_in) ) begin 
					PCWrite_out <= 1'b0;
					IF_ID_write_out <= 1'b0;
					MUX_nop_out <= 1'b1;
					flush_out <= 1'b0;
				end
			end
			else if(EX_MEM_mem_read_in) begin // if instruction in MEM stage is a load and its the second instr before branch_in
				if((EX_MEM_reg_target_in == IF_ID_reg_target_in) || EX_MEM_reg_target_in == IF_ID_reg_source_in) begin
					PCWrite_out <= 1'b0;
					IF_ID_write_out <= 1'b0;
					MUX_nop_out <= 1'b1;
					flush_out <= 1'b0;
				end
			end
			else if(comparator_in) begin // if comparator == 1 then we branch and flush previous instructions
				PCWrite_out <= 1'b1;
				IF_ID_write_out <= 1'b1;
				MUX_nop_out <= 1'b0;
				flush_out <= 1'b1;
			end
		
		else if(jump_in) begin // if jump == 1 then we branch and flush previous instructions
			PCWrite_out <= 1'b1;
			IF_ID_write_out <= 1'b1;
			MUX_nop_out <= 1'b0;
			flush_out <= 1'b1;
		end
		else begin // default case
			PCWrite_out <= 1'b1;
			IF_ID_write_out <= 1'b1;
			MUX_nop_out <= 1'b0;
			flush_out <= 1'b0;
		end
	end
endmodule
