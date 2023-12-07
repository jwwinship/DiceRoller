`timescale 1ns/1ps

//Testbench module for interface

module TB_POSTPROCESS;

		reg clk;
		reg reset_n;
		reg i_data_in;
	
		reg [3:0]r_dieSelect;
		
		wire r_start;
		wire [6:0] r_random;
		wire r_randomValid;
		wire [4:0] r_rollResult;
		
		
		SIPO DUT_SIPO(.clk(clk), .reset_n(reset_n), .i_data_in(i_data_in), .i_start(r_start), .o_data_out(r_random), .o_valid(r_randomValid));
		postProcess DUT_PP(.i_dieSelect(r_dieSelect),
							.i_randomData(r_random),
							.i_clk(clk),
							.i_reset_n(reset_n),
							.i_uart(1'b0),
							.i_valid(r_randomValid), //Indicates valid random number input 
							.o_stop(!r_start),
							.o_dieRoll(r_rollResult),
							.o_tx(1'b0)); //Serial output
							
		initial
		begin
			clk = 0;
			reset_n = 1;
			//r_start = 0;
			@(posedge clk);
			reset_n = 0;
			@(posedge clk);
			reset_n = 1;
			@(posedge clk);
			
			repeat(5) begin
				#100; //Wait 50 clocks for some reason, to ensure that random number is available
				r_dieSelect = 4'b0101; //Roll D20
				@(posedge clk);
				reset_n = 0;
				@(posedge clk);
				reset_n = 1;
				@(posedge clk);
			end 

			
			
			/*
			@(posedge clk);
			i_start = 1;
			
			@(posedge clk);
			i_start = 0;
			i_data_in = 1;
			
			@(posedge clk);
			i_data_in = 0;
			
			@(posedge clk);
			i_data_in = 1;
			
			@(posedge clk);
			i_data_in = 0;
			
			@(posedge clk);
			i_data_in = 1;
			
			@(posedge clk);
			i_data_in = 1;
			
			@(posedge clk);
			i_data_in = 0;
			
			repeat (20)
				@(posedge clk);
			*/
		end
		
		
		
		
		
		always
			#5 clk = ~clk;
endmodule 