module Data_Memory #(parameter DATA_MEMORY_FILE = "")(data_out, address_in, write_data_in, mem_write_in, mem_read, reset, clk);
	parameter n = 32;
	input mem_write_in, mem_read, reset, clk;
	input [n-1:0] address_in, write_data_in;
	output reg [n-1:0] data_out;
	
	reg [7:0] RAM [0:1023];
	integer i;
	
	always @ (posedge clk) begin
		if (reset)
			for (i = 0; i < 1023; i = i + 1) begin
				RAM[i] <= 0;
			end
		else if (mem_write_in)
			{RAM[address_in],
			RAM[address_in + 1],
			RAM[address_in + 2],
			RAM[address_in + 3]} <= write_data_in;
		else if(mem_read)
			assign data_out = 
			{RAM[address_in],
			RAM[address_in + 1],
			RAM[address_in + 2],
			RAM[address_in + 3]};
	end
	
	initial if (DATA_MEMORY_FILE) begin
		$readmemh(DATA_MEMORY_FILE, RAM);
    end
endmodule
