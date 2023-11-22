

module RNG(input  wire clk,
              input  wire reset_n,
              input  wire start,
              output wire result,
	      output wire done);
   
   wire stop;
   assign stop = !start;
   
   GARO rng1(.stop(stop), .clk(clk), .reset_n(reset_n), .random(result));
   
endmodule
