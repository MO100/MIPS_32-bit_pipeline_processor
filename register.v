module register(clk, reset_in, reg_write_bit_in, read_reg1_in, read_reg2_in, write_reg_in, write_data_in, rdata1_out, rdata2_out);
parameter n = 32;

input clk, reset_in;
input reg_write_bit_in;
input [4:0] read_reg1_in ,read_reg2_in ,write_reg_in; // 5 bits
input [n-1:0] write_data_in; // n bits
output reg [n-1:0] rdata1_out,rdata2_out; //n bits


reg [n-1:0] stack [n-1:0]; // Creating a Stack like memory of 32 bit address 32 times 

wire [n-1: 0] rdata1_wire, rdata2_wire;
///always at rising edge of clock for writing into memory
integer i;

//writing
always @(posedge clk) begin
	if(reset_in) begin
		for(i=0; i < n; i = i + 1) begin
			stack[i] <= 32'h0;
		end
	end
	else if (reg_write_bit_in) //if reg_write_bit_in = 1 then we can write into our write_reg_in
		stack[write_reg_in] = write_data_in; // Writing into memory (stack) at write register address with write data calculated
end
//reading
always @(negedge clk) begin
	if(!reg_write_bit_in) begin
		rdata1_out<=stack[read_reg1_in]; //data of reg 1 is equal to the 
		rdata2_out<=stack[read_reg2_in]; //data of reg 2 is equal to
		
	end
end
endmodule
