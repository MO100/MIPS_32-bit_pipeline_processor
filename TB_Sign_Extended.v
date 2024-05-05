
module TB_Sign_Extended;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in simulation time units

    // Signals
    reg [15:0] in;
    wire [31:0] data_out;

    // Instantiate the module under test
    Sign_Extended uut (
        .data_out(data_out),
        .sign_extend_in(in)
    );

    // Clock generation
    reg clk = 0; // Declare a clock signal
    always #((CLK_PERIOD/2)) clk = ~clk; // Toggle the clock every half period

    // Test stimulus
    initial begin
        // Initialize input
        in = 16'b0000000000000000; // Set input to 0
        #10;

        // Test case 1: MSB of input is 0
        in = 16'b0000000000000001; // Set input to 1
        #10;
        // Expected output: data_out should be 16'b00000000000000010000000000000001

        // Test case 2: MSB of input is 1
        in = 16'b1000000000000000; // Set input to 32768
        #10;
        // Expected output: data_out should be 16'b11111111111111110000000000000000

        $finish;
    end

endmodule
