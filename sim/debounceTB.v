
`timescale 1ns / 1ps
// testbench verilog code for debouncing button without creating another clock
module debounceTB;
 // Inputs
 reg pb_1;
 reg clk;
 // Outputs
 wire pb_out;
 // Instantiate the debouncing Verilog code
 debounce_better_version uut (
  .pb_1(pb_1), 
  .clk(clk), 
  .pb_out(pb_out)
 );
 initial begin
  clk = 0;
  forever #10 clk = ~clk;
 end
 initial begin
  pb_1 = 0;
  #10000000;
  pb_1=1;
  #20000000;
  pb_1 = 0;
  #10000000;
  pb_1=1;
  #30000000; 
  pb_1 = 0;
  #100;
  pb_1=1;
  #40;
  pb_1 = 0;
  #10;
  pb_1=1;
  #30; 
  pb_1 = 0;
  #10;
  pb_1=1; 
  #1000; 
  pb_1 = 0;
  #10;
  pb_1=1;
  #20;
  pb_1 = 0;
  #10;
  pb_1=1;
  #30; 
  pb_1 = 0;
  #10;
  pb_1=1;
  #40;
  pb_1 = 0; 
  $finish;
 end 
     
endmodule