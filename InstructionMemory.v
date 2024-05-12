module InstructionMemory (data_out, address_in, clk);
  parameter MEM_SIZE = 256;
  output reg [31:0] data_out;
  input [31:0] address_in;
  input clk;

  reg [31:0] Internal_mem [0:MEM_SIZE-1];

  always @(posedge clk) begin
    data_out <= Internal_mem[address_in];
  end
endmodule
