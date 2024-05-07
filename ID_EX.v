module ID_EX(clk, RegWrite_out, MemtoReg_out, MemRead_out, MemWrite_out, RegDst_out, ALU_Op_out, ALU_Src_out, Read_Data_1_out, Read_Data_2_out, sign_extend_out, ID_EX_Rs_Forward_out, ID_EX_Rt_Forward_out, ID_EX_Rs_MUX_out, ID_EX_Rt_MUX_out, reset_in, RegWrite_in, MemtoReg_in, MemRead_in, MemWrite_in, RegDst_in, ALU_Op_in, ALU_Src_in, Read_Data_1_in, Read_Data_2_in, sign_extend_in, IF_ID_Rs_in, IF_ID_Rt_in, ID_Rd_in);
parameter n = 32;
output reg RegWrite_out, MemtoReg_out, MemRead_out, MemWrite_out, RegDst_out, ALU_Op_out, ALU_Src_out;
output reg [n-1:0] Read_Data_1_out, Read_Data_2_out, sign_extend_out;
//Output Rt and Rs MUX are going to a MUX that will select the next pipelines(EX_MEM) Rd based on what type of operation is in opcode!
output reg [4:0] ID_EX_Rs_Forward_out, ID_EX_Rt_Forward_out, ID_EX_Rs_MUX_out, ID_EX_Rt_MUX_out; 
input clk, reset_in, RegWrite_in, MemtoReg_in, MemRead_in, MemWrite_in, RegDst_in, ALU_Op_in, ALU_Src_in;
input [n-1:0] Read_Data_1_in, Read_Data_2_in, sign_extend_in;
input [4:0] IF_ID_Rs_in, IF_ID_Rt_in, ID_Rd_in;


always @(posedge clk)begin
  //if(reset_in == 1) begin
  //14 outputs, 7 (1 bit) control signals, 3 32bit data signals, and 4 5bit outputs that are addresses of our rt and rs being passed to mux and forwarding unit for comparison
  RegWrite_out <= RegWrite_in;
  MemtoReg_out <= MemtoReg_in;
  MemRead_out <= MemRead_in;
  MemWrite_out <= MemWrite_in;
  RegDst_out <= RegDst_in;
  ALU_Op_out <= ALU_Op_in;
  ALU_Src_out <= ALU_Src_in;
  
  Read_Data_1_out <= Read_Data_1_in;
  Read_Data_2_out <= Read_Data_2_in;
  sign_extend_out <= sign_extend_in;
  
  ID_EX_Rs_Forward_out <= IF_ID_Rs_in;
  ID_EX_Rt_Forward_out <= IF_ID_Rt_in;
  ID_EX_Rs_MUX_out <= IF_ID_Rs_in;
  ID_EX_Rt_MUX_out <= IF_ID_Rt_in;
end 
endmodule 