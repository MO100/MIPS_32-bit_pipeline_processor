module MEM_WB(MEM_WB_Rd_out,MEM_WB_Forwarding, Reg_Write_out, MemtoReg_out, data_memory_output_out, ALU_Output_to_MUX_out, Reg_Write_in, MemtoReg_in, clk, data_memory_output_in, ALU_Output_in, EX_MEM_Rd_in,reset_in);
	parameter n = 32;

	input Reg_Write_in, MemtoReg_in, clk,reset_in;
	input [n-1:0] data_memory_output_in, ALU_Output_in; 
	input [4:0] EX_MEM_Rd_in;//address length of 5
	output reg [4:0] MEM_WB_Rd_out,MEM_WB_Forwarding; 
	output reg Reg_Write_out, MemtoReg_out;
	output reg [n-1:0] data_memory_output_out, ALU_Output_to_MUX_out;

	always@(posedge clk) begin
		if(reset_in)begin
			{Reg_Write_out, MemtoReg_out} <= 2'b00; //reset all signals and reset pipeline register
			MEM_WB_Rd_out <= {4{1'b0}};
			{data_memory_output_out, ALU_Output_to_MUX_out} <= {n{1'b0}};
		end
		else begin //assign inputs to outputs
			Reg_Write_out <= Reg_Write_in;
			MemtoReg_out  <= MemtoReg_in; //Control signal for the WB MUX
			data_memory_output_out <= data_memory_output_in;
			ALU_Output_to_MUX_out <= ALU_Output_in;
			MEM_WB_Rd_out <= EX_MEM_Rd_in;
			MEM_WB_Forwarding <= EX_MEM_Rd_in;
		end 
	end 
endmodule
/*module MEM_WB(MEM_WB_Rd_out, Reg_Write_out, MemtoReg_out, data_memory_output_out, ALU_Output_to_MUX_out, Reg_Write_in, MemtoReg_in, clk, data_memory_output_in, ALU_Output_in, EX_MEM_Rd_in);
parameter n = 32;

input Reg_Write_in, MemtoReg_in, clk;
input [n-1:0] data_memory_output_in, ALU_Output_in; 
input [4:0] EX_MEM_Rd_in;
output reg [4:0] MEM_WB_Rd_out; 
output reg Reg_Write_out, MemtoReg_out;
output reg [n-1:0] data_memory_output_out, ALU_Output_to_MUX_out;

always@(posedge clk) begin
	//if(reset_in == 1'b1)begin
		//state_internal <= 0; //reset all signals and reset pipeline register
	//end
	//else begin //assign inputs to outputs
	Reg_Write_out <= Reg_Write_in;
	MemtoReg_out  <= MemtoReg_in; //Control signal for the WB MUX
	data_memory_output_out <= data_memory_output_in;
	ALU_Output_to_MUX_out <= ALU_Output_in;
	MEM_WB_Rd_out <= EX_MEM_Rd_in;
	end 
endmodule*/
