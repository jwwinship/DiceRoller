`timescale 1ns/1ps
module diceTop (

//input 
input buttonD4, 
input buttonD6, 
input buttonD8, 
input buttonD10, 
input buttonD12, 
input buttonD20, 
input switchTest,
input clk,
input reset_n
//finish intput and output list
);
wire clk;
wire postBounce_Button4;
wire postBounce_Button6;
wire postBounce_Button8;
wire postBounce_Button10;
wire postBounce_Button12;
wire postBounce_Button20;
wire postBounce_switchTest;
wire [2:0] w_dieSelect;
//pre proccess random bits from lfsr
wire randomBits;
//post process values
wire [6:0] randomVals;
//goes nowhere right now
wire i_uart;
wire i_valid;
wire o_stop;
wire [4:0] o_dieRoll;
wire o_tx;



//button processing
encoder unit_encoder(

//input 
.buttonD4(postBounce_Button4), 
.buttonD6(postBounce_Button6), 
.buttonD8(postBounce_Button8), 
.buttonD10(postBounce_Button10), 
.buttonD12(postBounce_Button12), 
.buttonD20(postBounce_Button20), 
.switchTest(postBounce_switchTest),
//output 
.dieSelect(w_dieSelect)
);

debounce unit_buttonD4_debounce(

	//input 
	.pb(buttonD4),
	.clk_in(clk),
	//output 
	.pb_out(postBounce_Button4)
);

debounce unit_buttonD6_debounce(

	//input 
	.pb(buttonD6),
	.clk_in(clk),
	//output 
	.pb_out(postBounce_Button6)
);


debounce unit_buttonD8_debounce(

	//input 
	.pb(buttonD8),
	.clk_in(clk),
	//output 
	.pb_out(postBounce_Button8)
);


debounce unit_buttonD10_debounce(

	//input 
	.pb(buttonD10),
	.clk_in(clk),
	//output 
	.pb_out(postBounce_Button10)
);


debounce unit_buttonD12_debounce(

	//input 
	.pb(buttonD12),
	.clk_in(clk),
	//output 
	.pb_out(postBounce_Button12)
);

debounce unit_buttonD20_debounce(

	//input 
	.pb(buttonD20),
	.clk_in(clk),
	//output 
	.pb_out(postBounce_Button20)
);


debounce unit_switch_debounce(

	//input 
	.pb(switchTest),
	.clk_in(clk),
	//output 
	.pb_out(postBounce_switchTest)
);



postProcess unit_postProcess(

//input wire [3:0] 
.i_dieSelect(w_dieSelect),
//input wire [6:0] 
.i_randomData(randomVals),
//input wire 
.i_clk(clk),
//input wire 
.i_reset_n(reset_n),
//input wire  
.i_uart(i_uart),
//input wire 
.i_valid(i_valid), //Indicates valid random number input 
//output wire 
.o_stop(o_stop),
//output wire [4:0] 
.o_dieRoll(o_dieRoll),
//output wire 
.o_tx(o_tx) //Serial output 

);


SIPO unit_sipo(
		//input wire 
		.clk(clk),
		//input wire 
		.reset_n(reset_n),
		//input wire 
		.i_data_in(randomBits), 
		//input wire 
		.i_start(!o_stop),
		//output wire[6:0] 
		.o_data_out(randomVals),
		//output wire 
		.o_valid(i_valid)
	);
	
 lfsr unit_lfsr(
	//input 
	.clk(clk),    
	//input 
	.reset_n(reset_n),
	//output 
	.Q(randomBits)//20,17

);


endmodule 


