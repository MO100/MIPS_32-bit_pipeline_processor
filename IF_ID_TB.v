module IF_ID_TB();

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg clk;
    reg reset_in;
    reg enable;
    reg [31:0] Instruction_memory_in;
    wire [4:0] Rs_Hazard_out;
    wire [4:0] Rt_Hazard_out;
    wire [4:0] Read_Reg_1_out;
    wire [4:0] Read_Reg_2_out;
    wire [4:0] IF_ID_Rs_out;
    wire [4:0] IF_ID_Rt_out;
    wire [4:0] IF_ID_Rd_out;
    wire [5:0] Op_code_out;
    wire [31:0] PC_Counter_out;
    wire [25:0] Jump_Offset_out;
    wire [15:0] sign_extend_input_out;

    // Instantiate the module to be tested
    IF_ID dut (
        .clk(clk),
        .reset_in(reset_in),
        .enable(enable),
        .Instruction_memory_in(Instruction_memory_in),
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
        .sign_extend_input_out(sign_extend_input_out)
    );

    // Clock generation
    always begin
        forever begin
          #100 clk = ~clk;
        end
    end


    // Stimulus generation
    initial begin
        clk = 1;
        //#50; // Wait for a while after reset
       // enable = 1; // Enable the module
        // Here you can provide different values for Instruction_memory_in
        // For example:
         Instruction_memory_in = 32'b10000010000100000000000000000000;
        // Instruction_memory_in = 32'h8765_4321;
        // Instruction_memory_in = 32'hABCDE_F000;
        // ...
        #100;
        // Add more stimulus or checks here as needed
        // For example:
        // assert (Op_code_out == 6'h12) else $error("Op_code_out assertion failed");
        // assert (Rs_Hazard_out == 5'b01010) else $error("Rs_Hazard_out assertion failed");
        // ...
        // Make sure to adjust the delay and provide the expected results for your specific test cases
        //$stop; // Stop simulation
    end

endmodule
