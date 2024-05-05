module Shift_Left_Two(data_out, data_in);
	parameter n = 32;
	output reg [n-1:0] data_out;
	input [n-1:0] data_in;
	
	always@(*)begin
		assign data_out = data_in << 2;
	end
endmodule 
	
	