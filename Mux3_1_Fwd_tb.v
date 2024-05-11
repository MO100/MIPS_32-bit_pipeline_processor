module Mux3_1_Fwd_tb();

reg [31:0] Register_Data_in, EX_MEM_result_in, MEM_WB_result_in;
reg [1:0] Forward_signal_in;
wire [31:0] Mux3_1_Fwd_out;

// Instantiate the module
Mux3_1_Fwd forwardMuxA (
    .Mux3_1_Fwd_out(Mux3_1_Fwd_out),
    .Register_Data_in(Register_Data_in),
    .EX_MEM_result_in(EX_MEM_result_in),
    .MEM_WB_result_in(MEM_WB_result_in),
    .Forward_signal_in(Forward_signal_in)
);

// Stimulus
initial begin
    // Test case 1: Forward from Register_Data_in
    Register_Data_in = 32'b1;
    EX_MEM_result_in = 32'b10;
    MEM_WB_result_in = 32'b11;
    Forward_signal_in = 2'b00;
    #10;
    
    // Test case 2: Forward from MEM_WB_result_in
    Register_Data_in = 32'b1;
    EX_MEM_result_in = 32'b10;
    MEM_WB_result_in = 32'b11;
    Forward_signal_in = 2'b01;
    #10;

    // Test case 3: Forward from EX_MEM_result_in
    Register_Data_in = 32'b1;
    EX_MEM_result_in = 32'b10;
    MEM_WB_result_in = 32'b11;
    Forward_signal_in = 2'b10;
    #10;
    
    // Add more test cases as needed
end

endmodule

