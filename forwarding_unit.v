module forwarding_unit(
	output reg [1:0] Forward_A_out, Forward_B_out, 
	input [4:0] ID_EX_RS_in, ID_EX_RT_in, EX_MEM_reg_destination_in, MEM_WB_reg_destination_in, 
	input EX_MEM_WB_in, MEM_WB_WB_in);

  always @(*) begin
    case({EX_MEM_WB_in,MEM_WB_WB_in}) //Makes sure both instruction are writing to memory
      2'b00: begin 
        Forward_A_out <= 2'b00;
        Forward_B_out <= 2'b00;
      end
      2'b01: begin
        if( (MEM_WB_reg_destination_in != 0) && (MEM_WB_reg_destination_in == ID_EX_RS_in) )
          Forward_A_out <= 2'b01;
        else
          Forward_A_out <= 2'b00;
        if( (MEM_WB_reg_destination_in != 0) && (MEM_WB_reg_destination_in == ID_EX_RT_in) ) 
          Forward_B_out <= 2'b01;
        else
          Forward_B_out <= 2'b00;
      end
      2'b10: begin 
        if( (EX_MEM_reg_destination_in != 0) && (EX_MEM_reg_destination_in == ID_EX_RS_in) )
          Forward_A_out <= 2'b10;
        else
          Forward_A_out <= 2'b00;
        if( (EX_MEM_reg_destination_in != 0) && (EX_MEM_reg_destination_in == ID_EX_RT_in) )
          Forward_B_out <= 2'b10;
        else
          Forward_B_out <= 2'b00;
      end
      2'b11: begin 
        if( (EX_MEM_reg_destination_in != 0) && (EX_MEM_reg_destination_in == ID_EX_RS_in) )
          Forward_A_out <= 2'b10;
        else if ((MEM_WB_reg_destination_in != 0) && (MEM_WB_reg_destination_in == ID_EX_RS_in ) )
          Forward_A_out <= 2'b01;
        else
          Forward_A_out <= 2'b00;
        if( (EX_MEM_reg_destination_in != 0) && (EX_MEM_reg_destination_in == ID_EX_RT_in) ) 
          Forward_B_out <= 2'b10;
        else if( (MEM_WB_reg_destination_in != 0) && (MEM_WB_reg_destination_in == ID_EX_RT_in) )
          Forward_B_out <= 2'b01;
        else
          Forward_B_out <= 2'b00;
      end
      default: begin
        Forward_A_out <= 2'b00;
        Forward_B_out <= 2'b00;
      end
    endcase
  end    
endmodule

