`timescale 1ns/1ns

module PCReg_tb;

  // Signals
  reg clk, rst, write_in;
  reg [31:0] PC_in;
  wire [31:0] PC_out;

  // Instantiate PCReg module
  PCReg dut (
    .PC_out(PC_out),
    .PC_in(PC_in),
    .clk(clk),
    .rst(rst),
    .write_in(write_in)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Testbench stimulus
  initial begin
    // Initialize inputs
    clk = 0;
    rst = 0;
    write_in = 0;
    PC_in = 0;

    // Apply reset
    #10 rst = 1;

    // Provide some inputs
    #20 PC_in = 32'h100;
    #30 write_in = 1;
    #40 write_in = 0;

    // Wait for a few cycles
    #50;

    // Apply reset again
    rst = 1;
    #10 rst = 0;

    // Provide some more inputs
    #20 PC_in = 32'h200;
    #30 write_in = 1;
    #40 write_in = 0;

    // Wait for a few cycles
    #50;

    // End simulation
    $finish;
  end

endmodule

