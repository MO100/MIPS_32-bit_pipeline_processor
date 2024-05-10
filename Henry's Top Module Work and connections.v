module MIPS32_ID_EX();

wire clk, reset;

wire [4:0] A7_ID_EX_RS, A8_ID_EX_RT, A18_ID_EX_RT_MUX, A19_ID_EX_RD_MUX, A21_Mux_Out;

wire [2:0] A6_ALU_OP;

wire [31:0] A11_Sign_Extend, A12_Read_Data_1, A_15_Mux_Out, A_16_Mux_Out, A17_Read_Data_2, L3_ALU_Result, L12_Write_Data, W44_Mux_Out;

wire A1_Reg_Write_Output, A2_Mem_to_Reg, A4_Mem_Read, A5_Mem_Write, A20_Reg_Dst, W49_ALU_Src;

Mux3_1_Fwd Forward_A (
	.A_in(A12_Read_Data_1), 
	.B_in(L12_Write_Data), 
	.C_in(L3_ALU_Result),
	.data_out(A_15_Mux_Out)
);

Mux3_1_Fwd Forward_B (
	.A_in(A17_Read_Data_2), 
	.B_in(L12_Write_Data), 
	.C_in(L3_ALU_Result),
	.data_out(A_16_Mux_Out)
);

Mux2_1 Reg_Dst (
	.A_in(A18_ID_EX_RT_MUX), 
	.B_in(A19_ID_EX_RD_MUX),
	.data_out(A21_Mux_Out),
	.select(A20_Reg_Dst)	
);

Mux2_1 ALU_Src (
	.A_in(A_16_Mux_Out), 
	.B_in(A11_Sign_Extend),
	.data_out(W44_Mux_Out),
	.select(W49_ALU_Src)	
);

endmodule

