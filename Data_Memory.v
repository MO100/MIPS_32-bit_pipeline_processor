module Data_Memory(data_out, address_in, write_data_in, mem_write_in, mem_read, reset, clk);
	parameter n = 32;
	input mem_write_in, mem_read, reset, clk;
	input [n-1:0] address_in, write_data_in;
	output reg [n-1:0] data_out;
	
	reg [7:0] memory_internal [0:1023];
	wire [n-1:0] base_address;
	wire cleared_bits = address_in & 32'b11111111111111111111101111111111;
	integer i;
	
	always @ (posedge clk) begin
		if (reset)
			for (i = 0; i < 1023; i = i + 1)
				memory_internal[i] <= 0;
		else if (mem_write_in)
				{memory_internal[base_address], memory_internal[base_address + 1], memory_internal[base_address + 2], memory_internal[base_address + 3]} <= write_data_in;
	end
	
	// Shifting right to align to 4-byte boundary
	wire shifted_right = cleared_bits >> 2;
	// Shifting left to set the two least significant bits to 0
	assign base_address = shifted_right << 2;
	always @ (*)begin
		if (address_in < 1024) begin
			assign data_out = 0;
		end
		else begin
			assign data_out = {memory_internal[base_address], memory_internal[base_address + 1], memory_internal[base_address + 2], memory_internal[base_address + 3]};
		end
	end

endmodule
/*module Data_Memory(data_out, data_in, address_in, write_in, clk);
  output [31:0] data_out;
  input [31:0] data_in, address_in;
  input write_in, clk;

  reg [7:0] Memory_internal [0:1023];

  integer i;

  // Initialize memory with zeros
  initial begin
    for (i = 0; i < 1023; i = i + 1) begin
      Memory_internal[i] = 32'h00000000;
    end
  end

  always @(posedge clk) begin
    if (write_in == 1'b1) begin
      Memory_internal[address_in] <= data_in;
    end
  end

  assign data_out = Memory_internal[address_in];
//data_out will be a concatination of four bites
    data_out = {}
endmodule*/
