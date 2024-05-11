module Comparator_tb();

reg [31:0] A_in, B_in;
wire output_bit;

// Instantiate the module
Comparator UUT (
    .A_in(A_in),
    .B_in(B_in),
    .output_bit(output_bit)
);

// Stimulus
initial begin
    // Test case 1: A_in = 5, B_in = 5 (Equal)
    A_in = 32'h0000_0005;
    B_in = 32'h0000_0005;
    #10;
    
    // Test case 2: A_in = 10, B_in = 15 (Not Equal)
    A_in = 32'h0000_000A;
    B_in = 32'h0000_000F;
    #10;
    
    // Test case 3: A_in = 0xFFFFFFFF (maximum signed value), B_in = 0xFFFFFFFF (maximum signed value)
    A_in = 32'h7FFFFFFF;
    B_in = 32'h7FFFFFFF;
    #10;

end

endmodule

