`timescale 1ns/1ps

module Instruct_Mem_tb;

  // Parameters
  parameter MEM_SIZE = 256;
  
  // Signals
  reg clk;
  reg [31:0] address_in;
  wire [31:0] data_out;
  
  // Instantiate InstructionMemory module
  InstructionMemory #(MEM_SIZE) dut (
    .data_out(data_out),
    .address_in(address_in),
    .clk(clk)
  );

  // Clock generation
  always #5 clk = ~clk;

  integer i;

  // Testbench stimulus
  initial begin
    clk = 0;
    address_in = 0;
    
    for (i = 0; i < MEM_SIZE; i = i + 1) begin
      dut.Internal_mem[i] = i * 2; // Sample data (arbitrary)
    end

    // Read data from memory for a range of addresses
    for (i = 0; i < 10; i = i + 1) begin
      #10; // Wait a few cycles
      address_in = i;
      #10; // Wait a few cycles
      $display("Address: %d, Data: %d", address_in, data_out);
    end
    
    // End simulation after test
    $finish;
  end
endmodule

