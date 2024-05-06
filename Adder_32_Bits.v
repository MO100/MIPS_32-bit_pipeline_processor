module Adder_32_Bits(total_out, A_in, B_in);
	parameter n = 32;
	output [n-1:0] total_out;
	input [n-1:0] A_in, B_in;
	
	assign total_out = A_in + B_in;
endmodule