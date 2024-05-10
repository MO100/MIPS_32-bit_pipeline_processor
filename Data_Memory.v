module Data_Memory(data_out, data_in, address_in, write_in, clk);
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
endmodule
