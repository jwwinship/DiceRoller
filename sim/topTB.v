`timescale 1ns/1ps

module topTB;



	reg clk;
	reg reset_n;
	reg buttonD4;
	reg buttonD6;
	reg buttonD8;
	reg buttonD10;
	reg buttonD12;
	reg buttonD20;
	reg switchTest;


initial begin
  clk = 0;
  forever #10 clk = ~clk;
 end


diceTop unit_diceTop(

//input 
.buttonD4(buttonD4), 
.buttonD6(buttonD6), 
.buttonD8(buttonD8), 
.buttonD10(buttonD10), 
.buttonD12(buttonD12), 
.buttonD20(buttonD20), 
.switchTest(switchTest),
.clk(clk),
.reset_n(reset_n)
//finish intput and output list
);


		initial begin
			clk = 0; reset_n = 0;
			@(posedge clk);
			@(posedge clk);
			reset_n = 1;
		end

		always begin
			#5 clk = ~clk;
		end

		initial begin
			

			$display("D4 Press");

			buttonD4 = 0;
			buttonD6 = 1;
			buttonD8 = 0;
			buttonD10 = 0;
			buttonD12 = 0;
			buttonD20 = 0;
			switchTest = 0;


			 #20000000;

			 
		



		 $finish;
		end
endmodule