`timescale 1ns/1ps
module top (

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







//some module to write to the screen
//screenControl unit_screenControl();


// enabled when synthesized for board 
/*
GARO unit_GARO(); 

*/


//serialToParallel

//serialToParallel unit_serialToParallel();

//uart 

//uart unit_uart();




endmodule 


