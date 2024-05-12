module Mux2_1(A_in, B_in, select, data_out);
input[31:0] A_in, B_in;
input select;
output reg [31:0] data_out;
always @(*)begin    
data_out <= select ? B_in : A_in; //if select = 1, then data_out = B_in, else vice versa
  end
endmodule
