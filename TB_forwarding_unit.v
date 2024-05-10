module TB_forwarding_unit();

	reg clk; // Clock signal
	
	wire [1:0] Forward_A_out, Forward_B_out;

	reg EX_MEM_WB_in, MEM_WB_WB_in;
	reg [4:0] EX_MEM_reg_destination_in, MEM_WB_reg_destination_in, ID_EX_RS_in, ID_EX_RT_in;

	forwarding_unit FU(
	 .Forward_A_out(Forward_A_out), 
	 .Forward_B_out(Forward_B_out), 
	 .ID_EX_RS_in(ID_EX_RS_in), 
	 .ID_EX_RT_in(ID_EX_RT_in), 
	 .EX_MEM_reg_destination_in(EX_MEM_reg_destination_in), 
	 .MEM_WB_reg_destination_in(MEM_WB_reg_destination_in), 
	 .EX_MEM_WB_in(EX_MEM_WB_in), 
	 .MEM_WB_WB_in(MEM_WB_WB_in)
	 );

	always begin
        #5 clk = ~clk;
    end

	
	initial begin
		clk = 0;
		// Case 1: No Hazards
		EX_MEM_reg_destination_in = 0; MEM_WB_reg_destination_in = 0;
		ID_EX_RS_in = 0; ID_EX_RT_in = 0;
		{EX_MEM_WB_in,MEM_WB_WB_in} = 2'b00;
		#100;

		// Case 2: MEMWB Hazard
		EX_MEM_reg_destination_in = 0; MEM_WB_reg_destination_in = 5;
		ID_EX_RS_in = 5; ID_EX_RT_in = 6;
		{EX_MEM_WB_in,MEM_WB_WB_in} = 2'b01;
		#100;

		// Case 3: EXMEM Hazard
		EX_MEM_reg_destination_in = 5; MEM_WB_reg_destination_in = 4;
		ID_EX_RS_in = 5; ID_EX_RT_in = 6;
		EX_MEM_WB_in = 1; MEM_WB_WB_in = 2'b10;
		#100;

		// Case 4: Double Data Hazard
		EX_MEM_reg_destination_in = 5; MEM_WB_reg_destination_in = 6;
		ID_EX_RS_in = 5; ID_EX_RT_in = 6;
		EX_MEM_WB_in = 1; MEM_WB_WB_in = 2'b11;
		#100;
		// End simulation
		$finish;
	end
	
	
endmodule
