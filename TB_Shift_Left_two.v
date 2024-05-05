module TB_Shift_Left_Two;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in simulation time units

    // Signals
    reg [31:0] data_in;
    wire [31:0] data_out;

    // Instantiate the module under test
    Shift_Left_Two uut (
        .data_out(data_out),
        .data_in(data_in)
    );

    // Clock generation
    reg clk = 0; // Declare a clock signal
    always #((CLK_PERIOD/2)) clk = ~clk; // Toggle the clock every half period

    // Test stimulus
    initial begin
        // Initialize input
        data_in = 32'b00000000000000000000000000000000; // Set input to 0
        #10; // Wait for a few time units

        // Test case 1: All zeros
        data_in = 32'b00000000000000000000000000000000; // Set input to all zeros
        #10; // Wait for a few time units
        // Expected output: data_out should be 32'b00000000000000000000000000000000

        // Test case 2: All ones
        data_in = 32'b11111111111111111111111111111111; // Set input to all ones
        #10; // Wait for a few time units
        // Expected output: data_out should be 32'b11111111111111111111111111111100

        // Test case 3: Random data
        data_in = 32'b10101010101010101010101010101010; // Set input to a random value
        #10; // Wait for a few time units
        // Expected output: data_out should be 32'b01010101010101010101010101010000

        $finish;
    end

endmodule

