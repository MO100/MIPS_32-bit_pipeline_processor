module TB_Adder_32_Bits;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in simulation time units

    // Signals
    reg [31:0] A_in, B_in;
    wire [31:0] total_out;

    // Instantiate the module under test
    Adder_32_Bits uut (
        .total_out(total_out),
        .A_in(A_in),
        .B_in(B_in)
    );

    // Clock generation
    reg clk = 0; // Declare a clock signal
    always #((CLK_PERIOD/2)) clk = ~clk; // Toggle the clock every half period

    // Test stimulus
    initial begin
        // Test case 1: A and B are zeros
        A_in = 32'b00000000000000000000000000000000;
        B_in = 32'b00000000000000000000000000000000;
        #10; // Wait for a few time units
        // Expected output: total_out should be 32'b00000000000000000000000000000000

        // Test case 2: A and B are ones
        A_in = 32'b11111111111111111111111111111111;
        B_in = 32'b11111111111111111111111111111111;
        #10; // Wait for a few time units
        // Expected output: total_out should be 32'b11111111111111111111111111111110

        // Test case 3: A and B have different values
        A_in = 32'b10101010101010101010101010101010;
        B_in = 32'b01010101010101010101010101010101;
        #10; // Wait for a few time units
        // Expected output: total_out should be 32'b11111111111111111111111111111111

        $finish;
    end

endmodule
