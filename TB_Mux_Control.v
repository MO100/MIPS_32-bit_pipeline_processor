`timescale 1ns / 1ps

module TB_Mux_Control;

    // Inputs
    reg [1:0] WriteBack_In, Memory_In;
    reg [3:0] Execution_In;
    reg Hazard_In;

    // Outputs
    wire Reg_Dst_out, Mem_Write_Out, Mem_Read_Out, Reg_Write_out, Alu_Src_Out, Mem_To_Reg_Out;
    wire [1:0] Alu_OP_Out;

    // Instantiate the module
    Mux_Control mux_control(
        .Reg_Write_out(Reg_Write_out),
        .Mem_To_Reg_Out(Mem_To_Reg_Out),
        .Mem_Read_Out(Mem_Read_Out),
        .Mem_Write_Out(Mem_Write_Out),
        .Reg_Dst_out(Reg_Dst_out),
        .Alu_OP_Out(Alu_OP_Out),
        .Alu_Src_Out(Alu_Src_Out),
        .WriteBack_In(WriteBack_In),
        .Memory_In(Memory_In),
        .Execution_In(Execution_In),
        .Hazard_In(Hazard_In)
    );

    // Clock declaration
    reg clk;

    // Clock generation
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Testbench stimulus
    initial begin
        // Initialize inputs
        WriteBack_In = 2'b00;
        Memory_In = 2'b00;
        Execution_In = 4'b0000;
        Hazard_In = 0;

        // Apply inputs
		#10 Hazard_In = 1;
        #10 WriteBack_In = 2'b01;
        #10 Memory_In = 2'b10;
        #10 Execution_In = 4'b1010;


        #10;
		#10 Hazard_In = 0;
        #10 WriteBack_In = 2'b01;
        #10 Memory_In = 2'b10;
        #10 Execution_In = 4'b1010;

		
        // End simulation
        $finish;
    end

    // Monitor outputs
    always @(posedge clk) begin
        $display("Reg_Write_out: %b, Mem_To_Reg_Out: %b, Mem_Read_Out: %b, Mem_Write_Out: %b, Reg_Dst_out: %b, Alu_OP_Out: %b, Alu_Src_Out: %b",
                 Reg_Write_out, Mem_To_Reg_Out, Mem_Read_Out, Mem_Write_Out, Reg_Dst_out, Alu_OP_Out, Alu_Src_Out);
    end

endmodule
