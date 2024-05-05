
module MEM_WB_tb();

parameter n = 32;

reg Reg_Write_in, MemtoReg_in, clk;
reg [n-1:0] data_memory_output_in, ALU_Output_in; 
reg [4:0] EX_MEM_Rd_in;
wire [4:0] MEM_WB_Rd_out; 
wire Reg_Write_out, MemtoReg_out;
wire [n-1:0] data_memory_output_out, ALU_Output_to_MUX_out;

MEM_WB dut (
    .MEM_WB_Rd_out(MEM_WB_Rd_out),
    .Reg_Write_out(Reg_Write_out),
    .MemtoReg_out(MemtoReg_out),
    .data_memory_output_out(data_memory_output_out),
    .ALU_Output_to_MUX_out(ALU_Output_to_MUX_out),
    .Reg_Write_in(Reg_Write_in),
    .MemtoReg_in(MemtoReg_in),
    .clk(clk),
    .data_memory_output_in(data_memory_output_in),
    .ALU_Output_in(ALU_Output_in),
    .EX_MEM_Rd_in(EX_MEM_Rd_in)
);

initial begin
    // Initialize inputs
    clk = 0;
    Reg_Write_in = 1'b1;
    MemtoReg_in = 1'b1;
    data_memory_output_in = 4'b0111;
    ALU_Output_in = 0;
    EX_MEM_Rd_in = 0;

    // Apply stimulus
    #5 clk = 1;
    #5 clk = 0;

    // Add more stimulus here if needed
end

always #1 clk = ~clk; // Toggle clock every time unit

initial begin
    // Monitor outputs
    $monitor("Time=%0t Reg_Write_out=%b MemtoReg_out=%b MEM_WB_Rd_out=%b data_memory_output_out=%h ALU_Output_to_MUX_out=%h", $time, Reg_Write_out, MemtoReg_out, MEM_WB_Rd_out, data_memory_output_out, ALU_Output_to_MUX_out);
end

endmodule
