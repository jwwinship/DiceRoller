`timescale 1ns/1ps

//Testbench module for interface

module TB_POSTPROCESS;

		reg clk;
		reg reset_n;
		reg i_data_in;
		
		reg[31:0] f;
	
		reg [3:0]r_dieSelect;
		
		wire r_stop;
		wire [6:0] w_random;
		//reg [6:0] r_random;
		
		//assign r_random = w_random; //Convert to register for debug
		
		wire r_randomValid;
		wire [4:0] r_rollResult;
		wire w_tx;
		
		SIPO DUT_SIPO(.clk(clk), .reset_n(reset_n), .i_data_in(i_data_in), .i_start(!r_stop), .o_data_out(w_random), .o_valid(r_randomValid));
		postProcess DUT_PP(.i_dieSelect(r_dieSelect),
							.i_randomData(w_random),
							.i_clk(clk),
							.i_reset_n(reset_n),
							.i_uart(1'b0),
							.i_valid(r_randomValid), //Indicates valid random number input 
							.o_stop(r_stop),
							.o_dieRoll(r_rollResult),
							.o_tx(w_tx)); //Serial output
				

		initial begin
			clk = 0; reset_n = 0;
			@(posedge clk);
			@(posedge clk);
			reset_n = 1;
		end
		
		/* always begin
			if (r_randomValid)
				//$fwrite(f, "Randomly Generated Number: %b	|	Dice Selection: %b	|	Random Roll: %b\n", r_random, r_dieSelect, r_rollResult);
		end */
		
		initial
		begin
			r_dieSelect = 4'b1111;
			f = $fopen("randomRollsRaw.txt","w");
			@(posedge reset_n); //Wait for reset to be released
			@(posedge clk);   //Wait for fisrt clock out of reset
			
			repeat(500) begin
				#100; //Wait 50 clocks for some reason, to ensure that random number is available
				r_dieSelect = 4'b0101; //Roll D20
				@(w_random); //Wait for random Roll
				//$fwrite(f, "Randomly Generated Number: %d	|	Dice Selection: %b	|	Random Roll: %d\n", w_random, r_dieSelect, r_rollResult);
				$fwrite(f, "%d\n", r_rollResult);
				#100;
				r_dieSelect = 4'b1111;
				
		
			end 
			$fclose(f);
			$finish;
		end
		
		
		
		
		
		always begin
			#5 clk = ~clk;
			i_data_in = $random%2;
		end
endmodule 