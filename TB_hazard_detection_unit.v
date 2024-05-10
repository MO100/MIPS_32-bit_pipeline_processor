module TB_hazard_detection_unit;
  // Outputs
  wire flush_out, PCWrite_out, IF_ID_write_out, MUX_nop_out;
  
  // Inputs
  reg clk;
  reg [4:0] ID_EX_reg_target_in, IF_ID_reg_target_in, IF_ID_reg_source_in, EX_MEM_reg_target_in;
  reg EX_MEM_WB_in, ID_EX_mem_read_in, branch_in, jump_in, EX_MEM_mem_read_in, comparator_in;

  // Instantiate the unit under test
  hazard_detection_unit dut(
    .flush_out(flush_out),
    .PCWrite_out(PCWrite_out),
    .IF_ID_write_out(IF_ID_write_out),
    .MUX_nop_out(MUX_nop_out),
    .ID_EX_reg_target_in(ID_EX_reg_target_in),
    .IF_ID_reg_target_in(IF_ID_reg_target_in),
    .IF_ID_reg_source_in(IF_ID_reg_source_in),
    .EX_MEM_reg_target_in(EX_MEM_reg_target_in),
    .EX_MEM_WB_in(EX_MEM_WB_in),
    .ID_EX_mem_read_in(ID_EX_mem_read_in),
    .branch_in(branch_in),
    .jump_in(jump_in),
    .EX_MEM_mem_read_in(EX_MEM_mem_read_in),
    .comparator_in(comparator_in)
  );

  always begin
     #5 clk = ~clk;
  end
  // Apply stimulus
  initial begin
	clk = 0;
    // Initialize inputs
    ID_EX_reg_target_in = 5'b00000;
    IF_ID_reg_target_in = 1'b0;
    IF_ID_reg_source_in = 1'b0;
    EX_MEM_reg_target_in = 5'b00000;
    EX_MEM_WB_in = 1'b0;
    ID_EX_mem_read_in = 1'b0;
    branch_in = 1'b0;
    jump_in = 1'b0;
    EX_MEM_mem_read_in = 1'b0;
    comparator_in = 1'b0;

    // Wait for a few clock cycles
    #100;
    // Example test case 1: When ID_EX_mem_read_in is 1 and ID_EX_reg_target_in matches either IF_ID_reg_target_in or IF_ID_reg_source_in
    ID_EX_mem_read_in = 1'b1;
    IF_ID_reg_target_in = 1'b1;
    IF_ID_reg_source_in = 1'b0;
	$display("Case 1");
	$display("ID_EX_mem_read_in == IF_ID_reg_target_in");
	$display("instruction in EX stage is a load");
    // Wait for a few clock cycles for the outputs to stabilize
	#100;

     // Test case 2: EX_MEM loading hazard detection
	EX_MEM_WB_in = 1'b1;
	IF_ID_reg_target_in = 1'b0;
	IF_ID_reg_source_in = 1'b0;
	ID_EX_mem_read_in = 1'b0;
	EX_MEM_reg_target_in = 1'b1;
	IF_ID_reg_source_in = 1'b1;
	$display("Case 2");
	$display("EX_MEM_reg_target_in == IF_ID_reg_source_in");
	$display("checks if memory is written onto on the mem wb stage");
	#100;

	// Test case 3: Branch hazard detection
	branch_in = 1'b1;
	EX_MEM_WB_in = 0'b0;
	EX_MEM_reg_target_in = 1'b0;
	IF_ID_reg_source_in = 1'b0;
	ID_EX_mem_read_in = 1'b1;
	IF_ID_reg_target_in = 1'b1;
	IF_ID_reg_source_in = 1'b1;
	$display("Case 3");
	$display("IF_ID_reg_target_in == IF_ID_reg_source_in & ID_EX_mem_read_in is true");
	#100;

	// Test case 4: Memory read hazard detection
	ID_EX_mem_read_in = 1'b0;
	IF_ID_reg_source_in = 1'b0;
	EX_MEM_mem_read_in = 1'b1;
	EX_MEM_reg_target_in = 1'b1;
	$display("Case 4");
	$display("EX_MEM_reg_target_in == IF_ID_reg_target_in & EX_MEM_mem_read_in is true");
	#100;

	// Test case 5: Comparator hazard detection
	comparator_in = 1'b1;
	EX_MEM_mem_read_in = 1'b0;
	EX_MEM_reg_target_in = 1'b0;
	$display("Case 5");
	$display("comparator_in is true");
	#100;

	// Test case 6: Jump hazard detection
	branch_in = 1'b0;
	comparator_in = 1'b0;
	jump_in = 1'b1;
	$display("Case 6");
	$display("jump is true");
	#100;
	//default case
	jump_in = 1'b0;
	IF_ID_reg_target_in = 1'b0;
	$display("Case 7");
	$display("default case");
	#100;
    $finish;
  end

endmodule

