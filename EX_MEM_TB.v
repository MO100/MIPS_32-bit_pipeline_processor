module EX_MEM_tb();

  parameter n = 32;

  reg clk; // Clock input
  reg RegWrite_in, MemtoReg_in, MemRead_in, MemWrite_in; // Inputs
  reg [n-1:0] RT_data_in, ALU_Result_in; // Inputs
  wire RegWrite_out, MemtoReg_out, MemRead_out, MemWrite_out; // Outputs
  wire [n-1:0] ALU_Result_out, RT_data_out; // Outputs
  //wire [4:0] ID_EX_MUX_in; //***NEED***
  
  // Instantiate the EX_MEM module
  EX_MEM EXMEMREG (
        .EX_MEM_Next_Pipeline_out(W98_EX_Mem_Next_Pipeline),
        .EX_MEM_Forwarding_out(L9_EX_Mem__Forwarding),
        .RegWrite_out(L5_Reg_Write),
        .MemtoReg_out(L6_Mem_To_Reg),
        .MemRead_out(L1_Mem_Read),
        .MemWrite_out(L2_Mem_Write),
        .ALU_Result_out(L3_ALU_Result),
        .RT_data_out(L17_RT_32_Input),
        .RegWrite_in(A1_Reg_Write),
        .MemtoReg_in(A2_Mem_To_Reg),
        .MemRead_in(A4_Mem_Read),
        .MemWrite_in(A5_Mem_Write),
        .RT_data_in(A17_Read_Data_2),
        .ALU_Result_in(A10_ALU_Result),
        .ID_EX_MUX_in(A2_ID_EX_MUX),
        .reset_in(reset), //has reset
        .clk(clk)

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Stimulus
  initial begin
    // Initialize inputs
    RegWrite_in = 0;
    MemtoReg_in = 0;
    MemRead_in = 0;
    MemWrite_in = 0;
    RT_data_in = 32'b0011; // Sample data
    ALU_Result_in = 32'b1001; // Sample data

    // Provide some stimulus
    #10 RegWrite_in = 1;
    #10 MemtoReg_in = 1;
    #10 MemRead_in = 1;
    #10 MemWrite_in = 1;
    #20 RegWrite_in = 0;
    #20 MemtoReg_in = 0;
    #20 MemRead_in = 0;
    #20 MemWrite_in = 0;

    // Add more stimulus if needed

    // End simulation after some time
    #1000 $finish;
  end

  // Display outputs
  always @(posedge clk) begin
    $display("Time=%0t RegWrite_out=%b MemtoReg_out=%b MemRead_out=%b MemWrite_out=%b ALU_Result_out=%h RT_data_out=%h", $time, RegWrite_out, MemtoReg_out, MemRead_out, MemWrite_out, ALU_Result_out, RT_data_out);
  end

endmodule

