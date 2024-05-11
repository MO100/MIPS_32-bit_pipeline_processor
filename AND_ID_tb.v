module AND_ID_tb();

  // Inputs
  reg A_in, B_in;
  
  // Output
  wire output_bit;
  
  // Instantiate the module
  AND_ID UUT(
    .output_bit(output_bit),
    .A_in(A_in),
    .B_in(B_in)
  );

  // Initial stimulus
  initial begin
    // Test case 1: A_in = 0, B_in = 0
    A_in = 1'b0; B_in = 1'b0; #10;
    $display("Test case 1: A_in = %b, B_in = %b, output_bit = %b", A_in, B_in, output_bit);

    // Test case 2: A_in = 0, B_in = 1
    A_in = 1'b0; B_in = 1'b1; #10;
    $display("Test case 2: A_in = %b, B_in = %b, output_bit = %b", A_in, B_in, output_bit);

    // Test case 3: A_in = 1, B_in = 0
    A_in = 1'b1; B_in = 1'b0; #10;
    $display("Test case 3: A_in = %b, B_in = %b, output_bit = %b", A_in, B_in, output_bit);

    // Test case 4: A_in = 1, B_in = 1
    A_in = 1'b1; B_in = 1'b1; #10;
    $display("Test case 4: A_in = %b, B_in = %b, output_bit = %b", A_in, B_in, output_bit);

    // End simulation
  end

endmodule

