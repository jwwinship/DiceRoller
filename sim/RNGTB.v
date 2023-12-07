module RNGTB;

   reg         clk;
   reg         reset;
   reg         start;
 
   wire 	   result;
   wire        done;


   
   RNG dut(.clk(clk),
	      .reset_n(reset),
	      .start(start),
		  .result(result),
	      .done(done));

   initial
    begin
	
	     
		clk = 0;
		start = 1;
			
		reset = 0;
		@(posedge clk);
		reset = 1;
		
		repeat(1000) begin
			start = 0;
			@(posedge clk)
			$display("Output bit: %b", result);
			start = 1;
		
		end
		$finish;
    end


	
   always
     #5 clk = ~clk;
   
endmodule
