

module ID_EX_tb;

// Signals
reg clk;
reg RegWrite_in, MemtoReg_in, MemRead_in, MemWrite_in, RegDst_in, ALU_Src_in;
reg [1:0] ALU_Op_in;
reg [31:0] Read_Data_1_in, Read_Data_2_in, sign_extend_in;
reg [4:0] IF_ID_Rs_in, IF_ID_Rt_in, ID_Rd_in;
wire RegWrite_out, MemtoReg_out, MemRead_out, MemWrite_out, RegDst_out, ALU_Src_out;
wire [1:0] ALU_Op_out;
wire [31:0] Read_Data_1_out, Read_Data_2_out, sign_extend_out;
wire [4:0] ID_EX_Rs_Forward_out, ID_EX_Rt_Forward_out, ID_EX_Rs_MUX_out, ID_EX_Rt_MUX_out;

// Instantiate the module
ID_EX dut (
    .clk(clk),
    .RegWrite_out(RegWrite_out),
    .MemtoReg_out(MemtoReg_out),
    .MemRead_out(MemRead_out),
    .MemWrite_out(MemWrite_out),
    .RegDst_out(RegDst_out),
    .ALU_Op_out(ALU_Op_out),
    .ALU_Src_out(ALU_Src_out),
    .Read_Data_1_out(Read_Data_1_out),
    .Read_Data_2_out(Read_Data_2_out),
    .sign_extend_out(sign_extend_out),
    .ID_EX_Rs_Forward_out(ID_EX_Rs_Forward_out),
    .ID_EX_Rt_Forward_out(ID_EX_Rt_Forward_out),
    .ID_EX_Rs_MUX_out(ID_EX_Rs_MUX_out),
    .ID_EX_Rt_MUX_out(ID_EX_Rt_MUX_out),
    .RegWrite_in(RegWrite_in),
    .MemtoReg_in(MemtoReg_in),
    .MemRead_in(MemRead_in),
    .MemWrite_in(MemWrite_in),
    .RegDst_in(RegDst_in),
    .ALU_Op_in(ALU_Op_in),
    .ALU_Src_in(ALU_Src_in),
    .Read_Data_1_in(Read_Data_1_in),
    .Read_Data_2_in(Read_Data_2_in),
    .sign_extend_in(sign_extend_in),
    .IF_ID_Rs_in(IF_ID_Rs_in),
    .IF_ID_Rt_in(IF_ID_Rt_in),
    .ID_Rd_in(ID_Rd_in)
);

// Clock generation
always begin
  forever begin 
  #100 clk = ~clk;
end
end 

module ID_EX_tb;

// Signals
reg clk;
reg RegWrite_in, MemtoReg_in, MemRead_in, MemWrite_in, RegDst_in, ALU_Src_in;
reg [1:0] ALU_Op_in;
reg [31:0] Read_Data_1_in, Read_Data_2_in, sign_extend_in;
reg [4:0] IF_ID_Rs_in, IF_ID_Rt_in, ID_Rd_in;
wire RegWrite_out, MemtoReg_out, MemRead_out, MemWrite_out, RegDst_out, ALU_Src_out;
wire [1:0] ALU_Op_out;
wire [31:0] Read_Data_1_out, Read_Data_2_out, sign_extend_out;
wire [4:0] ID_EX_Rs_Forward_out, ID_EX_Rt_Forward_out, ID_EX_Rs_MUX_out, ID_EX_Rt_MUX_out;

// Instantiate the module
ID_EX dut (
    .clk(clk),
    .RegWrite_out(RegWrite_out),
    .MemtoReg_out(MemtoReg_out),
    .MemRead_out(MemRead_out),
    .MemWrite_out(MemWrite_out),
    .RegDst_out(RegDst_out),
    .ALU_Op_out(ALU_Op_out),
    .ALU_Src_out(ALU_Src_out),
    .Read_Data_1_out(Read_Data_1_out),
    .Read_Data_2_out(Read_Data_2_out),
    .sign_extend_out(sign_extend_out),
    .ID_EX_Rs_Forward_out(ID_EX_Rs_Forward_out),
    .ID_EX_Rt_Forward_out(ID_EX_Rt_Forward_out),
    .ID_EX_Rs_MUX_out(ID_EX_Rs_MUX_out),
    .ID_EX_Rt_MUX_out(ID_EX_Rt_MUX_out),
    .RegWrite_in(RegWrite_in),
    .MemtoReg_in(MemtoReg_in),
    .MemRead_in(MemRead_in),
    .MemWrite_in(MemWrite_in),
    .RegDst_in(RegDst_in),
    .ALU_Op_in(ALU_Op_in),
    .ALU_Src_in(ALU_Src_in),
    .Read_Data_1_in(Read_Data_1_in),
    .Read_Data_2_in(Read_Data_2_in),
    .sign_extend_in(sign_extend_in),
    .IF_ID_Rs_in(IF_ID_Rs_in),
    .IF_ID_Rt_in(IF_ID_Rt_in),
    .ID_Rd_in(ID_Rd_in)
);

// Clock generation
always begin
  forever begin 
  #100 clk = ~clk;
end
end 
// Initial values
initial begin
    clk = 0;
    Read_Data_1_in = 32'b1010;// Wire in makes it so that wire out should be 1010
    ALU_Op_in = 2'b10;
end

// Stimulus

endmodule


// Initial values
initial begin
    clk = 0;
    Read_Data_1_in = 32'b1010;// Wire in makes it so that wire out should be 1010
    ALU_Op_in = 2'b10;
end

// Stimulus

endmodule

