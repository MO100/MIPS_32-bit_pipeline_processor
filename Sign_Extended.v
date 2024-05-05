module Sign_Extended(data_out, sign_extend_in);
	parameter n = 32;
	output reg [n-1:0] data_out;
	input [15:0] sign_extend_in;
	
	always @(*) begin
		if(sign_extend_in[15] == 1'b0) begin
			data_out = { {16{1'b0}}, sign_extend_in};
		end
		else begin
			data_out = { {16{1'b1}}, sign_extend_in};
		end
	end
endmodule