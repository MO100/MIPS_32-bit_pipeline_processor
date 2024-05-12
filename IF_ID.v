module IF_ID(clk, enable,flush_jump, flush_branch, reset_in, Rs_Hazard_out, Rt_Hazard_out, Read_Reg_1_out, Read_Reg_2_out, IF_ID_Rs_out, IF_ID_Rt_out, IF_ID_Rd_out, Op_code_out, PC_Counter_out, Jump_Offset_out, sign_extend_input_out, PC_Counter_output_in, Instruction_memory_in);
  parameter n = 32;
  output reg [4:0] Rs_Hazard_out, Rt_Hazard_out, Read_Reg_1_out, Read_Reg_2_out, IF_ID_Rs_out, IF_ID_Rt_out, IF_ID_Rd_out;
  output reg [5:0] Op_code_out;
  output reg [n-1:0] PC_Counter_out;
  output reg [25:0] Jump_Offset_out;
  output reg[15:0] sign_extend_input_out;
  
  input [n-1:0] PC_Counter_output_in, Instruction_memory_in;
  input clk, reset_in, enable, flush_jump, flush_branch;
  
  reg [n-1:0] PC_Counter_internal, Instruction_memory_internal;
  //This file is where we need a LOT OF REDOING in terms of assigning outputs because I think this only takes in account for R-type and I-type, not jumping or branching. BECAREFUL
  always@(posedge clk) begin
    if (reset_in) begin
		{Instruction_memory_internal, PC_Counter_internal} <= 64'b0; end
    else if (flush_jump||flush_branch) begin 
		{Instruction_memory_internal, PC_Counter_internal} <= {32'b0, PC_Counter_output_in}; end
	else if (enable) begin 	//enable AKA write_in
		Op_code_out <= Instruction_memory_in[31:26];
		
		Instruction_memory_internal[25:0] <= Instruction_memory_in[25:0];
		Instruction_memory_internal[15:0] <= Instruction_memory_in[15:0]; //not sure if this is right
		
		PC_Counter_internal <= PC_Counter_output_in;
		Instruction_memory_internal[25:21] <= Instruction_memory_in[25:21]; 
		Instruction_memory_internal[20:16] <= Instruction_memory_in[20:16]; 
		Instruction_memory_internal[25:21] <= Instruction_memory_in[25:21]; 
		Instruction_memory_internal[20:16] <= Instruction_memory_in[20:16]; 
		Instruction_memory_internal[15:11] <= Instruction_memory_in[15:11];
	else
		
	end 
    
	Op_code_out <= Instruction_memory_internal[31:26]; //opcode instruction
	
	Jump_Offset_out <= Instruction_memory_internal[25:0]; // j-type
	sign_extend_input_out <= Instruction_memory_internal[15:0]; //not sure if this is right but this is for immediate values
	
	PC_Counter_out <= PC_Counter_internal;
	Read_Reg_1_out <= Instruction_memory_internal[25:21]; //RS value
	Read_Reg_2_out <= Instruction_memory_internal[20:16];  //RT register
	IF_ID_Rs_out <= Instruction_memory_internal[25:21]; //RS value passese to next stage
	IF_ID_Rt_out <= Instruction_memory_internal[20:16]; //RT value passese to next stage
	IF_ID_Rd_out <= Instruction_memory_internal[15:11]; // RD value passed to next stage
  end
    
endmodule
