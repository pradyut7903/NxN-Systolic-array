module test;

parameter N=3;
parameter data_size=8;
parameter output_length = 2*data_size+N-1;
parameter input_length = N*data_size;


 
 reg clk;
 reg reset;
 reg [N*data_size-1:0] a_arr;
 reg [N*data_size-1:0] b_arr;
 
wire [N*N*output_length-1:0] out_arr;




 top uut (
  .clk(clk), 
  .reset(reset), 
  .a_arr(a_arr), 
  .b_arr(b_arr),  
  .out_arr(out_arr)
 );

 initial begin
  
  clk = 0;
  reset = 0;
  a_arr = 0;
  b_arr = 0;
 



 
  #5 reset = 1;
  #5 reset = 0;

  #5 reset = 1;
  #5 reset = 0;
  #5;  a_arr= 24'b000000000000000000000001 ; b_arr=24'b000000000000000000000010;
  #10; a_arr = 24'b000000000000010000000010; b_arr = 24'b000000000000000100000100;

  #10; a_arr = 24'b000001110000010100000011; b_arr = 24'b000000110000010100000110;

  #10; a_arr = 24'b000010000000011000000000; b_arr = 24'b000001110000100100000000;

  #10; a_arr = 24'b000010010000000000000000; b_arr = 24'b000010000000000000000000;
  
  #10; a_arr = 24'b000000000000000000000000; b_arr = 24'b000000000000000000000000;





  #100;
  $stop;

 end
 
 initial begin
  forever #5 clk = ~clk;
 end
      
endmodule
