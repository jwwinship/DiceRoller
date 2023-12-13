`timescale 1ns/1ps

//Testbench module for interface

module TB_POSTPROCESS;

		reg clk;
		reg reset_n;
		wire i_data_in;
		
		reg[31:0] f;
	
		reg [3:0]r_dieSelect;
		reg [31:0] dataa, datab;
		
		wire r_stop;
		wire [6:0] w_random;
		//reg [6:0] r_random;
		
		//assign r_random = w_random; //Convert to register for debug
		
		wire r_randomValid;
		wire [4:0] r_rollResult;
		wire [31:0] result;
		wire w_tx;
		wire done;
		
		RNG_NIOS_INSTR RNG_DUT(.clk(clk), .clk_en(1'b1), .reset(reset_n), .start(1'b1), .dataa(dataa), .datab(32'b0), .result(result), .done(done));
				

		initial begin
			clk = 0; reset_n = 1;
			@(posedge clk);
			@(posedge clk)
			reset_n = 0;
		end
		
		/* always begin
			if (r_randomValid)
				//$fwrite(f, "Randomly Generated Number: %b	|	Dice Selection: %b	|	Random Roll: %b\n", r_random, r_dieSelect, r_rollResult);
		end */
		
		initial
		begin
		
			dataa = 32'h000F;
			f = $fopen("randomRollsLFSR.txt","w");
			@(negedge reset_n); //Wait for reset to be released
			@(posedge clk);   //Wait for fisrt clock out of reset
			

			
			repeat(1000) begin
				#100; //Wait 50 clocks for some reason, to ensure that random number is available
				dataa = 32'h0005; //Roll D20
				@(done); //Wait for random Roll
				//$fwrite(f, "Randomly Generated Number: %d	|	Dice Selection: %b	|	Random Roll: %d\n", w_random, r_dieSelect, r_rollResult);
				$fwrite(f, "%d\n", result);
				dataa = 32'h000F;
				#100;
				
		
			end 
			$fclose(f);
			$finish;
		end
		
		
		
		
		
		always begin
			#5 clk = ~clk;
		end
endmodule 