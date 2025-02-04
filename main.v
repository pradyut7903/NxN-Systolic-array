`timescale 1ns / 1ps



module top(clk,reset,a_arr,b_arr,out_arr);

parameter N=3;
parameter data_size=8;
parameter output_length = 2*data_size+N-1;

 input wire clk,reset;
 input wire [N*data_size-1:0] a_arr;
 input wire [N*data_size-1:0] b_arr;
 
 output wire [N*N*output_length-1:0] out_arr;

 wire [N*(N-1)*data_size-1:0] a_intr;
 wire [N*(N-1)*data_size-1:0] b_intr;
 
 
 


genvar i,j;
generate


for (i=0; i<N; i=i+1) begin

    for(j=0 ; j<N ; j=j+1) begin
    
    if (i==0 & j==0)
    begin
    pe pe1(.clk(clk), .reset(reset), .in_a(a_arr[7:0]), .in_b(b_arr[7:0]), .out_a(a_intr[data_size-1:0]), .out_b(b_intr[data_size-1:0]), .out_c(out_arr[output_length-1:0]));
    end
    
    else if (i==0 & j!= 0 & j != N-1)
    begin
    pe pe1(.clk(clk), .reset(reset), .in_a(a_intr[j*data_size-1:(j-1)*data_size]), .in_b(b_arr[j*data_size+data_size-1:j*data_size]), .out_a(a_intr[(j+1)*data_size-1:j*data_size]), .out_b(b_intr[j*data_size+data_size-1:j*data_size]), .out_c(out_arr[output_length*(N*i+j+1)-1: output_length*(N*i+j)]));
    end
    
    else if (i==0 & j==N-1)
    begin
    pe pe1(.clk(clk), .reset(reset), .in_a(a_intr[j*data_size-1:(j-1)*data_size]), .in_b(b_arr[j*data_size+data_size-1:j*data_size]), .out_a(), .out_b(b_intr[j*data_size+data_size-1:j*data_size]), .out_c(out_arr[output_length*(N*i+j+1)-1: output_length*(N*i+j)]));
    end
    
    else if ( i!=0 & j==0 & i!= N-1)
    begin
    pe pe1(.clk(clk), .reset(reset), .in_a(a_arr[i*data_size+data_size-1:i*data_size]), .in_b(b_intr[(((i-1)*N+j+1)*data_size)-1:((i-1)*N+j)*data_size]), .out_a(a_intr[(i*(N-1)+j+1)*data_size-1:(i*(N-1)+j)*data_size]), .out_b(b_intr[(N*i+j+1)*data_size-1:(N*i+j)*data_size]), .out_c(out_arr[output_length*(N*i+j+1)-1: output_length*(N*i+j)]));
    end
    
    else if (i==N-1 & j==0)
    begin
    pe pe1(.clk(clk), .reset(reset), .in_a(a_arr[i*data_size+data_size-1:i*data_size]), .in_b(b_intr[(((i-1)*N+j+1)*data_size)-1:((i-1)*N+j)*data_size]), .out_a(a_intr[(i*(N-1)+j+1)*data_size-1:(i*(N-1)+j)*data_size]), .out_b(), .out_c(out_arr[output_length*(N*i+j+1)-1: output_length*(N*i+j)]));
    end
    
    else if ( i== N-1 & j!=0 & j!=N-1)
    begin
    pe pe1(.clk(clk), .reset(reset), .in_a(a_intr[(N*i+j-i)*data_size-1:(N*i+j-i-1)*data_size]), .in_b(b_intr[(((i-1)*N+j+1)*data_size)-1:((i-1)*N+j)*data_size]), .out_a(a_intr[(i*(N-1)+j+1)*data_size-1:(i*(N-1)+j)*data_size]), .out_b(), .out_c(out_arr[output_length*(N*i+j+1)-1: output_length*(N*i+j)]));
    end
    
    else if (i== N-1 & j==N-1)
    begin
    pe pe1(.clk(clk), .reset(reset), .in_a(a_intr[(N*i+j-i)*data_size-1:(N*i+j-i-1)*data_size]), .in_b(b_intr[(((i-1)*N+j+1)*data_size)-1:((i-1)*N+j)*data_size]), .out_a(), .out_b(), .out_c(out_arr[output_length*(N*i+j+1)-1: output_length*(N*i+j)]));
    end
    
    else if (i!=0 & j == N-1 & i!= N-1)
    begin
    pe pe1(.clk(clk), .reset(reset), .in_a(a_intr[(N*i+j-i)*data_size-1:(N*i+j-i-1)*data_size]), .in_b(b_intr[(((i-1)*N+j+1)*data_size)-1:((i-1)*N+j)*data_size]), .out_a(), .out_b(b_intr[(N*i+j+1)*data_size-1:(N*i+j)*data_size]), .out_c(out_arr[output_length*(N*i+j+1)-1: output_length*(N*i+j)]));
    end
    
    
    else
    begin
    pe pe1(.clk(clk), .reset(reset), .in_a(a_intr[(N*i+j-i)*data_size-1:(N*i+j-i-1)*data_size]), .in_b(b_intr[(((i-1)*N+j+1)*data_size)-1:((i-1)*N+j)*data_size]), .out_a(a_intr[(i*(N-1)+j+1)*data_size-1:(i*(N-1)+j)*data_size]), .out_b(b_intr[(N*i+j+1)*data_size-1:(N*i+j)*data_size]), .out_c(out_arr[output_length*(N*i+j+1)-1: output_length*(N*i+j)]));
    end
            
    
          
    end
end


endgenerate



endmodule


module pe(clk,reset,in_a,in_b,out_a,out_b,out_c);

 parameter data_size=8;
 input wire reset,clk;
 input wire [data_size-1:0] in_a,in_b;
 output reg [2*data_size:0] out_c;
 output reg [data_size-1:0] out_a,out_b;

 always @(posedge clk)
 begin
    if(reset) 
    begin
      out_a=0;
      out_b=0;
      out_c=0;
    end
    
    else 
    begin  
      out_c = out_c+in_b*in_a;
      out_a = in_a;
      out_b = in_b;
    end
 end
 
endmodule