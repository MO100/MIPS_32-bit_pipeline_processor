module Mux3_1_Fwd(Mux3_1_Fwd_out, Register_Data_in, EX_MEM_result_in, MEM_WB_result_in, Forward_signal_in);
output reg [31:0] Mux3_1_Fwd_out;
//Three inputs based on what type of hazard and where we need to forward from either EX/MEM (R type hazard) or MEM/WB (LW/SW Hazard) or no hazard at all (Register_data_in)
input [31:0] Register_Data_in, EX_MEM_result_in, MEM_WB_result_in;
input [1:0] Forward_signal_in;

always@(*) begin
//Made the case statements here
  case(Forward_signal_in)
    2'b00: Mux3_1_Fwd_out <= Register_Data_in;
    2'b01: Mux3_1_Fwd_out <= MEM_WB_result_in;
    2'b10: Mux3_1_Fwd_out <= EX_MEM_result_in;
  default: Mux3_1_Fwd_out <= 32'b10101010; //for testing error 
endcase
end 

endmodule
