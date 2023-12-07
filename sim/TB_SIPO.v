`timescale 1ns/1ps

//Testbench module for RNG SIPO

module TB_SIPO;

		reg clk;
		reg reset_n;
		reg i_data_in;
		reg i_start;
		wire [6:0] o_data_out;
		wire o_valid;
		
		SIPO DUT_SIPO (.clk(clk), .reset_n(reset_n), .i_data_in(i_data_in), .i_start(i_start), .o_data_out(o_data_out), .o_valid(o_valid));
		
		initial
		begin
			clk = 0;
			reset_n = 1;
			i_data_in = 0;
			i_start = 0;
			@(posedge clk);
			reset_n = 0;
			
			@(posedge clk);
			reset_n = 1;
			
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
			
			repeat (5)
				@(posedge clk);
				
			
			repeat (4)
			begin
				i_start = 1;
				@(posedge clk); 
				i_start = 0;
				repeat(8)
				begin
					i_data_in = $random % 2;
					@(posedge clk);
				end
				@(posedge clk);
			end
			
			
			$stop;
		end
		
		
		
		
		
		always
			#5 clk = ~clk;
endmodule 