`timescale 1ns / 1ps

module TB_IF_ID;

  // Signals
  reg clk;
  reg enable, flush_jump, flush_branch, reset_in;
  reg [31:0] Instruction_memory_in;
  reg [31:0] PC_Counter_output_in;

  wire [4:0] Rs_Hazard_out, Rt_Hazard_out, Read_Reg_1_out, Read_Reg_2_out, IF_ID_Rs_out, IF_ID_Rt_out, IF_ID_Rd_out;
  wire [5:0] Op_code_out;
  wire [31:0] PC_Counter_out;
  wire [25:0] Jump_Offset_out;
  wire [15:0] sign_extend_input_out;

  // Instantiate the module
  IF_ID UUT (
    .clk(clk),
    .enable(enable),
    .flush_jump(flush_jump),
    .flush_branch(flush_branch),
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
  always begin
    #5 clk = ~clk;
  end

  // Test stimulus
  initial begin
    // Initialize inputs
    clk = 0;
    reset_in = 0;
    enable = 0;
    flush_jump = 0;
    flush_branch = 0;
    Instruction_memory_in = 32'h01234567;
    PC_Counter_output_in = 32'h00000000;

    // Wait for a few clock cycles
    #10;

    // Deassert reset
    reset_in = 0;

    // Enable module
    enable = 0;

    // Provide some inputs
    Instruction_memory_in = 32'b00100010011010100000000000000100; //ddi $t2, $s3, 4 - itype
    PC_Counter_output_in = 32'h00000004;

    // Wait for a few clock cycles
    #10;
    Instruction_memory_in = 32'b00001000000000000000000100000001; //j LOOP (or j 1028) -- j-type
    #10;
    Instruction_memory_in = 32'b00000010001100101000000000100000; //add $s0, $s1, $s2 --r-type
    $finish;
  end

  // Add assertion checks here if needed

endmodule

