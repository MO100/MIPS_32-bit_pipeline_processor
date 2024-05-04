module Mux2_1(input[31:0] A_in, B_in, input[1:0] select, output reg [31:0] data_out);
always @(*)begin
    data_out <= select ? A_in : B_in;
  end
endmodule
