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

`ifdef USE_SDF
      initial
	begin
	   $sdf_annotate("../layout/out/design.sdf",RNGTB.dut,,"sdf.log","MAXIMUM");
	end
`endif

   
   initial
    begin
		$dumpfile("trace.vcd");
		$dumpvars(0, RNGTB);
			 
		clk = 0;
		target = 0;
		start = 0;
		testbench_pass = 1;
			
		reset = 1;
		@(posedge clk);
		reset = 0;
	end	

   always
     #5 clk = ~clk;
   
endmodule
