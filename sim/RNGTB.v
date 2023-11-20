module RNGTB;

   reg         clk;
   reg         reset;
   reg         start;
 
   wire [31:0] result;
   wire        done;


   
   RNG dut(.clk(clk),
	      .reset(reset),
	      .start(start),
		  .result(result),
	      .done(done));

   initial
     begin
	
	     
	clk = 0;
	start = 0;
	testbench_pass = 1;
		
	reset = 1;
	@(posedge clk);
	reset = 0;
     end

   always
     #5 clk = ~clk;
   
endmodule
