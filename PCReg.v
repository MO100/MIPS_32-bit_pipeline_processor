module PCReg(PC_out, PC_in, clk, rst, write_in);

  output reg [31:0] PC_out;
  input [31:0] PC_in;
  input clk, rst, write_in;

  always@(posedge clk) begin
    if(rst == 1'b1)
      PC_out <= 32'b0;
    else
      if(write_in == 1'b1)
        PC_out <= PC_in;
  end

endmodule
