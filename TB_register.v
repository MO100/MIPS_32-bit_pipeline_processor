module TB_Register();
reg clk,RegWrite, rst;
reg [4:0] read_reg1,read_reg2,write_reg;
reg [31:0] write_data;
wire[31:0] rdata1, rdata2;
//register file instatinating as dut
register dut(clk, rst, RegWrite,read_reg1,read_reg2,write_reg,write_data,rdata1,rdata2);
//in this initial block we will generate a clock period 20 units

initial begin 
  clk = 0;
  rst = 0;
  forever begin
  #5 clk = ~clk;
  end end
  
initial begin
//Writing initial values to each memory in
RegWrite=1'b1;
//writing numbers into each location of memory
 write_reg =4'b0000;
#5 write_data=4'b0000;
#5 write_reg =4'b0001;
#5 write_data=4'b0001;
#5 write_reg =4'b0010;
#5 write_data=4'b0010;
#5 write_reg =4'b0011;
#5 write_data=4'b0011;
#5 write_reg =4'b0100;
#5 write_data=4'b0100;
#5 write_reg =4'b0101;
#5 write_data=4'b0101;
#5 write_reg =4'b0110;
#5 write_data=4'b0110;
#5 write_reg =4'b0111;
#5 write_data=4'b0111;
#5 RegWrite=1'b0; //disable writing into memory, now reading mode
//reading from memory since 
#5 read_reg1=4'b0111;
#5 read_reg2=4'b0110;

end
endmodule


