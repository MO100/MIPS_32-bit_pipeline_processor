module Shift_Concatinate(Data_Out, Jump_Offset_in, PC_Counter_Output_in);
	input [25:0]Jump_Offset_in;
	input [31:0]PC_Counter_Output_in;
	output reg [31:0]Data_Out;
	
	reg [25:0]shift_left;
	// Concatenation
    always @(*) begin
		shift_left <=  Jump_Offset_in << 2;
		Data_Out <= {shift_left, PC_Counter_Output_in[31:25]};
	end
endmodule