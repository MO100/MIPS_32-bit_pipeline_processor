module Comparator(output_bit, A_in, B_in);
  input [31:0] A_in, B_in;
  output reg output_bit;
  
 always @(*) begin
    if (A_in == B_in) begin
        output_bit = 1'b1;
    end
    else begin
        output_bit = 1'b0;
    end
end

endmodule
