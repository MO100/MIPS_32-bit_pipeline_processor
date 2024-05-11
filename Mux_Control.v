module Mux_Control(Reg_Write_out, Mem_To_Reg_Out, Mem_Read_Out, Mem_Write_Out, Reg_Dst_out, Alu_OP_Out, Alu_Src_Out, WriteBack_In, Memory_In, Execution_In, Hazard_In);

		input [1:0] WriteBack_In, Memory_In;
		input [3:0] Execution_In;
		input Hazard_In;
		output reg Reg_Dst_out, Mem_Write_Out, Mem_Read_Out, Reg_Write_out, Alu_Src_Out, Mem_To_Reg_Out;
		output reg [1:0] Alu_OP_Out;
	always @(*) begin
		if (Hazard_In)
			{Reg_Write_out, Mem_To_Reg_Out, Mem_Read_Out, Mem_Write_Out, Reg_Dst_out, Alu_OP_Out, Alu_Src_Out} <= {WriteBack_In, Memory_In, Execution_In};
		else
			{Reg_Write_out, Mem_To_Reg_Out, Mem_Read_Out, Mem_Write_Out, Reg_Dst_out, Alu_OP_Out, Alu_Src_Out} <= 8'b0;
	end
endmodule 