module Mux3_1_Fwd(input[31:0] A_in, B_in, C_in, input[2:0] select, output reg [31:0] data_out);
always @(*)begin
    case(select)
	3'b000: data_out = A_in;
	3'b001: data_out = B_in;
	3'b010: data_out = C_in;
	default: data_out = 5'b00000;
     endcase
  end
endmodule