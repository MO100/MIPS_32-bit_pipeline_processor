`timescale 1ns / 1ps

module IF_ID_tb;
  // Parameters
  parameter n = 32;

  // Inputs
  reg clk;
  reg enable;
  reg reset_in;
  reg [n-1:0] PC_Counter_output_in;
  reg [n-1:0] Instruction_memory_in;

  // Outputs
  wire [4:0] Rs_Hazard_out, Rt_Hazard_out, Read_Reg_1_out, Read_Reg_2_out, IF_ID_Rs_out, IF_ID_Rt_out, IF_ID_Rd_out;
  wire [5:0] Op_code_out;
  wire [n-1:0] PC_Counter_out;
  wire [25:0] Jump_Offset_out;
  wire [15:0] sign_extend_input_out;

  // Instantiate the module
  IF_ID uut (
    .clk(clk),
    .enable(enable),
    .reset_in(reset_in),
    .Rs_Hazard_out(Rs_Hazard_out),
    .Rt_Hazard_out(Rt_Hazard_out),
    .Read_Reg_1_out(Read_Reg_1_out),
    .Read_Reg_2_out(Read_Reg_2_out),
    .IF_ID_Rs_out(IF_ID_Rs_out),
    .IF_ID_Rt_out(IF_ID_Rt_out),
    .IF_ID_Rd_out(IF_ID_Rd_out),
    .Op_code_out(Op_code_out),
    .PC_Counter_out(PC_Counter_out),
    .Jump_Offset_out(Jump_Offset_out),
    .sign_extend_input_out(sign_extend_input_out),
    .PC_Counter_output_in(PC_Counter_output_in),
    .Instruction_memory_in(Instruction_memory_in)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Initial values
  initial begin
    clk = 0;
    enable = 1;
    reset_in = 1;
    PC_Counter_output_in = 32'h0000_0000;
    Instruction_memory_in = 32'h0000_0000;

    // Wait a few clock cycles after reset for stability
    #10;
    reset_in = 0;
    // Start generating clock
    #10;
    repeat(20) begin
      #10;
    end;
    // Stop simulation after some time
    #10;
    $finish;
  end

  // Add stimulus here if needed

endmodule
