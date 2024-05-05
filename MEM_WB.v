module MEM_WB(clk, )
  parameter n = 32;
  input clk;
  input Reg_Write_in, Mem_to_Reg_in;
  input [4:0] 
  input [n-1] data_memory_output, 
  input [] ALU_Output;
  output reg [n-1:0] data_memory_to_mux, ALU_Output_to_MUX;
  
  assign 
endmodule
