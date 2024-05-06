module TB_Control;

    // Constants
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg [5:0] op_code_in;
    wire [1:0] WB_out, MEM_out;
    wire [3:0] EX_out;
    wire jump_out, branch_out;

    // Instantiate the module under test
    Control dut (
        .WB_out(WB_out),
        .MEM_out(MEM_out),
        .EX_out(EX_out),
        .jump_out(jump_out),
        .branch_out(branch_out),
        .op_code_in(op_code_in)
    );

    // Clock generation
    reg clk = 0;
    always #((CLK_PERIOD / 2)) clk = ~clk;

    initial begin
        // Test case 1: R-type instruction
        op_code_in = 6'b000000;
        #10; // Wait a bit for signals to stabilize
        $display("Test Case 1: R-type instruction");
		$display("WB %b, MEM %b, EX %b", WB_out, MEM_out, EX_out);
        // WB_out = 10
		// MEM_out = 00
		// EX_out = 1100
        
        // Test case 2: Jump instruction
        op_code_in = 6'b000010;
        #10; // Wait a bit for signals to stabilize
        $display("Test Case 2: Jump instruction");
		$display("WB %b, MEM %b, EX %b", WB_out, MEM_out, EX_out);
        // WB_out = 00
		// MEM_out = 00
		// EX_out = 0010
        
        // Test case 3: Branch equal (beq) instruction
        op_code_in = 6'b000100;
        #10; // Wait a bit for signals to stabilize
        $display("Test Case 3: Branch equal (beq) instruction");
		$display("WB %b, MEM %b, EX %b", WB_out, MEM_out, EX_out);
        // WB_out = 00
		// MEM_out = 00
		// EX_out = 0010
        
        // Test case 4: Addi instruction
        op_code_in = 6'b001000;
        #10; // Wait a bit for signals to stabilize
        $display("Test Case 4: Addi instruction");
		$display("WB %b, MEM %b, EX %b", WB_out, MEM_out, EX_out);
        // WB_out = 00
		// MEM_out = 00
		// EX_out = 0001
        
        // Test case 5: load word (lw) instruction
        op_code_in = 6'b100011;
        #10; // Wait a bit for signals to stabilize
        $display("Test Case 5: Load word (lw) instruction");
		$display("WB %b, MEM %b, EX %b", WB_out, MEM_out, EX_out);
        // WB_out = 01
		// MEM_out = 10
		// EX_out = 0001
		
        // Test case 6: Store word (sw) instruction
        op_code_in = 6'b101011;
		#10; // Wait a bit for signals to stabilize
        $display("Test Case 5: Store word (sw) instruction");
		$display("WB %b, MEM %b, EX %b", WB_out, MEM_out, EX_out);
        // WB_out = 00
		// MEM_out = 01
		// EX_out = 0001
		
        $finish;
    end

endmodule

