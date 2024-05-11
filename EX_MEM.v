module EX_MEM(EX_MEM_Next_Pipeline_out, EX_MEM_Forwarding_out, RegWrite_out, MemtoReg_out, MemRead_out, MemWrite_out, ALU_Result_out, RT_data_out, RegWrite_in, MemtoReg_in, MemRead_in, MemWrite_in, RT_data_in, ALU_Result_in, ID_EX_MUX_in, reset_in, clk);
	parameter n = 32;

	output reg RegWrite_out, MemtoReg_out, MemRead_out, MemWrite_out;
	output reg [n-1:0] ALU_Result_out, RT_data_out;
	output reg [4:0] EX_MEM_Forwarding_out, EX_MEM_Next_Pipeline_out;
	input clk, reset_in, RegWrite_in, MemtoReg_in, MemRead_in, MemWrite_in;
	input [n-1:0] RT_data_in, ALU_Result_in;
	input [4:0] ID_EX_MUX_in; //***NEED***

	always @(posedge clk) begin
	  if (reset_in) begin
		{RegWrite_out, MemtoReg_out, MemRead_out, MemWrite_out} = {4{1'b0}};
		{ALU_Result_out, RT_data_out} = {n{1'b0}};
	  end
	  else begin
		RegWrite_out <= RegWrite_in;
		MemtoReg_out <= MemtoReg_in;
		MemRead_out <= MemRead_in;
		MemWrite_out <= MemWrite_in;
		ALU_Result_out <= ALU_Result_in;
		RT_data_out <= RT_data_in;
		EX_MEM_Forwarding_out <= ID_EX_MUX_in;
		EX_MEM_Next_Pipeline_out <= ID_EX_MUX_in;
		end
	end
endmodule

/*
module EX_MEM(clk, RegWrite_out, MemtoReg_out, MemRead_out, MemWrite_out, ALU_Result_out, RT_data_out, RegWrite_in, MemtoReg_in, MemRead_in, MemWrite_in, RT_data_in, ALU_Result_in);
parameter n = 32;

output reg RegWrite_out, MemtoReg_out, MemRead_out, MemWrite_out;
output reg [n-1:0] ALU_Result_out, RT_data_out;
input clk, RegWrite_in, MemtoReg_in, MemRead_in, MemWrite_in;
input [n-1:0] RT_data_in, ALU_Result_in;
//input [4:0] ID_EX_MUX_in; //***NEED***

always @(posedge clk) begin
//if (reset_in == 1'b1) begin

//end 
	//else begin 
	RegWrite_out <= RegWrite_in;
	MemtoReg_out <= MemtoReg_in;
	MemRead_out <= MemRead_in;
	MemWrite_out <= MemWrite_in;
	ALU_Result_out <= ALU_Result_in;
	RT_data_out <= RT_data_in;
	// EX_MEM_Rd_out = ID_EX_MUX_in;
	end  
endmodule
*/
