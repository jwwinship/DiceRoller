module top (

input dieSelect,
input reset_n,


//finish intput and output list


)

wire clk;

//post-processing/ interface

postProccess unit_postProccess (

.clk(clk),
.randValue(randValue),
.dieSelect(dieSelect,
.reset_n(reset_n),
.dieRoll(dieRoll)
);


//button processing

d_bounce unit_d_bounce();

//dmux to combine the button inputs into one input

encoder unit_encoder();


//some module to write to the screen
//screenControl unit_screenControl();


// enabled when synthesized for board 
/*
GARO unit_GARO(); 

*/


//serialToParallel

serialToParallel unit_serialToParallel;

//uart 

uart unit_uart();




endmodule 


